#!/bin/sh

# This is still a work-in-progress

awk '
{
	# Remove the surrounding [] brackets of the first three fields
	for (i = 1; i <= 3; i++)
		$i = substr($i, 2, length($i) - 2)

	printf "%-70s\t%-10s\t%-10s\t%s", $1, $2, $3, $4

	# If there is additional information at the end, print it
	# separated with one space
	if (NF > 4) {
		printf "\t%s", $5
		for (i = 6; i <= NF; i++) {
			printf " %s", $i
		}
	}
	printf "\n"
}
'
