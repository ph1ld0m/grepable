# Make things grepable and queryable (awkable)
A collection of small scripts, mainly awk, to make the output of common tools
and file formats more "grepable" and "queryable".

The *from_scripts* transform the output into a line-based format.
And the *query_scripts* are small and simple wrappers around awk, so that one
can query the from_output with column names instead of the default column numbers.
The query_scripts also make sure that only tabs are used as a delimiter for
the input and output (as that is what the from_scripts create).

For example:
```
cat scan.gnmap | from_gnmap | query_gnmap '$service == "ssh"'
```

One can then make the output prettier, if the default tab output isn't good enough
with other tools, e.g.

```
cat scan.gnmap | from_gnmap | query_gnmap '$version ~ /Windows Kerberos/' | column -s "	" -t
```

Note: the optarg to -s of column is a tab.
