---
title: 8. Next steps
---

If you've made it this far, you should now have a working plugin and run it in a project - how amazing is that! 🎉

## Next Steps?

Here are a few things to try to see what scenarios Pact can help you with:

* Modify the `application/foo` protocol to have a s

    * _hint_: anywhere you are reading or writing the contents of the message, you may need to parse or generate a valid `application/foo` message

* Create a transport

      * The template is based on this example plugin: https://github.com/mefellows/pact-plugin-matt
      * See if you can extend your plugin to support a custom transport
      * The guide for creating a new Protocol can be found here: https://github.com/pact-foundation/pact-plugins/blob/main/docs/protocol-plugin-design.md

* Create one of the most popular requested plugins: https://pact.canny.io/feature-requests?search=plugins

   * GraphQL, Websockets and Avro have been hotly requested - will you be the one to bring contract testing to that tech?