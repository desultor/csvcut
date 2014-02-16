csvcut
======

A tool to cut values specified by column name from delimiter-separated files.

Requirements
------
 * UNIXey operating system (OS X, Linux, cygwin on Windows)
 * Python 3 (tested on 3.3.4)

Setup
-------
1. Clone the repository
2. If your python 3 is callable as python3, skip to the next step. Otherwise set a symlink so that you can call python3 by that name, e.g.:
  ```
  ln -s /opt/local/bin/python3.3 ~/bin/python3
  ```
3. Set a symlink so that csvcut calls the executable in the git repo, e.g.:
 ```
 ln -s ~/csvcut/csvcut.py3 ~/bin/csvcut
 ```


Examples
-----
```bash
# print usage pattern
csvcut --help
# same thing
csvcut -h
```

```bash
# cut out the column "foo" from a tab-separated file
csvcut foo tests/test_sets/sample_csv.tsv 
# cut out the column "foo" from all the tab-separated files
csvcut foo tests/test_sets/*.tsv 
# cut out the column "two words" from a tab-separated file
csvcut "two words" tests/test_sets/sample_csv.tsv 
```
```bash
# cut out the column "bar" from a comma-separated file
csvcut bar tests/test_sets/sample_csv.csv --delimiter ,
# same thing
csvcut -d , bar tests/test_sets/sample_csv.csv 
```

```bash
# what are all the values of the "Species" column in a directory full of selection tables?
csvcut Species *.txt

# recursively find the values in the "Species" column within a directory,
# and print how many times each value occurs (good for finding oddball values
# like typos or capitalization errors in text fields)
find /path/to/directory -iname '*selections.txt' | xargs -ifilename -n1 csvcut Species filename | sort | uniq -c
```


What's Next?
-----
I don't have any plans to extend this at the moment, but it would be nice to have the possibility of outputting the column name in addition to the column data, or of outputting multiple columns.
