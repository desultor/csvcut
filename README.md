csvcut
======

A tool to cut values specified by column name from delimiter-separated files.

Examples
-----
```bash
# cut out the column "foo" from a tab-separated file
csvcut foo sample_csv.tsv 
# cut out the column "foo" from all the tab-separated files
csvcut foo *.tsv 
# cut out the column "two words" from a tab-separated file
csvcut "two words" sample_csv.tsv 
```
```bash
# cut out the column "bar" from a comma-separated file
csvcut sample_csv.csv bar --delimiter ,
```

```bash
# what are all the values of the "Species" column in a directory full of selection tables?
csvcut Species *.txt

# do it recursively
find /path/to/directory -iname '*selections.txt' | xargs -ifilename -n1 csvcut Species filename | sort | uniq -c
```


What's Next?
-----
I don't have any plans to extend this at the moment, but it would be nice to have the possibility of outputting the column name in addition to the column data, or of outputting multiple columns.
