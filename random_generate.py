#!/usr/bin/python
import sys 
import random
from sys import argv

random_value=random.sample([i for i in range(1,100) if i%2==0], 10)

for item1 in random_value:
   print item1,
random_value.sort()
print "\n\nData items after sorting in Ascending order"



for item2 in random_value:
   print item2,

random_value.reverse()
print "\n\nData items after sorting Desceding order"
for item2 in random_value:
   print item2,

