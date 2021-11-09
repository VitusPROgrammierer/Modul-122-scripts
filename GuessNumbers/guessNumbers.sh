#!/bin/bash
#
# Name: guessNumber.sh - Generiert eine Zahl zwischen 1 - 20.
# -----------------
# SYNOPSIS: guessNumbers.sh
# Description: Generiert eine Zahl zwischen 1 - 20. Der User hat 7 Versuche die Zahl zu erraten.
#
# guessNumbers.sh
#
# Autor: Vitus Lindemann
# Datum: 06.10.2021


numberRegex='^[0-9]+$'
# Generiert eine zufällige Zahl zwischen 1 - 20
randomNumber=$[$RANDOM %20 +1]
tries=7

echo "==============================================="
echo "Enter a Number between 1 and 20: "
echo "==============================================="
until [[ $randomNumber -eq $playerNumber ]];
do
  # Schaut ob der User noch Versuche übrig hat.
  if [[ $tries -gt 0 ]];
  then
    echo "Tries: $tries"
    # Liest User-Eingabe ein.
    read playerNumber
    # Schaut ob die Eingabe zwischen 1 - 20 ist.
    if [[ $playerNumber =~ $numberRegex ]] ;
    then
      # Schaut ob die Zahl erraten wurde.
      if [[ $randomNumber -eq $playerNumber ]];
      then
          echo "You have guessed it right!"
      # Schaut ob die Zahl kleiner oder grösser sein muss.
      elif [[ $playerNumber -gt $randomNumber ]];
      then
         ((tries=tries-1))
         echo "Number is smaller then $playerNumber"
      else
         ((tries=tries-1))
         echo "Number is bigger then $playerNumber"
      fi
    else
      echo "$playerNumber is not a valid input!"
    fi
  else
    echo "==============================================="
    echo "No tries left!"
    echo "==============================================="
    exit
  fi
done
