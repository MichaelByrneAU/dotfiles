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

cd /tmp
curl -L https://github.com/marler8997/zigup/releases/download/v2024_05_05/zigup-aarch64-macos.tar.gz | tar xz
install -d "$prefix/zigup/bin" && install zigup "$prefix/zigup/bin/zigup"
rm zigup
cd -
