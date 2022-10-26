#!/bin/sh

cd website
yarn install
yarn run build
mv build build.bak
mkdir -p build
mv build.bak build/pact-docs
