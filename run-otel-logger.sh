#!/bin/bash
set -e

mkdir -p "$(pwd)/otel-output"
chmod 777 "$(pwd)/otel-output"

docker run --rm \
  -v "$(pwd)/file-collector.yml":/etc/otel-collector-config.yml \
  -v "$(pwd)/otel-output":/etc/otel-collector \
  -p 4317:4317 \
  otel/opentelemetry-collector:latest \
  --config=/etc/otel-collector-config.yml