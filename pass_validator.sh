#!/bin/bash

password=$1
len="${#password}"

if test $len -ge 10 ; then

    echo "$password" | grep -q [0-9]
     if test $? -eq 0 ; then
           echo "$password" | grep -q [A-Z]
                if test $? -eq 0 ; then
                    echo "$password" | grep -q [a-z]   
                      if test $? -eq 0 ; then
                       echo "$(tput setaf 2)Strong password"
                   else
                       echo "$(tput setaf 1)weak password, please includes also lower case chart"
                   fi
            else
               echo "$(tput setaf 1)weak password, please include capital chart" 
            fi
     else
       echo "$(tput setaf 1)please include numbers in the password"   
     fi
else
    echo "$(tput setaf 1)weak password the password lenght should be equal 10"
fi