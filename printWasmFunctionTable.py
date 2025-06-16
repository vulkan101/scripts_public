#!/usr/bin/env python3

#
# print-table.py: Print the function table for a webassembly .wast file
#

import sys

prefix=" (elem (i32.const 1) "
prefix64="(elem $0 (i64.const 1) "
if len(sys.argv) < 2:
    print ("Usage: python print-table.py <path to mono.wast>")
    sys.exit (1)

f = open (sys.argv [1])
table_line = None
for line in f:
     if prefix in line or prefix64 in line:
         table_line = line[len(prefix):]
         break

for (index, v) in enumerate ((table_line or "").split (" ")):
    print ("" + str(index) + ": " + v)
    index += 1
