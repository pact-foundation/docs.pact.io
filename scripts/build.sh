#!/bin/sh

cd website
npm install
npm run build
mv build build.bak
mkdir -p build
mv build.bak build/pact-docs
