#!/bin/bash
set -e

export OTEL_SERVICE_NAME="amaru-service"

ebpf-profiler \
  --collection-agent=127.0.0.1:4317 \
  --disable-tls
