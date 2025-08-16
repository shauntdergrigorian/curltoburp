#!/bin/bash

# User-agent to mimic a browser
UA="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0"

# Check input
if [[ -z "$1" ]]; then
    echo "Usage: $0 <file_with_urls.txt | directory_of_txt_files>"
    exit 1
fi

# Function to send a single URL through Burp
send_to_burp() {
    url="$1"
    echo "[*] Sending: $url"
    curl -s "$url" \
        -x http://127.0.0.1:8080 \
        -k \
        -A "$UA" > /dev/null
}

# If input is a file
if [[ -f "$1" ]]; then
    echo "[+] Processing file: $1"
    while IFS= read -r url; do
        [[ -z "$url" ]] && continue
        send_to_burp "$url"
    done < "$1"

# If input is a directory
elif [[ -d "$1" ]]; then
    echo "[+] Processing directory: $1"
    find "$1" -type f -name "*.txt" | while read -r file; do
        echo "[+] Reading from: $file"
        while IFS= read -r url; do
            [[ -z "$url" ]] && continue
            send_to_burp "$url"
        done < "$file"
    done

else
    echo "[!] Error: $1 is not a valid file or directory."
    exit 1
fi

echo "[✓] Done."
