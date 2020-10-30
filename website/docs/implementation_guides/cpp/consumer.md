---
title: C++ Consumer DSL
custom_edit_url: https://github.com/pact-foundation/pact-cplusplus/edit/master/consumer/README.md
---
<!-- This file has been synced from the pact-foundation/pact-cplusplus repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This is a shared library (pact-cpp-consumer) that you can link into your test binaries and it provides a DSL for setting up and running a consumer test. It wraps the Pact-Rust [pact_mock_server_ffi](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_mock_server_ffi) library, which will need to be linked as well.

## Using the DSL

Documentation is [here in html](https://docs.pact.io/cpp_docs/consumer/annotated.html). For an example, see [consumer_test.cpp](https://github.com/pact-foundation/pact-cplusplus/blob/master/consumer/test/src/consumer_test.cpp).

### Setup the expectations 

Firstly, you need to instantiate an instance of `pact_consumer::Pact` in your test. This class takes the name of the consumer
and provider as parameters, and can then be used to define the expectations.

For instance:

```cpp
  auto provider = Pact("TodoAppCpp", "TodoServiceCpp");
  provider
    .given("i have a list of projects")
    .uponReceiving("a request for projects")
    .withRequest("GET", "/projects")
    .withQuery(query)
    .withHeaders(headers)
    .willRespondWith(200)
    .withResponseHeaders(res_headers)
    .withResponseJsonBody(Object({
      { "projects", EachLike(Object({
        { "id", Integer(3) },
        { "name", Like("Project 1") },
        { "due", DateTime("yyyy-MM-dd'T'HH:mm:ss.SSSX") },
        { "tasks", AtLeastOneLike(4, Object({
          { "id", Integer() },
          { "name", Matching("Task \\d+", "Task 1") },
          { "done", Like(true) }
        }))}
      }))}
    }));
```

#### Matchers

For defining JSON bodies, there are a number of matcher functions that can be used with the `withJsonBody` and `withResponseJsonBody` methods.

##### `Object(const std::unordered_map<std::string, IMatcher::Ptr> fields)`

Represents a JSON object (map of string fields to matchers).

##### `Integer(long value)`

Matchers an integer value (must be a number and have no decimal places).

##### `Integer(int value)`

Matchers an integer value (must be a number and have no decimal places).

##### `Integer()`

Matchers an integer value (must be a number and have no decimal places). A random example value will be generated.

##### `Like(long value)`

Matchers any value based on the value type.

##### `Like(int value)`

Matchers any value based on the value type.

##### `Like(double value)`

Matchers any value based on the value type.

##### `Like(std::string value)`

Matchers any value based on the value type.

##### `Like(const char *value)`

Matchers any value based on the value type.

##### `Like(bool value)`

Matchers any value based on the value type.

##### `DateTime(std::string format, std::string example)`

String value that must match the provided datetime format string. See [Java SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html).

##### `DateTime(std::string format)`

String value that must match the provided datetime format string. See [Java SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html). Example values will be generated using the current system date and time.

##### `Date(std::string format, std::string example)`

String value that must match the provided date format string. See [Java SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html).

##### `Date(std::string format)`

String value that must match the provided date format string. See [Java SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html). Example values will be generated using the current system date and time.


##### `Time(std::string format, std::string example)`

String value that must match the provided time format string. See [Java SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html).

##### `Time(std::string format);

String value that must match the provided time format string. See [Java SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html). Example values will be generated using the current system date and time.


##### `Matching(std::string regex, std::string example)`

String value that must match the regular expression.

##### `Matching(std::string regex)`

String value that must match the regular expression. Random values will be generated for the examples.

##### `EachLike(const IMatcher::Ptr obj)`

Array of values where each item in the array must match the provided template. Will generate an example array with one value.

##### `EachLike(int examples, const IMatcher::Ptr obj)`

Array of values where each item in the array must match the provided template. `examples` defines how many examples should
be generated in the example array.

##### `AtLeastOneLike(const IMatcher::Ptr obj)`

Array of values that must have at least one value and each item in the array must match the provided template. Will generate an example array with one value.

##### `AtLeastOneLike(int examples, const IMatcher::Ptr obj)`

Array of values that must have at least one value and each item in the array must match the provided template.`examples` defines how many examples should be generated in the example array.

##### `HexValue(const std::string example)`

Match a hexadecimal string value.

##### `HexValue()`

Match a hexadecimal string value. Random example will be generated.

##### `IPAddress(const std::string example)`

Match an IP Address.

##### `IPAddress()`

Match an IP Address. Will use 127.0.0.1 for examples.

##### `Numeric(int example)`

Match any numeric value. This will match any numeric type (integer or floating point).

##### `Numeric(long example)`

Match any numeric value. This will match any numeric type (integer or floating point).

##### `Numeric(float example)`

Match any numeric value. This will match any numeric type (integer or floating point).

##### `Numeric(double example)`

Match any numeric value. This will match any numeric type (integer or floating point).

##### `Numeric()`

Match any numeric value. Random decimal values will be generated for examples.

##### `Decimal(float example)`

Match a decimal value (number with atleast one digit after the decimal point).

##### `Decimal(double example)`

Match a decimal value (number with atleast one digit after the decimal point).

##### `Decimal()`

Match a decimal value (number with atleast one digit after the decimal point). Random values will be generated.

##### `Uuid(const std::string example)`

Match a universally unique identifier (UUID).

##### `Uuid()`

Match a universally unique identifier (UUID). Random values will be used for examples.

##### `AtMostLike(int max, const IMatcher::Ptr obj)`

Array with maximum size and each element like the template object. Will generate an example array with one value.

##### `AtMostLike(int max, int examples, const IMatcher::Ptr obj)`

Array with maximum size and each element like the template object. `examples` defines how many examples should
be generated in the example array.

##### `MinArrayLike(int min, const IMatcher::Ptr obj)`

Array with minimum size and each element like the template object. Will generate an example array with one value.

##### `MinArrayLike(int min, int examples, const IMatcher::Ptr obj)`

Array with minimum size and each element like the template object. `examples` defines how many examples should
be generated in the example array.

##### `ConstrainedArrayLike(int min, int max, const IMatcher::Ptr obj)`

Array with minimum and maximum size and each element like the template object. Will generate an example array with one value.

##### `ConstrainedArrayLike(int min, int max, int examples, const IMatcher::Ptr obj)`

Array with minimum and maximum size and each element like the template object. `examples` defines how many examples should
be generated in the example array.

##### `EqualTo(int value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `EqualTo(long value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `EqualTo(float value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `EqualTo(double value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `EqualTo(std::string value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `EqualTo(const char *value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `EqualTo(bool value)`

Match by equality. This is mainly used to reset the cascading type matchers.

##### `IncludesStr(std::string value)`

Matches if the string value contains the given value.

##### `NullValue()`

Matches a JSON null value.

##### `Url(std::string basePath, std::vector<IMatcher::Ptr> pathFragments)`

Matches a URL composed of a base path and a list of path fragments. The path fragments can be matched using the either `EqualTo` or `Matching` matchers.

for example:

```cpp
Object({ "url", Url("http://localhost/tasks", { EqualTo("1001"), Matching("\\d+", "200") }) })
```

This will generate 

```json
{
  "url": "http://localhost/tasks/1001/200"
}
```

and configure a regex matcher to match `.*\/1001\/\d+$`

##### `ArrayContaining(std::vector<IMatcher::Ptr> variants)`

Matches the items in an array against a number of variants. Matching is successful if each variant 
 occurs once in the array. Variants may be objects containing matching rules.

for example:

```cpp
ArrayContaining({ Object({ { "id", Integer(3) } }), Matching("\\d+", "100") })
```

This will generate two variants, one to match an object with a integer `id` attribute and one to match a string against the regular expression.

### Execute the test

The actual test is then run with the `run_test` method. This takes a clsoure to execute and will startup a mock server before and the validate the result afterwards.

For example:

```cpp
auto result = provider.run_test([] (auto mock_server) {
    // setup any client code you have. The mock_server parameter has the base address of the mock server started for the test
    TodoClient todo;
    todo.serverUrl = mock_server->get_url();

    std::vector<Project> projects = todo.getProjects();

    return true; // return a boolean value here to indicate if all is OK
});
```

The `run_test` method will return a `PactTestResult`. Your test should check that this value is ok.

## Using the Conan package

The library has been released to Bintray as a Conan package. To use it in your project, you need to add https://api.bintray.com/conan/pact-foundation/conan as a remote.

For example:

```console
$ conan remote add pact-foundation https://api.bintray.com/conan/pact-foundation/conan
$ conan search pact_cpp_consumer -r=pact-foundation
Existing package recipes:

pact_cpp_consumer/0.0.4@pact/beta
```

You can then use the library by adding `pact_cpp_consumer/0.0.4@pact/beta` to the dependencies to your project conan file.

## Building the library

To build the library, you need to do the following:

1. Install Python
2. Install CMake
3. Install a C++ compiler
4. Use python/pip to install conan

```
pip install wheel setuptools
pip install conan
```

5. Create a build directory and cd into it
6. use conan to install all the dependencies

```
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
conan remote add pact-foundation https://api.bintray.com/conan/pact-foundation/conan
conan install .. --build missing
```

7. use cmake to build the library

```
 cmake ..
 cmake --build . --config Release
```

On Windows, you may need to set 64 bit architecture.

```
cmake .. -A x64
cmake --build . --config Release
```
