#!/usr/bin/env fish

argparse h/help 'p/prefix=' -- $argv
or exit 1

if set -q _flag_help
    echo "Usage: "(status filename)" --prefix <PATH>"
    echo "Options:"
    echo "  -h/--help:   Show this help message"
    echo "  -p/--prefix: Specify the installation prefix (required)"
    exit 0
end

set -l prefix $_flag_prefix

if test -z "$prefix"
    echo "Error: --prefix is required"
    echo "Use -h or --help for usage information"
    exit 1
end

set -l rustup_home $prefix/rustup
set -l cargo_home $prefix/cargo

mkdir -p $rustup_home
mkdir -p $cargo_home

set -x RUSTUP_HOME $rustup_home
set -x CARGO_HOME $cargo_home
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile default
