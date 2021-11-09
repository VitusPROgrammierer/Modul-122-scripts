#!/bin/bash
#
# Name: duSort3.sh - Zeigt ob ein Process am laufen ist.
# -----------------
# SYNOPSIS: duSort3.sh
# Description: Zeigt ob der angegebene Process am laufen ist.
#
# duSort3.sh
#
# Autor: Vitus Lindemann
# Datum: 06.10.2021

echo "==============================================="
echo "Enter process: "
echo "==============================================="

read input
if [ `ps -ef | grep ${input} | grep -v grep | wc -l` -eq 0 ];
  then
	echo ""
	echo "This process isn't running"
	else
	echo ""
	echo "This process is running"
fi
