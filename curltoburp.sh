for i in $(cat $1); do
        content="$(curl -s "$i" -x http://127.0.0.1:8080 -k --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0')"
done
