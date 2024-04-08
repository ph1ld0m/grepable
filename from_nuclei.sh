#!/bin/sh

# use someting like the following to pretty print
# (note: the optarg for '-s' is a tab):
# $ column -s "	" -t

awk '
BEGIN { OFS="\t" }
{
	# Remove the surrounding [] brackets of the first three fields
	for (i = 1; i <= 3; i++)
		$i = substr($i, 2, length($i) - 2)

	ORS = "\t"
	print $1, $2, $3, $4

	# If there is additional information at the end,
	# print it separated with one space.
	# Otherwise simply mark ist as empty with '-'
	if (NF > 4) {
		printf "%s", $5
		for (i = 6; i <= NF; i++) {
			printf " %s", $i
		}
	} else {
		printf "-"
	}
	printf "\n"
}
'
