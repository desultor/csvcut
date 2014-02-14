#!/usr/bin/python3


import csv
import argparse

parser = argparse.ArgumentParser(description="Cut out the values from a named column in a delimited columnar text file.")
parser.add_argument("column_name", 
					help="the column to extract")
parser.add_argument("file_name",
					help="the file(s) to extract it from",
					nargs="+")
parser.add_argument("--delimiter", nargs=1,
					help="the delimiter character (default is tab)")
args=parser.parse_args()
delim = args.delimiter[0] if args.delimiter else "\t"
# parse backslashed characters (e.g. \t)
delim = bytes(delim, "utf-8").decode("unicode_escape")
for current_file in args.file_name:
	with open(current_file, newline="") as csvfile:
		reader = csv.reader(csvfile, delimiter=delim[0])
		headers = next(reader)
		desired_column_index = headers.index(args.column_name)
		for row in reader:
			print(row[desired_column_index])
