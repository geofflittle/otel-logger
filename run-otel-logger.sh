#!/bin/bash
set -e

mkdir -p "$(pwd)/otel-output"

docker run --rm \
  -u $(id -u):$(id -g) \
  -v "$(pwd)/file-collector.yml":/etc/otel-collector-config.yml \
  -v "$(pwd)/otel-output":/etc/otel-collector \
  -p 4317:4317 \
  otel/opentelemetry-collector:latest \
  --config=/etc/otel-collector-config.yml
