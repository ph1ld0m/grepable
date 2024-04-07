#!/bin/sh

awk	-F "\t" \
	-v OFS="\t" \
	-v finding=1 \
	-v proto=2 \
	-v level=3 \
	-v loc=4 \
	-v info=5 \
	"${@}"
