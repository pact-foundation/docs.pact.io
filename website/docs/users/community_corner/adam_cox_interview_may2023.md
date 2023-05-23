---
title: Community Corner - Adam Cox
---

>
:::note Adam Cox

We talk to Adam Cox from Sky about his journey at Sky, from introducing Pact to the team, to adventures with embedded devices, websockets, and how the Pact Plugin framework is helping them push the envelope.

:::
<div><img src="https://github.com/pact-foundation/pact-ruby-standalone/assets/19932401/e2af26c8-30aa-406f-9796-2077076f488d" alt="Adam Cox" width="150" heigh="150" /></div>


>**What brought you to using Pact in the first place?**

I have been using contract testing and Pact in my team for a couple of years now. 
We needed a way of testing integrations between different web services without 
having to stand up the whole of our distributed application. Each service may rely on 
one or more other services and so testing them by allowing them to interact with 
each other became really cumbersome and fraught with issues. We were creating 
matching named branches in three or four different systems and deploying them all 
just to test some small changes for a feature branch on one of those systems. Not to 
mention the debugging involved when one of the tests failed. The overhead was 
massive and you had to know the systems really well to know which ones needed to 
be deployed in which order. 

So, we stopped doing that! Instead we started deploying just the system under test 
and used a mock server to stand in for the dependant services. This allowed us to 
perform testing of a service in a very self-contained way. The tests for that service 
only affected that service. To test the service we only had to deploy that service and 
when tests failed we knew that the issue was in the service we were changing. It 
also allowed us to test failure cases where dependant services produced errors or 
unexpected responses and ensure that our services could handle them and either 
recover gracefully or produce the correct alerts. This was very hard to achieve in the 
previous approach.

The problem with testing in this isolated way is making sure that the mocks you put 
in place actually represent the real responses being sent by the services that are 
being mocked. Contract testing is the crucial element here and Pact keeps us honest 
by ensuring that our mocked integrations are in sync with the real world at the same 
time blocks us from deploying breaking changes in our provider services. This 
allowed us to move much quicker and still have confidence in our releases. Of 
course we still employed some end-to-end testing with the whole app in a staging 
environment but we could do much less of that having a high coverage of unit, 
system and contract tests in the pipelines before a release.


>**We noticed you've been really involved in the Pact Plugin 
framework, and seem like you are getting involved in a big way. **
> 
>**It's exciting seeing users are the bleeding edge, uncovering gaps 
and feature potential for others.  How did you hear about Pact Plugins?**

To be honest, I can’t quite remember! My team and I were moved onto a new project 
guiding other teams on how best to implement contract testing as one aspect of 
moving away from relying largely on E2E tests and adopting a more shift-left 
approach. The thing with the new project is that all the software involved is running 
on embedded devices - a far cry from our usual AWS haunts! A lot of the principles 
still stood though and so we set out to identify the integration points between 
components. Some were using HTTP but most were using WebSockets to 
communicate. Unfortunately the Pact framework doesn’t support WebSockets out of 
the box and so we needed to find an alternative to the core behaviours. Luckily for 
us the Pact team had foreseen this sort of thing would come up and had already 
proposed and implemented a solution - Pact Plugins! 

So to answer your questions a bit more directly, I think likely from reading the Pact 
documentation and going through the GitHub repos. We were just lucky that this had 
already been thought about and setup, otherwise we would have had to make 
something ourselves and miss out on all the great work and community that comes 
with Pact.

>**I imagine its been quite the journey, you've been across much of 
the Pact estate, how have you found the experience?**

Fun, exciting and at times frustrating. It is software development after all 😉. The 
Pact estate is really quite awesome in all fairness. In the last two years since I 
started using it things have changed quite a bit, on my old project we were very 
much working the old way doing things in Pact v2 and using the pact-js library - 
things were a known quantity, it worked, and we didn’t need anything more.

Now it feels like we are sitting on the crest of the Pact progress wave. We’ve have to 
create a plugin to solve our use case, dive into the library code to see how things 
really work (and pinch some code 😛 - thanks Ron) and consistently refer back to 
the documentation. This is a very exciting place to be but sometimes there are 
business pressures and we need to “just get it done” and being on the bleeding edge 
can make that slower and when things don’t quite work how you thought and you 
have to re-do a load of stuff it can be frustrating.

One really awesome thing about the new Pact stuff - Rust. The core is all in Rust, 
the plugin driver is in Rust (well the one we use), the consumer library in Rust is first 
class i.e. not using the FFI and our plugin is written in Rust. I love working in Rust 
and so for me especially it has been an amazing opportunity to read and write a lot 
of Rust code and that has been so much fun - and a bit frustrating. Rust can be a bit 
frustrating sometimes 😂 

Fun, exciting and at times frustrating - yep, that sums it up I think.


>**We hear you Adam!**
<div>
<img src="https://github.com/pact-foundation/pact-ruby-standalone/assets/19932401/135cade6-5f7d-4949-9954-779a18160108" alt="Adam Cox" width="150" heigh="150" /></div>

>**Could you tell us a bit more detail about the plugin your team has 
been building, maybe we should start off with your team, (ahem: 
maybe we should have asked that earlier 😂), who are you, 
where do you work for, and what do you do?**

