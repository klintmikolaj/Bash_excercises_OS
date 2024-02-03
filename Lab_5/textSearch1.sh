#!/bin/bash

#1
echo --- liczby heksadecymalne ---
echo ' '
grep -oP '(?<=^|\s)(?<![-+])\b0x[0-9a-fA-F]+(?=\s|$)' $1
echo ' '

#2
echo --- e-maile ---
echo ' '
grep -oP '(?<=^|\s)[0-9a-zA-Z.,;:]+@[0-9a-zA-Z.-]+\.[0-9a-zA-Z.-]+(\.[0-9a-zA-Z.-]+)*(?=\s|$)' $1
echo ' '

#3
echo --- liczby zmiennoprzecinkowe ---
echo ' '
grep -oP '(?<=^|\s)[+-]?\d*\.\d+(?=\s|$)' $1
