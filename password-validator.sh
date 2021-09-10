#! /bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
PASSWORD=$1

# If the password length are less than 10.
if [ "${#PASSWORD}" -lt "10" ] 
    then
        echo -e "${RED}Invalid password, password must be at least 10 characters."
        exit 1
# If the password contains characters other than letters and numbers.
elif [[ ! "$PASSWORD"  =~ ^[[:alnum:]]+$ ]];
    then 
        echo -e "${RED}Invalid password, password must contain only numeric and alphabetic characters."
        exit 1
# If the password contains only alphabetic or only numeric characters.
elif [[  "$PASSWORD"  =~ ^[[:digit:]]+$ ]] || [[  "$PASSWORD"  =~ ^[[[:alpha:]]+$ ]];
    then
        echo -e "${RED}Invalid password, password must contain both numeric and alphabetic characters."
        if [[  "$PASSWORD"  =~ ^[[:digit:]]+$ ]];
            then    
                echo -e "${RED}Missing: Alphabetic characters."
        else
                echo -e "${RED}Missing: Numeric characters."
        fi
        exit 1
# If the password not contain upper or lower letters.
elif [[ ! "$PASSWORD" =~ [[:lower:]] ]] || [[ ! "$PASSWORD" =~ [[:upper:]] ]];
    then
        echo -e "${RED}Invalid password, password must contain at least one capital and one small letter."
        if [[ ! "$PASSWORD" =~ [[:lower:]] ]];
            then
                echo -e "${RED}Missing: Lowercase letters."
        else
                echo -e "${RED}Missing: Uppercase letters."
        fi
        exit 1
# Valid Password.
else
    echo -e "${GREEN}Congratulations, You have entered a valid password!"
    exit 0
fi