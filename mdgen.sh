#!/bin/bash

# Default input directory & file
input_dir="."
input_file=""
run_install=false

# Help message
usage() {
    echo -e "===================================="
    echo -e "       CLI Markdown Generator"
    echo -e "====================================\n"
    echo -e "SYNOPSIS:"
    echo -e "    ./mdgen.sh [OPTION]\n"
    echo -e "Description:"
    echo -e "    Converts Markdown files to HTML."
    echo -e "    Saves them in an 'html' subfolder of the same directory.\n"
    echo -e "OPTIONS:"
    echo -e "    -d, --dir=DIRECTORY"
    echo -e "        Specify the directory containing markdown files"
    echo -e "    -f, --file=FILE"
    echo -e "        Specify a single markdown file to convert"
    echo -e "    -i, --install"
    echo -e "        Install markdown command line tool [uses apt-get]"
    echo -e "        Requires sudo privileges"
    echo -e "    -h, --help"
    echo -e "        Display this help message and exit\n"
    exit 1
}

# Parse flags
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--dir) input_dir="$2"; shift ;;
        -f|--file) input_file="$2"; shift ;;
        -i|--install) run_install=true ;;
        -h|--help) usage ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift
done

convert_single_file() {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi

    local dir
    dir="$(dirname "$file")"
    local base_name
    base_name="$(basename "${file%.md}")"
    local output_dir="$dir"
    local output_file="$output_dir/${base_name}.html"

    mkdir -p "$output_dir"
    markdown "$file" > "$output_file"
    echo -e "Converted $file -> $output_file"
}

convert_markdown_files() {
    local dir="$1"
    local output_dir="$dir/html"

    if [[ ! -d "$dir" ]]; then
        echo "Error: Input directory '$dir' does not exist."
        exit 1
    fi

    mkdir -p "$output_dir"

    local found=false
    for file in "$dir"/*.md; do
        [[ -e "$file" ]] || continue
        found=true

        local base_name
        base_name="$(basename "${file%.md}")"
        local output_file="$output_dir/${base_name}.html"

        markdown "$file" > "$output_file"
        echo -e "Converted $file -> $output_file"
    done

    if [[ "$found" = false ]]; then
        echo "No .md files found in $dir"
    fi
}

install_markdown() {
    apt-get install markdown
}

# Main execution
if [ "$run_install" = true ]; then
    echo -e "===================================="
    echo -e "       Installing Markdown CLI"
    echo -e "===================================="
    install_markdown
fi

if [ -n "$input_file" ]; then
    echo -e "===================================="
    echo -e "    Converting single markdown file"
    echo -e "===================================="
    convert_single_file "$input_file"
elif [ "$input_dir" != "." ]; then
    echo -e "===================================="
    echo -e "    Converting markdown files"
    echo -e "===================================="
    convert_markdown_files "$input_dir"
else
    usage
fi
