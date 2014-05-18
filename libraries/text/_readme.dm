/*

Version History

Version 3 (posted 03-15-2012)
 * Made the split() proc check that the delimiter has a non-zero
   length (to avoid infinite loops). If the delimiter is an empty
   string, a list with one element (the entire string) is returned.
 * Made concat() work recursively for all lists of more than 10
   strings. This gives it a big speed improvement, especially for
   longer lists.
 * Added the dir2txt() proc which converts a number to the corresponding
   BYOND direction. There's also the dir2text() proc which does the same
   thing.
 * Changed the int() proc to use text2ascii and work for bases up to 36.

Version 2 (posted 03-14-2012)
 * Fixed a bug with the split() proc.
 * Changed how the replace proc works to increase its speed.
 * Added the Replace() and Split() procs which are case-sensitive
   versions of replace and split.
 * Added the prefix() and ending() procs which determine if one string
   starts or ends with another string. Prefix() and Ending() are the
   case-sensitive versions.
 * Did some benchmarking to compare performance against the
   Deadron.TextHandling library. The benchmarking code is included
   as demo\benchmark.dm
 * Put all ASSERT() statements inside #ifdef DEBUG blocks.

Version 1 (posted 03-13-2012)
 * Initial posting, contains the int(), split(), concat(), and replace() procs.

*/