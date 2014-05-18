
#define DEBUG

#include <deadron\texthandling\TextHandling.dme>

mob
	verb
		fa_split()
			for(var/i = 1 to 10000)
				split("the quick brown fox jumped over the lazy dog", " ")

		dd_split()
			for(var/i = 1 to 10000)
				dd_text2list("the quick brown fox jumped over the lazy dog", " ")

		fa_concat()
			var/list/l = list("the", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog")
			for(var/i = 1 to 10000)
				concat(l, " ")

		dd_concat()
			var/list/l = list("the", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog")
			for(var/i = 1 to 10000)
				dd_list2text(l, " ")

		fa_replace()
			for(var/i = 1 to 10000)
				replace("the quick brown fox jumped over the lazy dog", " ", "_")

		dd_replace()
			for(var/i = 1 to 10000)
				dd_replacetext("the quick brown fox jumped over the lazy dog", " ", "_")

		fa_prefix()
			for(var/i = 1 to 2500)
				prefix("we'll try this with a long string that fails", "went")
				prefix("short", "short")
				prefix("we'll try this with a long string that works", "we'll try this with a long string")
				prefix("short", "shorp")

		dd_prefix()
			for(var/i = 1 to 2500)
				dd_hasprefix("we'll try this with a long string that fails", "went")
				dd_hasprefix("short", "short")
				dd_hasprefix("we'll try this with a long string that works", "we'll try this with a long string")
				dd_hasprefix("short", "shorp")

		fa_ending()
			for(var/i = 1 to 2500)
				ending("we'll try this with a long string that fails", "fail")
				ending("short", "hort")
				ending("we'll try this with a long string that works", "this with a long string that works")
				ending("short", "shorp")

		dd_ending()
			for(var/i = 1 to 2500)
				dd_hassuffix("we'll try this with a long string that fails", "fail")
				dd_hassuffix("short", "hort")
				dd_hassuffix("we'll try this with a long string that works", "this with a long string that works")
				dd_hassuffix("short", "shorp")
