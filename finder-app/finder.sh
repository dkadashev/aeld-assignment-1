#!/bin/sh

set -e

me="$(basename $0)"

show_usage_and_die()
{
    echo "Error: $1" >&2
    echo "Usage: $me FILESDIR SEARCHSTR"
    echo "Count number of files in FILESDIR and number of lines in those files containing SEARCHSTR"
    exit 1
}

if [ "$#" -lt "2" ]; then
    show_usage_and_die "Not enough arguments."
elif [ "$#" -gt "2" ]; then
    show_usage_and_die "Too many arguments."
fi

filesdir="$1"
searchstr="$2"

if ! [ -d "$filesdir" ]; then
    show_usage_and_die "FILESDIR must be an existing directory"
fi

fcount="$(find "$filesdir" -type f | wc -l)"
lcount="$(grep -R "$searchstr" "$filesdir" | wc -l)"

echo "The number of files are $fcount and the number of matching lines are $lcount"
