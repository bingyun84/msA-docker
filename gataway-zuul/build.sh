#!/usr/bin/env bash

mvn package
docker build -t gataway-zuul:latest .