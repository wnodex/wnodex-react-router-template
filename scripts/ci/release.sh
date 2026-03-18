#!/bin/bash
set -e

echo "🚀 Configuring Git for release..."
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

echo "📦 Running release with pnpm release..."
export LEFTHOOK=0
pnpm release --ci
