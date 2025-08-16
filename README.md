# curltoburp

This is a tool that sends a list of URLs through a Burp Suite proxy for testing or interception.  
It supports reading from either a single text file or a directory of `.txt` files.

## Requirements

- A Unix-like environment (Linux, macOS, or WSL on Windows).  
- `curl` installed.  
- A running **Burp Suite proxy** on `127.0.0.1:8080` (default).  

## Usage

1. Download or clone the repository

```
git clone https://github.com/shauntdergrigorian/curltoburp.git
```

2. Make the script executable:

```
cd curltoburp
chmod +x curltoburp.sh
```

3. Run it with either:  

- A single file containing URLs:  

```bash
./curltoburp.sh urls.txt
```

- A directory containing multiple `.txt` files (each with URLs):  

```bash
./curltoburp.sh url_lists/
```

## Example Input

**urls.txt**

```
https://example.com
https://example.org/login
```

## Example Output

```
[+] Processing file: urls.txt
[*] Sending: https://example.com
[*] Sending: https://example.org/login
[✓] Done.
```

## Behavior

- The script reads each line of the input file(s).  
- Empty lines are skipped.  
- Each URL is sent via `curl` using:  
  - Proxy: `127.0.0.1:8080`  
  - User-Agent: Firefox (Linux x86_64)  
  - `-k` flag to ignore SSL/TLS certificate errors.  
- Responses are discarded (`> /dev/null`), since the goal is to forward requests to Burp.  

## To Do

- Add option to **specify different User-Agents** (instead of a hardcoded Firefox UA).  
- Add option to **configure proxy IP and port**, with `127.0.0.1:8080` as the default.  

## License

This script is provided under the MIT License. See the [LICENSE](LICENSE) file for details.
