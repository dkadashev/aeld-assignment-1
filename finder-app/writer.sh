#!/bin/sh

set -e

me="$(basename $0)"

show_usage_and_die()
{
    echo "Error: $1" >&2
    echo "Usage: $me WRITEFILE WRITESTR"
    echo "Create a file named WRITEFILE with content WRITESTR"
    exit 1
}

if [ "$#" -lt "2" ]; then
    show_usage_and_die "Not enough arguments."
elif [ "$#" -gt "2" ]; then
    show_usage_and_die "Too many arguments."
fi

writefile="$1"
writestr="$2"
target_dir="$(dirname "$writefile")"

if ! [ -d "$target_dir" ]; then
    mkdir -p "$target_dir"
fi

echo "$writestr" >"$writefile" || exit 1
