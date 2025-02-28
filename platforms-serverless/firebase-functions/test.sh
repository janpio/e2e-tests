#!/bin/sh

set -eux

func="$(cat func-tmp.txt)"

url="https://us-central1-prisma-e2e-tests-265911.cloudfunctions.net/$func"
prisma_version="$(cat ../../.github/prisma-version.txt)"

expected='{"version":"'$prisma_version'","createUser":{"id":"12345","email":"alice@prisma.io","name":"Alice"},"updateUser":{"id":"12345","email":"bob@prisma.io","name":"Bob"},"users":{"id":"12345","email":"bob@prisma.io","name":"Bob"},"deleteManyUsers":{"count":1}}'
actual=$(curl "$url")

firebase functions:log --only "$func"

if [ "$expected" != "$actual" ]; then
  echo "expected '$expected', got '$actual'"
  exit 1
fi

echo "result: $actual"
