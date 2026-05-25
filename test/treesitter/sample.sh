#!/usr/bin/env bash
# Bash sample

greet() {
  local name="$1"
  echo "Hello, ${name}"
}

greet "world"
