[![StepSecurity Maintained Action](https://raw.githubusercontent.com/step-security/maintained-actions-assets/main/assets/maintained-action-banner.png)](https://docs.stepsecurity.io/actions/stepsecurity-maintained-actions)


# SwiftWasm GitHub Action

This action builds your project with the SwiftWasm toolchain and SDK, and has [`carton`](https://carton.dev) and its WebAssembly dependencies preinstalled.

## Inputs

### `shell-action`

**Optional** The shell command to run on your project. Default is `carton test`.

## Example usage

```yml
name: Build and test with SwiftWasm

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  swiftwasm_build:
    runs-on: ubuntu-22,04

    steps:
      - uses: actions/checkout@v7
      - uses: step-security/swiftwasm-action@v5
        with:
          shell-action: carton test
```

## Usage with GitHub Pages

[GitHub Pages](https://pages.github.com/) is an easy way to host SwiftWasm apps. Follow [the GitHub Pages guide](https://guides.github.com/features/pages/), and then use an appropriate action after running `carton bundle` to publish the results:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  swiftwasm_deploy:
    runs-on: ubuntu-22.04

    steps:
      - uses: actions/checkout@v7

      - uses: step-security/swiftwasm-action@v5
        with:
          shell-action: carton bundle
      - uses: actions/upload-pages-artifact@v5
        with:
          path: ./Bundle

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - id: deployment
        uses: actions/deploy-pages@v5
```
