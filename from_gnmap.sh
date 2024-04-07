#!/bin/sh

# In my opinion, gnmap isn't "grepable" but rather "transformable".
# In my daily doing, I want something grepable with a little less information.
# The goal is to print one entire port section together with its IP per line, e.g.
#
# 192.168.1.42  22  open  tcp  ssh  SSH-2.0-OpenSSH_9.5
#
# The challenge is that the format uses different types of delimiters
# for the different "fields".
# We only use the address field and the Ports field and ignore everything else.
# 
# The Ports field is delimited with "," and within a field delimited with "/"
# First split the "Ports:" field into it's port entry components.
# Then split each of these components into it's subcomponents.

awk '
/Ports: / {
	# Copy out the relevant parts of the line
	r = "Ports: "

	# This should never evaluate to true, but Im paranoid
	if (match($0, r) == 0)
		next

	portstr = substr($0, RSTART + length(r))

	sub("[ \t]*Ignored State:.*$", "", portstr)

	# Split the into single port fields
	nports = split(portstr, portlist, ",") 

	# Loop through each port field
	# Split it into its components and trim it, just to be sure
	for (i = 1; i <= nports; i++) {
		sub("^[ \t]+|[ \t]+$", "", portlist[i])
		np = split(portlist[i], p, "/")

		# Dont use the last field of the split, as it isnt a field anymore
		# just the end delimiter
		printf "%s", $2
		for (j = 1; j < np; j++) {
			# Set empty fields to "-"
			sub("^[ \t]*$", "-", p[j])
			printf "\t%s", p[j]
		}
		printf "\n"
	}
}
'
