# pioasm action

Compiles a .pio file for use with a RP2040 PIO.

## Inputs

### `format`

pioasm output format: `c-sdk` (default), `python`, or `hex`

### `in`

**Required** Input .pio file

## Outputs

### `out`

Output from pioasm.

## Example usage

```yaml
uses: endail/pioasm-action@v1
with:
    format: c-sdk
    in: helloworld.pio
```
