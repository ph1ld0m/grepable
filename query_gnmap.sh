#!/bin/sh

awk	-F "\t+" \
	-v OFS="\t" \
	-v host=1 \
	-v port=2 \
	-v state=3 \
	-v proto=4 \
	-v owner=5 \
	-v service=6 \
	-v sunrpc=7 \
	-v version=8 \
	"${@}"
