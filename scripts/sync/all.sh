#!/bin/sh

bundle exec ruby scripts/sync/pact_js.rb
bundle exec ruby scripts/sync/pact_jvm.rb
bundle exec ruby scripts/sync/pact_python.rb