WordPath
========

This is a simple solution for the WordPath kata from here: http://codekata.pragprog.com/2007/01/kata_nineteen_w.html

Solution is using a custom tree class with a reference to the parent and is using breadth first traversal to get shortest route. 

Breadth first ensure shortest solution but is slower than breadth depth traversal that will give a solution quicker, but not necessary the shortest one.

Usage
=====

WordPath.new(start_word, end_word)
eq: WordPath.new("ruby", "code") #-> ruby -> rube -> robe -> rode -> code

Known issues and limitations
============================

It is working only for words of minimum 3 letters

There is no error handling. If you enter bad data (like start word does not have same number of letters as end word) will crash with an ugly error

No optimization. Can be faster by working a bit to eliminate some checks, like no 3 consecutive letters, no words without wovels, etc

No test cases. I am working to add the RSpec with some test cases in next version
