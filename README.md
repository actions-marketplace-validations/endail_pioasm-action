# pioasm action

Compiles .pio files for use with a RP2040 PIO.

## Inputs

### `files`

**Required** Glob to match PIO files. Default is `src/*.pio`.

### `outdir`

**Required** Path to output directory. Default is `include`.

## Example usage

```yaml
name: Compile

on:
  push:
    paths:
      - "src"

jobs:
  compile-pio-job:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    name: Compile
    steps:

      - name: Checkout
        uses: actions/checkout@v3

      - uses: endail/pioasm-action@main
        with:
          files: src/*.pio
          outdir: include

      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Compile .pio files
```