Ha yes, introduction time. My name is Adam and I am a Software Engineer currently 
employed by Sky. My team are a group of AWS Serverless Typescript engineers 
who like to champion Scrum practices and a “You build it, you run it” approach to 
software engineering. We build and test our own apps as well as take care of all 
parts of the architecture, design, development, release and deployment aspects of 
delivering the software that solves the business needs tasked to us. Its a really fun 
and empowering environment and we have had some pretty good results from 
working this way. We have built a few different systems as a team which are all AWS 
based and largely involve some kind of data processing pipelines for videos and 
other media.

So thats us. The plugin, its a Pact Plugin that supports contract testing over 
WebSocket connections. As I mentioned, our team has been tasked with helping 
some embedded software teams leverage Contract Testing to improve developer 
feedback time and speed up the testing and delivery process. The components 
these teams produce mostly talk JSON-RPC to each other over a WebSocket 
connection that has been established on device. Our plugin allows the consumer 
participants to record their expectations as Pact contracts and then allows the 
provider participants to validate those contracts in their CI pipelines.

>**Websockets, json-rpc, you what now?! Care to explain to those a 
bit what technologies you were trying to cover, a bit about them 
for our readers who may not be too sure, and how the Pact 
plugin is enabling you to cover new areas**

I am certainly not an expert on these topics at all, in fact I had not used WebSockets 
more than once before this project and had never heard of JSON-RPC. Turns out 
though that neither of these things are particularly complicated or scary.

WebSockets is a technology that can be used to establish a bi-directional messaging 
channel between a server and a client over a TCP connection. The client sends a 
HTTP request to the server which contains headers stating that it wants the 
connection to be “upgraded” from HTTP to a WebSocket. When the server receives 
the request it opens up a persistent connection with the client and responds that the 
connection has been upgraded. The server and the client can now send messages 
to each other over this connection. The technicals get a bit more complicated than 
that but this is the essence of it.

JSON-RPC is a standard which dictates the shape of JSON request payloads and 
their responses. Each outbound request includes the JSON-RPC spec version, the 
id of the request, the method to invoke on the server and the params to be passed to 
the method. Then the response contains the spec version, the request id and the 
result. For example:

```
Request: {"jsonrpc": "2.0", "method": "subtract", "params": {"a": 42, "b": 23}, "id":
 3} 

Response: {"jsonrpc": "2.0", "result": 19, "id": 3}
```

As messages are being sent over the WebSocket connection there could be many 
requests outbound before any response comes back and the responses may be out 
of order and so the id field helps the client correlate which responses are for which 
requests. And that’s pretty much it.

The Pact plugin gives us a the opportunity to contract test these interactions quite 
easily. Well easily now that the plugin is working, it wasn’t always easy getting that 
working! The approach is very similar to that of the normal Pact HTTP workflow. The 
plugin framework gives us the opportunities to customise the bits we need.

The plugin adds a “transport” option called “websockets” that the consumer can 
specify when writing a test. The consumer then uses the Start Mock Server API and 
this tells the plugin to start up a WebSocket server on a specific port. Then the 
consumer runs their tests and the code establishes a WS connection and sends the 
messages needed to fulfil its function. When the server receives a message it is 
compared to all of the interactions stored in the Pact and if a match is found then the 
corresponding response(s) are sent back to the consumer. The consumer receives 
the responses and then the test assertions are applied to the results as normal. 

Once all the tests are done the plugin is shut down and we get a report of all the 
requests which matched, partial matched or were not received at all. If everything 
matched then the tests pass and we upload our contracts.

The provider side is a little simpler actually. The contracts are downloaded and they 
contain an entry that says “use the websockets plugin for this interaction” and the 
pact framework just knows to load the plugin. Then before an interaction is verified it 
is sent to the plugin and we prepare the payload. Then the framework tells the plugin 
to verify the interaction and we establish a WebSocket connection to the provider 
and send off the request payload. When we get a response back from the provider 
the plugin checks that it matches what is in the contract and then sends the result 
back to the pact framework.

>**Any advice for those wanting to get involved in open source, not 
specifically Pact?**

Sadly, I am not as active in open source as I would like to be. Mostly due to time 
constraints. Although what I would say is, find something you enjoy using and if you 
find a problem with it or think of a new feature get in touch with the project owners 
and ask if they want some help. 

Alternatively, most medium to large scale OS projects have contribution guides and a 
list of Issues on GitHub that need resolving. Just pick one up and submit a PR. 
Some projects even have a “good first issue” label to help guide you with which 
issues to pick up.

>**When Adam is not behind a computer, what are they doing?**

Listening to new music, or music I already know, mostly some kind of electronic 
dance music (Jungle, DnB, Techno etc) but my tastes are eclectic and broad. 
Playing PlayStation when I rarely find some spare time. Reading about and buying 
Magic: The Gathering cards - occasionally even playing a game (see previous 
comment about finding time). 

Most importantly though, spending time with my partner and my son.

>**So long, and thanks for all the 🐟**

Thanks for the opportunity to talk here. Its been great! You guys are really smashing 
what you are doing and the community you are building is super friendly and easy to 
get in to. So keep up the good work and I look forward to our continuing journey 
together.