#!/bin/sh


input=$1
output=$2
awk "NR==1{print \$0 \" {#$input}\"}; NR!=1{print}" $input | sed 's/](\([^h]\)/](#\1/g' > $output
