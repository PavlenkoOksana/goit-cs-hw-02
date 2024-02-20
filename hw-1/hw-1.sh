#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

for site in "${websites[@]}"; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}\\n" "$site")

    # Перевірка HTTP статус-коду
    if [ "$status_code" == "200" ]; then
        echo "$site is UP" >> "$log_file"
    else
        echo "$site is DOWN" >> "$log_file"
    fi
done

echo "Результати записано у файл логів: $log_file"

