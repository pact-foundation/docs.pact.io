---
title: JWT plugin (written in Lua)
sidebar_label: JWT plugin (written in Lua)
custom_edit_url: https://github.com/pact-foundation/pact-plugins/edit/main/plugins/jwt/README.md
---
<!-- This file has been synced from the pact-foundation/pact-plugins repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-plugins/tree/main/plugins


This is an example plugin supporting creating and matching signed JSON Web Tokens (JWTs) as request/response
bodies with content type `application/jwt` or `application/jwt+json`. Unlike the [CSV](/implementation_guides/pact_plugins/plugins/csv) and
[Protobuf](/implementation_guides/pact_plugins/plugins/protobuf) plugins, it is written in Lua and runs embedded directly in the driver's own process
instead of as a separate compiled gRPC server - see [Writing plugins in Lua](https://github.com/pact-foundation/pact-plugins/blob/main/docs/writing-plugin-guide.md#writing-plugins-in-lua)
for how that works and what it means for a plugin author.

Only the `RS512` (RSASSA-PKCS1-v1.5 using SHA-512) signing algorithm is supported.

## Files

- [`plugin.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/plugin.lua) - the entry point (see `entryPoint` in [`pact-plugin.json`](https://github.com/pact-foundation/pact-plugins/blob/main/pact-plugin.json)).
  Defines `init`, `configure_interaction`, and `match_contents`.
- [`jwt.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/jwt.lua) - builds/signs/decodes the JWT itself (header, payload, signature).
- [`matching.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/matching.lua) - compares an actual token's header/claims/signature/expiry against the expected
  one.
- [`utils.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/utils.lua) - small random string/hex helpers used when generating claims the consumer test didn't
  specify explicitly (`sub`, `iss`, `aud`, `jti`).
- [`base64.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/base64.lua), [`json.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/json.lua), [`inspect.lua`](https://github.com/pact-foundation/pact-plugins/blob/main/inspect.lua) - vendored third-party pure-Lua
  libraries (public domain / MIT licensed - see each file's header), used for base64 encoding, JSON encode/decode,
  and pretty-printing debug output respectively. Unrelated to JWT specifically.

## Installing the plugin

There's no build step - it's plain Lua files. Run [`install-local.sh`](https://github.com/pact-foundation/pact-plugins/blob/main/install-local.sh), which copies the plugin
directory into `$PACT_PLUGIN_DIR/jwt-0.0.0/` (or `~/.pact/plugins/jwt-0.0.0/` if `PACT_PLUGIN_DIR` isn't set):

```console
$ ./install-local.sh
Installed the jwt plugin into /home/you/.pact/plugins/jwt-0.0.0
```

## Example projects

There are three example projects in [examples/jwt](https://github.com/pact-foundation/pact-plugins/blob/main/examples/jwt) that use this plugin:

* `jwt-consumer-rust` - consumer written in Rust
* `jwt-consumer-jvm` - consumer written in Java (JUnit 5)
* `jwt-provider-rust` - provider written in Rust

See [examples/jwt/README.md](https://github.com/pact-foundation/pact-plugins/blob/main/examples/jwt/README.md) for how to run them.

## Configuring an interaction

The consumer test supplies the data to sign the token from, as the interaction's request/response contents (in
pseudo config):

```javascript
"request.contents": {
  "pact:content-type": "application/jwt+json",
  "audience": "1234566778",     // "aud" claim
  "subject": "slksjkdjkdks",    // "sub" claim
  "issuer": "ldsdkdalds",       // "iss" claim
  "algorithm": "RS512",         // only RS512 is supported
  "key-id": "key-112345564",    // "kid" header, optional
  "private-key": "-----BEGIN RSA PRIVATE KEY-----\n..."  // PKCS#1 PEM, required
}
```

`private-key` is the only required field - the rest (`audience`/`subject`/`issuer`/`key-id`) default to random
values if omitted, and `algorithm` defaults to `RS512` (the only one currently supported). A `public-key` field is
also accepted if you'd rather supply it directly than have the plugin derive it from the private key.

The plugin signs a fresh token from this data (with a 5 minute expiry, plus standard `jti`/`iat` claims), and
persists only the **public** key and algorithm into the Pact file - never the private key. Verification only ever
needs to validate a signature, never mint one.

## Matching an interaction

When verifying an actual token against the expected one, the plugin checks, in order:

1. **Signature** - the actual token's signature must validate against the persisted public key.
2. **Expiry** - the actual token's `exp` claim must not be in the past (and `nbf`, if present, must not be in the
   future).
3. **Header** - `typ` and `alg` are compulsory and compared exactly; only registered JWT header names
   (`alg`, `jku`, `jwk`, `kid`, `x5u`, `x5c`, `x5t`, `x5t#S256`, `typ`, `cty`, `crit`) are allowed; `jku` is
   ignored (present or not, its value isn't compared).
4. **Claims** - `iss`, `sub`, `aud` are compulsory and compared exactly; any other claims are allowed and compared
   exactly too, except `exp`/`nbf`/`iat`/`jti` which are always ignored (since they're timestamps/random values
   that legitimately differ between the expected and actual token).

## Compatibility

Requires a driver with Lua plugin support - as of this writing, that isn't in a released version yet; you'll need
`pact-plugin-driver` and `io.pact.plugin.driver:core` built from this repository's `lua-plugins` branch (Rust: the
default-enabled `lua` cargo feature; JVM: build and `publishToMavenLocal`). See
[examples/jwt/README.md](https://github.com/pact-foundation/pact-plugins/blob/main/examples/jwt/README.md) for the exact steps, including how to verify the provider
against a locally-built `pact_verifier_cli` in the meantime, since no released provider-verification CLI/library
includes Lua plugin support yet either.
