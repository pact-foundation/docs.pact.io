---
title: TLS/SSL and Proxy Configuration
---

This section describes approaches to handling TLS (often referred to as SSL) configuration, and negotiating coprorate network proxies for clients, such as our CLI tooling or Pact languages (e.g. Pact JS). For Pact Broker hosting configuration, consult the [Pact Broker Settings](/pact_broker/configuration/settings) section.

:::note
The following is general guidance that works across the Pact tooling. In some cases these settings may be specified in a language or tooling specific way. Please consult the specific documentation for these details.
:::

## TLS and Certificate Management

In the enterprise, it is common to practice to use self-signed certificates. With the advent of cheaper and even free certificates (see letsencrypt.com), this is becoming less of an issue outside of the enterprise where it is common to use internal Certificate Authority's (CA) which are not trusted by default certificate bundles distributed by tooling, browsers and OS's.

You may encounter self-signed certificates in two scenarios:

1. Using them on your HTTPS protected self-hosted Pact Broker (most common)
2. When you have a network proxy that is intercepting requests to other hosts (see the following section)

If you do need to specify a custom certificate, you can set one the following environment variables: `SSL_CERT_FILE` or `SSL_CERT_DIR` to a path that contains the appropriate certificate, or certificate chain.


### Disabling SSL verification

When using any of the Ruby based tooling or languages (e.g. the [cli](/implementation_guides/cli)), If you must disable verification altogether, you may set `PACT_DISABLE_SSL_VERIFICATION` to `true`. 

## Proxies

> A proxy server acts as a gateway between you and the internet. It’s an intermediary server separating end users from the websites they browse. Proxy servers provide varying levels of functionality, security, and privacy depending on your use case, needs, or company policy.
> 
> If you’re using a proxy server, internet traffic flows through the proxy server on its way to the address you requested. The request then comes back through that same proxy server (there are exceptions to this rule), and then the proxy server forwards the data received from the website to you.

_([source](https://faun.pub/enterprise-proxies-are-a-pain-learn-how-to-survive-the-proxy-1e28b88a16e6))_

Network proxies are often used in corporate environments as an important layer of their defence systems, however proxies introduce several issues:

1. They can inadvertently block outbound requests to hosted tools (such as a Pact Broker), and even the local mock server that runs during Pact tests
2. They break certificate chains, an important part of the trust system built into TLS, resulting in issues when connecting to remote systems

As a general rule, Pact supports network proxies through the usual means of environment variables. The following is a guide to ensuring you're best setup to work with them:

1. Ensure the `http_proxy`, `https_proxy` and the `no_proxy` directives are set as environment variables (usually, by excluding the address of the mock server such as localhost or 127.0.0.1) and also allowing access to your Pact Broker Host.
2. If you can't bypass the proxy and the proxy is intercepting your secure traffic, you will need to also configure SSL (see previous section)

If the above does not resolve your issues, you will need to speak with your network administrator to allow access to the tooling.

:::note
Our CLI and tooling does not support NTLM proxies. If you use an NTLM or Kerberos protocol proxy, you might be able to connect through an authentication proxy like [Cntlm](http://cntlm.sourceforge.net/).
:::

## Docker

This section provides some additional guidance on how to use Docker with the above information.

When you use Docker, you must first understand a few things:

1. Docker does not automatically have access to your file system
2. Docker does not automatically have access to your environment variables

If you are needing to pass in a custom certificate, you would need to volume mount (`-v`) the certificate into the container and pass in the environment variable (`-e`).

This would translate to something like this:
```
docker run -v /path/to/certificate/on/host:/path/to/certificate/in/container -e SSL_CERT_FILE=/path/to/certificate/in/container ...
```
