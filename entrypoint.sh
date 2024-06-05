#!/usr/bin/env bash

set -e

echo "Setting up gem credentials..."
mkdir -p ~/.gem
cat << EOF > ~/.gem/credentials
---
:rubygems_api_key: ${RUBYGEMS_API_KEY}
EOF

chmod 0600 ~/.gem/credentials

echo "Installing dependencies..."
bundle install

echo "Build gem..."
gem build --output=latest-release.gem

if [[ ${PUBLISH} == 'true' ]]; then
    echo "Pushing the built gem to RubyGems.org"
    gem push latest-release.gem
else
    echo "Skipping push"
fi
