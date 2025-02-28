#!/bin/sh

set -eu

# checks whether PRISMA_FORCE_NAPI has length equal to zero
if [[ -z "${PRISMA_FORCE_NAPI+x}" ]]; then
  BINARY_STRING=',"files":["index-browser.js","index.d.ts","index.js","query-engine-rhel-openssl-1.0.x","runtime","schema.prisma"]'
else
  BINARY_STRING=',"files":["index-browser.js","index.d.ts","index.js","libquery_engine_napi-rhel-openssl-1.0.x.so.node","runtime","schema.prisma"]'
fi

npx ts-node ../../utils/fetch-retry-and-confirm-version.ts --url https://prisma2-e2e-tests-netlify-cli.netlify.app/.netlify/functions/index --prisma-version $(sh ../../utils/prisma_version.sh) --binary-string $BINARY_STRING