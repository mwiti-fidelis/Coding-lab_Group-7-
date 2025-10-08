#!/bin/bash


cd hospital_data

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
      #code to move the selected log_file to it's designated archive folder
      mv active_logs/heart_rate.log archived_logs/heart_data_archive
      #moving now to the heart_data_archive directory where the log file archiving takes place
      cd archived_logs/heart_data_archive
      #rename the file before archiving
      
      current_date=$(date +"%F_%H-%M-%S")
      arch_file="heart_rate_${current_date}.log"
      mv heart_rate.log "${arch_file}"

      #archiving the file 
      echo "Archiving heart_rate.log........"
      tar -cf "${arch_file}.tar" "${arch_file}"
      echo "Successfully archived to $(pwd)/${arch_file}"      
      #code to move out from the heart_data_archive
      cd ../../active_logs
      touch heart_rate.log #creates the new heart_rate.log file
      cd .. #move back to hospital_data
      break  # Exit the loop on valid selection
      ;;

    2)
      echo "You selected file name: temperature_log.log"
      #code to move the selected log_file to it's designated archive folder
      mv active_logs/temperature.log archived_logs/temperature_data_archive
      #moving now to the temperature_data_archive directory where the log file archiving takes place
      cd archived_logs/temperature_data_archive
      #rename the file before archiving

      current_date=$(date +"%F_%H-%M-%S")
      arch_file="temperature_${current_date}.log"
      mv temperature.log "${arch_file}"

      #archiving the file
      echo "Archiving temperature.log........"
      tar -cf "${arch_file}.tar" "${arch_file}"
      echo "Successfully archived to $(pwd)/${arch_file}"
      #code to move out from the heart_data_archive
      cd ../../active_logs
      touch temperature.log #creates the new log file
      cd .. #move back to hospital_data
      break
      ;;
    3)
      echo "You selected file name: water_usage_log.log"
      #code to move the selected log_file to it's designated archive folder
      mv active_logs/water_usage.log archived_logs/water_usage__data_archive
      #moving now to the water_usage_data_archive directory where the log file archiving takes place
      cd archived_logs/water_usage_data_archive
      #rename the file before archiving

      current_date=$(date +"%F_%H-%M-%S")
      arch_file="water_usage_${current_date}.log"
      mv water_usage.log "${arch_file}"

      #archiving the file
      echo "Archiving water_usage.log........"
      tar -cf "${arch_file}.tar" "${arch_file}"
      echo "Successfully archived to $(pwd)/${arch_file}"
      #code to move out from the water_usage_data_archive
      cd ../../active_logs
      touch water_usage.log #creates the new log file
      cd .. #move back to hospital_data
      break
      ;;
    *)
      # Handle invalid input and loop again
      echo "Invalid selection. Please enter a valid choice."
      ;;
  esac
done


