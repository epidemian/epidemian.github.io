---
title: "Bash parameter substitution & less tricks"
layout: post
tags: TIL bash
---

Today i learned about two neat little commandline tricks thanks to my friend [@racter](https://twitter.com/racter/).

The first one is that in Bash you can do a sed-like substitution on the contents of a variable by using the syntax `${var/patter/substitution}`.

<!-- TODO: add a compelling example for parameter substitution -->

If you want to learn more about Bash's ~~tricky~~ powerful `$` syntax, you can run:

```bash
man bash | less -p 'Parameter Expansion'
```

Which, by the way, is the second trick i learned today and came in a combo with the first one: you can use the `-p` (or `--pattern`) argument in `less` to scroll directly to the first occurrence of a given pattern.

I doubt that i'll be using this directly —i'd probably just search for a pattern interactively using `/` inside `less` instead— but i can see myself using it as a pointer to share a `less` command with others, as shown in the snippet above :)
