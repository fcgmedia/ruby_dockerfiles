#!/bin/bash
# Builds container

# Stop on error
set -e
RUBY_VERSIONS='2.0.0-p481 2.1.2'
for version in $RUBY_VERSIONS
do
  echo "Building Ruby $version Container..."
  echo "# Generated from Dockerfile for ruby $version" > Dockerfile
  cat Dockerfile.template | sed "s/RUBY_VERSION/$version/g" >> Dockerfile && \
  docker build -t ${DOCKER_HOST}joemocha/ruby:$version .
done

