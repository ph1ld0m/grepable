#!/bin/sh

awk	-F "\t" \
	-v OFS="\t" \
	-v domain=1 \
	-v host=2 \
	-v date=5 \
	-v req=6 \
	"${@}"
