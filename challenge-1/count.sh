#!/bin/bash

log_directory="$(dirname "$0")"
http_status="500"
status_count=0

for log_file in "$log_directory"/*.log; do
    if [[ -f "$log_file" ]]; then
        status_count=$(grep -c "\" $http_status " "$log_file")
        echo -e "There were \t $status_count HTTP 500 errors in $log_file in the last 10 minutes."
    fi
done