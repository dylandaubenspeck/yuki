#!/bin/bash

# Remove ESLint and Prettier config files
find . -type f \( \
  -name ".eslintrc.js" -o \
  -name ".eslintrc.json" -o \
  -name ".eslintrc.yml" -o \
  -name ".eslintrc.yaml" -o \
  -name ".eslintignore" -o \
  -name "eslint.config.js" -o \
  -name ".prettierrc" -o \
  -name ".prettierrc.js" -o \
  -name ".prettierrc.json" -o \
  -name ".prettierrc.yml" -o \
  -name ".prettierrc.yaml" -o \
  -name ".prettier.config.js" -o \
  -name ".prettierignore" \
\) -delete

# Remove ESLint and Prettier cache directories
rm -rf .eslintcache .prettiercache

# Remove ESLint and Prettier dependencies from all package.json files
find . -name "package.json" -exec sed -i '' \
  -e '/"eslint"/d' \
  -e '/"@typescript-eslint/d' \
  -e '/"prettier"/d' \
  -e '/"@yuki\/prettier-config"/d' \
  -e '/"@yuki\/eslint-config"/d' \
  {} +

# Remove the prettier config from root package.json
sed -i '' '/"prettier":/d' package.json 

# Remove format and lint related scripts from all package.json files
find . -name "package.json" -exec sed -i '' \
  -e '/"format":/d' \
  -e '/"format:fix":/d' \
  -e '/"lint":/d' \
  -e '/"lint:fix":/d' \
  {} +

# Remove ESLint and Prettier tooling directories
rm -rf tooling/eslint
rm -rf tooling/prettier

# Remove ESLint config files from packages
find ./packages -name "eslint.config.js" -delete
find ./apps -name "eslint.config.js" -delete 