## Webhook Whitelist

To ensure that webhooks cannot be used maliciously to expose either data about your contracts or your internal network, the following validation rules are applied to webhooks via the Pact Broker [webhook whitelist configuration settings](/pact_broker/configuration/features#webhook-whitelists) .

* **Scheme**: Must be included in the `webhook_scheme_whitelist`, which by default only includes `https`. You can change this to include `http` if absolutely necessary, however, keep in mind that the body of any http traffic is visible to the network. You can load a self signed certificate into the Pact Broker to be used for https connections using [script/insert-self-signed-certificate-from-url.rb](https://github.com/pact-foundation/pact_broker/blob/master/script/insert-self-signed-certificate-from-url.rb) in the Pact Broker Github repository.
* **HTTP method**: Must be included in the `webhook_http_method_whitelist`, which by default only includes `POST`. It is highly recommended that only `POST` requests are allowed to ensure that webhooks cannot be used to retrieve sensitive information from hosts within the same network.
* **Host**: If the `webhook_host_whitelist` contains any entries, the host must match one or more of the entries. By default, it is empty. For security purposes, if the host whitelist is empty, the response details will not be logged to the UI \(though they can be seen in the application logs at debug level\).

  The host whitelist may contain hostnames \(eg `"github.com"`\), domains beginning with `*` \(eg. `"*.foo.com"`\), IPs \(eg `"192.0.345.4"`\), network ranges \(eg `"10.0.0.0/8"`\) or regular expressions \(eg `/.*\.foo\.com$/`\). Note that IPs are not resolved, so if you specify an IP range, you need to use the IP in the webhook URL. If you wish to allow webhooks to any host \(not recommended!\), you can set `webhook_host_whitelist` to `[/.*/]`. Beware of any sensitive endpoints that may be exposed within the same network.

  The recommended set of values to start with are:

  * your CI server's hostname \(for triggering builds\)
  * your company chat \(eg. Slack, for publishing notifications\)
  * your code repository \(eg. Github, for sending commit statuses\)

  Alternatively, you could use a domain beginning with a `*` to limit requests to your company's domain.

  Note that the hostname/domain matching follows that used for SSL certificate hostnames, so `*.foo.com` will match `a.foo.com` but not `a.b.foo.com`. If you need more flexible matching because you have domains with variable "parts" \(eg `a.b.foo.com`\), you can use a regular expression \(eg `/.*\.foo\.com$/` - don't forget the end of string anchor\). You can test Ruby regular expressions at [rubular.com](http://rubular.com).
