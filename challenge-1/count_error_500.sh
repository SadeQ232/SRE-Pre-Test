
now=$(date +%s)

ten_minutes_ago=$((now - 600))

log_dir="$(dirname "$0")"

log_files=$(ls "$log_dir"/*.log)

for log_file in $log_files; do

  error_count=$(grep -c "500" $log_file | head -n 10)

  echo -e "There were \t $error_count HTTP 500 errors in $log_file in the last 10 minutes."

done
