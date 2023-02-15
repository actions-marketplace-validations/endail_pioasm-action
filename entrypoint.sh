#!/bin/bash

# inputs
in_files=$1
in_outdir=$2
in_format=$3

# if $outdir is empty, set outpath to current dir of piofile
if [ -z $in_outdir ]; then
    outdir="."
else
    outdir=$in_outdir
fi

# set proper extension
case $in_format in
    c-sdk)
        ext="h"
        ;;
    python)
        ext="py"
        ;;
    hex)
        ext="hex"
        ;;
    *)
        exit 1
        ;;
esac

echo "PIOASM_DIR is $PIOASM_DIR"
echo "Looking for files in $in_files"
echo "Using format $in_format with extension $ext"
echo "Writing to $in_outdir"

for piofile in $in_files; do

    if [ ! -f "$piofile" ]; then
        echo "$piofile not found; skipping"
        continue
    fi

    dest="$outpath/$(basename $piofile).$ext"
    "$PIOASM_DIR/pioasm" "$piofile" >> $dest
    echo "pioasm compiled file written to $dest"

done
