#!/bin/sh
# Adapted from the Deno installer: Copyright 2019 the Deno authors. All rights reserved. MIT license.
# Ref: https://github.com/denoland/deno_install
# TODO(everyone): Keep this script simple and easily auditable.

# TODO(mf): this should work on Linux and macOS. Not intended for Windows.

set -e

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)

if [ "$arch" = "aarch64" ]; then
	arch="arm64"
fi

if [ $# -eq 0 ]; then
	goose_uri="https://github.com/mfridman/debug-goreleaser/releases/latest/download/godebug_${os}_${arch}"
else
	goose_uri="https://github.com/mfridman/debug-goreleaser/releases/download/${1}/godebug_${os}_${arch}"
fi

goose_install="${GOOSE_INSTALL:-/usr/local}"
bin_dir="${goose_install}/bin"
exe="${bin_dir}/goose"

if [ ! -d "${bin_dir}" ]; then
	mkdir -p "${bin_dir}"
fi

curl --silent --show-error --location --fail --location --output "${exe}" "$goose_uri"
chmod +x "${exe}"

echo "godebug was installed successfully to ${exe}"
if command -v godebug >/dev/null; then
	echo "Run 'godebug' to get started"
fi
