# pioasm-action

Assembles .pio files for use with RP2040 PIO.

This action uses the Raspberry Pi Pico C/C++ SDK's [`pioasm` assembler](https://github.com/raspberrypi/pico-sdk/tree/master/tools/pioasm) to assemble PIO files. See section 3.3 of the [SDK documentation](https://datasheets.raspberrypi.com/pico/raspberry-pi-pico-c-sdk.pdf) for more details about `pioasm`.

## Inputs

### `files`

**Required**: Glob to select PIO files.

**Default**: `src/*.pio`

### `outdir`

**Required**: Path to output directory. Assembled files are **not** committed. You should use another action such as [git-auto-commit-action](https://github.com/stefanzweifel/git-auto-commit-action) if you need to commit and push them. An example is given below.

**Default**: `include`

### `format`

**Required**: pioasm output format. `c-sdk`, `python`, `hex`, or `ada`. The assembled file will have a `.h`, `.py`, `.hex`, or `.ada` extension respectively.

**Default**: `c-sdk`

## Example usage

```yaml
name: Assemble

on:
  push:
    paths:
      - "src"

jobs:
  assemble-pio-job:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    name: Assemble
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
          commit_message: Assemble .pio files
          file_pattern: include/*.h
```
