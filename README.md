# curltoburp
A tool to send a list of URLs to Burp using curl. For the record, I can't remember if I found this somewhere or if I wrote it myself years ago. Either way, it has helped me a lot and I hope it helps you too.

### Usage
```
curltoburp.sh list_of_urls.txt
```
### Installation
```
git clone https://github.com/shauntdergrigorian/curltoburp.git
cd ./curltoburp
chmod +x ./curltoburp.sh
./curltoburp /path/to/file.txt
```
If you receive a "permission denied" error when trying to run curltoburp.sh, you may have skipped the 3rd line above. Remember to make the file executable by running ```chmod +x curltoburp.sh``` before using it the first time.

### About
This is a quick and dirty script that can be used to feed a large number of URLs gathered using tools like gau, fuff, etc... into Burp for testing. It just reads the text file line by line and proxies it through port 8080.

### To Do
* Add options to use different user agents
* Add options to use different IP and/or port, with 127.0.0.1:8080 as the default
* Add option to accept input via pipe rather than catting a file
