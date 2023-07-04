#!/bin/bash

# Lab8
# Wei Tang
# Linux Lab8
# myscript.sh
# 2023-06-13
# show menu, and execute the shell command according to user's choice

# Function to show the menu
function show_menu() {
  clear # clear the screen before show menu
  echo "Choose one of the following options:"
  echo "A Create a user account"
  echo "B Change initial group for a user account"
  echo "C Change supplementary group for a user account"
  echo "D Change default login shell for a user account"
  echo "E Change account expiration date for a user account"
  echo "F Delete a user account"
  echo "Q Quit"
  echo ""
}

# A: Function to create a user account
function create_user_acct() {
  read -p "Enter the username: " username
  read -p "Enter the user's home directory (absolute path): " home_directory
  read -p "Enter the default login shell (absolute path): " login_shell

  # Create the home directory
  if [ ! -d "$home_directory" ]; then
    mkdir -p "$home_directory"
    echo "Created the home directory: $home_directory"
  fi

  # Create the user account
  echo "Creating user account: $username"
  useradd -d "$home_directory" -s "$login_shell" "$username"
  echo "User account created successfully!"
  sleep 2
}

# B: Function to change initial group for a user account
function change_initial_group() {
  read -p "Enter the username: " username
  read -p "Enter the initial group name: " initial_group

  # Change the initial group for the user account
  echo "Changing initial group for user account: $username"
  usermod -g "$initial_group" "$username"
  echo "Initial group changed successfully!"
  sleep 2
}

# C: Function to change supplementary group for a user account
function change_supplementary_group() {
  read -p "Enter the username: " username
  read -p "Enter the supplementary group name: " supplementary_group

  # Add the supplementary group for the user account
  echo "Adding supplementary group for user account: $username"
  usermod -aG "$supplementary_group" "$username"
  echo "Supplementary group added successfully!"
  sleep 2
}

# D: Function to change default login shell for a user account
function change_login_shell() {
  read -p "Enter the username: " username
  read -p "Enter the new default login shell: " login_shell

  # Change the default login shell for the user account
  echo "Changing default login shell for user account: $username"
  chsh -s "$login_shell" "$username"
  echo "Default login shell changed successfully!"
  sleep 2
}

# E: Function to change account expiration date for a user account
function change_account_expiration() {
  read -p "Enter the username: " username
  read -p "Enter the new expiration date (YYYY-MM-DD): " expiration_date

  # Change the account expiration date for the user account
  echo "Changing account expiration date for user account: $username"
  chage --expiredate "$expiration_date" "$username"
  echo "Account expiration date changed successfully!"
  sleep 2
}

# Function to delete a user account and home directory
function delete_user_account() {
  read -p "Enter the username of the account to be deleted: " username

  # Delete the user account and home directory
  echo "Deleting user account: $username"
  userdel -r "$username"
  echo "User account deleted successfully!"
  sleep 2
}

# Function to handle invalid option
function handle_invalid_option() {
  echo "Invalid option. Please try again."
  sleep 2
}

# Main function
main() {
  choice=n       #initialize to dummy value
  show_menu
  read -p "Choose one of the options, shown above, by entering the appropriate letter: " choice
  while [ "$choice" != "Q" ] && [ "$choice" != "q" ]
  do
    if [[ $choice == [Aa] ]]; then
      create_user_acct
      clear
      sleep 3
    elif [[ $choice == [Bb] ]]; then
      change_initial_group
      clear
      sleep 3
    elif [[ $choice == [Cc] ]]; then
      change_supplementary_group
      clear
      sleep 3
    elif [[ $choice == [Dd] ]]; then
      change_login_shell
      clear
      sleep 3
    elif [[ $choice == [Ee] ]]; then
      change_account_expiration
      clear
      sleep 3
    elif [[ $choice == [Ff] ]]; then
      delete_user_account
      clear
      sleep 3
    else
      handle_invalid_option
      clear
    fi
    show_menu
    read -p "Choose one of the options, shown above, by entering the appropriate letter: " choice
  done
}

# Call the main function
main
