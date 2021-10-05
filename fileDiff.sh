#!/bin/bash
#
# Name: fillDiff.sh - Zeigt die unterschiedlichen Zeilen der zwei mitgegebenen Dokumente
# -----------------
# SYNOPSIS: fileDiff.sh [File1] [File2]
# Description: Dieses Bash-script vergleicht zwei mitgegeben Dateien, Zeile für Zeile. Die Zeilen die nicht identischen sind werden ausgegeben.
#
# fileDiff.sh file1 file2
# file1: Ist das erste Text-Dokument
# file2: Ist das zweite Text-Dokument
#
# Autor: Vitus Lindemann
# Datum: 02.10.2021

# Überprüft ob die mitgegebenen Files vorhanden sind
if [[ -f "$1" && -f "$2" ]]; then
  echo "####################################"
  echo "1. File -- $1"
  echo "2. File -- $2"
  echo "####################################"
  echo "Output:"
  # Schaut welches File grösser ist
  if [[ $(wc -l < "$1") -gt $(wc -l < "$2") ]];
  then
    bigFile=$1
    smallFile=$2
  else
    bigFile=$2
    smallFile=$1
  fi
  # Liest Anzahl Reihen aus dem grösseren File
  rowAmount=$(("$(wc -l < "$bigFile")"+1))
  rowCount=1
  # Loopt alle Reihen
  while [[ $rowCount -le $rowAmount ]]
  do
    # Liest und speichert die aktuelle Reihe
    bigFileRow=$(sed -n ${rowCount}p "$bigFile")
    smallFileRow=$(sed -n ${rowCount}p "$smallFile")
    # Vergleicht die Reihen
    if [[ "$bigFileRow" != "$smallFileRow" ]];
    then
      echo "Row $rowCount -- is not the same"
    fi
    ((rowCount=rowCount+1))
  done
  echo "####################################"
else
  echo "Files not existent"
fi