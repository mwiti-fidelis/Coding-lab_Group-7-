#!/bin/bash
HEART_LOG="active_logs/heart_rate.log"
TEMP_LOG="active_logs/temperature.log"
WATER_LOG="active_logs/water_usage.log"
mkdir -p "$(dirname "$REPORT_FILE")"
while true; do
echo ""
echo "select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (tempearature.log)"
echo "3) Water usage (water_usage.log)"
read -p "Enter your choice (1-3): " choice 
case "$choice" in 
1) selected_log="$HEART_LOG"; log name="Heart rate log"; break ;;
2) selected_log="$TEMP_LOG";  log name="Temperature log"; break ;;
3) selected_log="$WATER_LOG"; log name="Water usage log"; break ;;
esac
done
if [[ ! -f "selected_log"]]; then 
echo "log file 'selected_log' not found!"
exit 1 
fi
{
  echo "----------------------------------------"
  echo "Analysis Report for $log_name"
  echo "Date: $(date)"
  echo ""
  echo "Device Activity Summary:"
} >> "$REPORT_FILE"
awk '{print $1}' "$selected_log" | sort | uniq -c | awk '{printf "  %s: %d entries\n", $2, $1}' >> "$REPORT_FILE"
first_ts=$(awk 'NF{print $2; exit}' "$selected_log")
last_ts=$(awk 'NF{t=$2} END{if (t) print t; else print "N/A"}' "$selected_log")
{
  echo ""
  echo "First Entry Timestamp: ${first_ts:-N/A}"
  echo "Last Entry Timestamp:  ${last_ts:-N/A}"
  echo "----------------------------------------"
  echo ""
} >> "$REPORT_FILE"
echo ""
echo "Analysis complete for: $log_name"
echo "Results appended to: $REPORT_FILE"
echo ""

