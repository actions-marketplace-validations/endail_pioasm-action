#!/bin/bash

# inputs
in_files=$1;
in_outdir=$2;
in_format=$3;

if [ -z $PIOASM ]; then
    echo "pioasm binary is missing";
    exit 1;
fi

if [ -z $in_files ]; then
    echo "no input files specified";
    exit 1;
fi

# if $outdir is empty, set outpath to current dir of piofile
if [ -z $in_outdir ]; then
    outdir=".";
    echo "output directory not given; defaulting to current directory";
else
    outdir=$in_outdir;
fi

# set proper extension
case $in_format in
    c-sdk)
        ext="h";
        ;;
    python)
        ext="py";
        ;;
    hex)
        ext="hex";
        ;;
    ada)
        ext="ada";
        ;;
    *)
        echo "pioasm output format unknown or invalid";
        exit 1;
        ;;
esac

echo "pioasm located at $PIOASM";
echo "Looking for files in $in_files";
echo "Using format $in_format with extension $ext";
echo "Writing to $outdir";

# make sure destination exists
mkdir -p "$outdir";

for piofile in $in_files; do

    if [ ! -f "$piofile" ]; then
        echo "$piofile not found; skipping";
        continue;
    fi

    dest="$outdir/$(basename $piofile).$ext";
    "$PIOASM" -o "$in_format" "$piofile" "$dest";
    echo "pioasm compiled file written to $dest";

done

echo "finished compiling pio files";
