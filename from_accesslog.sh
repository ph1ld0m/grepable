#!/bin/sh

awk '
NR > 1 {
	match($0, "[[].*]")
	$5 = substr($0, RSTART + 1, RLENGTH - 2)

	match($0, "\".*\"")
	$6 = substr($0, RSTART + 1, RLENGTH - 2)

	l1 = NF-1
	printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", $1, $2, $3, $4, $5, $6, $l1, NF
	#print $1, $2, $3, $4, $5, $6, $l1, NF
}
'
