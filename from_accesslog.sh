#!/bin/sh

awk '
BEGIN { OFS="\t" }
$0 !~ /newsyslog.*logfile turned over/ {
	match($0, "[[].*]")
	date = substr($0, RSTART + 1, RLENGTH - 2)

	match($0, "\".*\"")
	req = substr($0, RSTART + 1, RLENGTH - 2)

	print $1, $2, $3, $4, date, req, $(NF-1), NF
}
'
