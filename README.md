csvcut
======

A tool to cut values specified by column name from delimiter-separated files.

Examples
-----
```
# cut out the column "foo" from a tab-separated file
csvcut sample_csv.tsv foo 
# cut out the column "two words" from a tab-separated file
csvcut sample_csv.tsv "two words"
```
```
# cut out the column "bar" from a comma-separated file
csvcut sample_csv.csv bar ,
# same thing
csvcut sample_csv.csv bar --delimiter ,
```

This could be extended to have the possibility of also outputting the column name, or of outputting multiple columns.
