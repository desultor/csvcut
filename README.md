csvcut
======

A tool to cut values specified by column name from delimiter-separated files.

Examples
-----
```bash
# cut out the column "foo" from a tab-separated file
csvcut sample_csv.tsv foo 
# cut out the column "two words" from a tab-separated file
csvcut sample_csv.tsv "two words"
```
```bash
# cut out the column "bar" from a comma-separated file
csvcut sample_csv.csv bar ,
# same thing
csvcut sample_csv.csv bar --delimiter ,
```

```bash
# what are all the values of the "Species" column in a directory full of selection tables?
for i in *.txt; do; csvcut $i Species; done | sort | uniq -c

# do it recursively
find /path/to/directory -iname '*selections.txt' | xargs -ifoo -n1 csvcut foo Species | sort | uniq -c
```


What's Next?
-----
I don't have any plans to extent this at the moment, but it would be nice to have the possibility of outputting the column name in addition to the column data, or of outputting multiple columns.
