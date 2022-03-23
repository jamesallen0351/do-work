# Print "Hello, World!"

print("Hello, World!")

# Task
# Given an integer, , perform the following conditional actions:

# If  is odd, print Weird
# If  is even and in the inclusive range of 2 to 5, print Not Weird
# If  is even and in the inclusive range of 6 to 20, print Weird
# If  is even and greater than 20, print Not Weird
# Input Format A single line containing a positive integer,n .

# Constraints 1 <= n <=100

# Output Format Print Weird if the number is weird. Otherwise, print Not Weird.

import math
import os
import random
import re
import sys




N = int(input())

if (N % 2 == 1) | (6 <= N <= 20):
    print("Weird")
elif N >= 2 & N <= 5:
    print("Not Weird")
elif N > 20:
    print()