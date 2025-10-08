#!/bin/bash

# Loop indefinitely until a valid selection is made
while true; do
  # Display the menu
  echo "Select a log file:"
  echo "1) heart_rate_log.log"
  echo "2) temperature_log.log"
  echo "3) water_usage_log.log"

  # Prompt for user input
  read -p "Enter your choice: " choice

  # Use a 'case' statement to handle the user's choice
  case $choice in
    1)
      echo "You selected file name: heart_rate_log.log"
      break  # Exit the loop on valid selection
      ;;
    2)
      echo "You selected file name: temperature_log.log"
      break
      ;;
    3)
      echo "You selected file name: water_usage_log.log"
      break
      ;;
    *)
      # Handle invalid input and loop again
      echo "Invalid selection. Please enter a valid choice."
      ;;
  esac
done


