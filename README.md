# pioasm-action

Compiles .pio files for use with RP2040 PIO.

This action uses the Raspberry Pi Pico C/C++ SDK's [`pioasm` assembler](https://github.com/raspberrypi/pico-sdk/tree/master/tools/pioasm) to compile PIO files. See section 3.3 of the [RP2040 Datasheet](https://datasheets.raspberrypi.com/rp2040/rp2040-datasheet.pdf) for more details about `pioasm`.

## Inputs

### `files`

**Required**: Glob to select PIO files.

**Default**: `src/*.pio`

### `outdir`

**Required**: Path to output directory. Compiled files are **not** committed. You should use another action such as [git-auto-commit-action](https://github.com/stefanzweifel/git-auto-commit-action) if you need to commit and push them. An example is given below.

**Default**: `include`

### `format`

**Required**: pioasm output format. `c-sdk`, `python`, `hex`, or `ada`. The compiled file will have a `.h`, `.py`, `.hex`, or `.ada` extension respectively.

**Default**: `c-sdk`

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

      - uses: endail/pioasm-action@v1
        with:
          files: src/*.pio
          outdir: include
          format: c-sdk

      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Compile .pio files
          file_pattern: include/*.h
```
