---
title: "Bash variable substitutions & less tricks"
layout: post
tags: TIL bash
---

It's always nice to learn a new trick that may ever so slightly improve the way we use our tools. Today i learned two such little tricks regarding the command-line.

The first one is that, in Bash, we can do a `sed`-like substitution on the contents of a variable using the syntax `${var/pattern/substitution}`.

As a toy example, consider converting a Reddit URL to the old (and arguably better) version of the site:

```bash
$ url="https://reddit.com/r/commandline/"
$ echo ${url/reddit/old.reddit}
https://old.reddit.com/r/commandline/
$ xdg-open ${url/reddit/old.reddit}
```

This seems like a more convenient way of doing simple text replacements than having to pipe things to a `sed` subprocess.

And there's a lot more to Bash's cryptic but powerful `${}` syntax: case conversion, substring slicing, you name it. The manpage has a thorough description under the "Parameter Expansion" heading:

```bash
man bash | less -p "Parameter Expansion"
```

Which, by the way, demonstrates the second of today's tricks: we can use the `-p` (or `--pattern`) argument in `less` to scroll directly to the first occurrence of a given pattern.

I doubt that i'll be using this one often, as it seems more convenient to search for the pattern interactively using `/` when already inside of `less` instead. But i can imagine using it as a neat "documentation pointer" to share a `less` command with others, just like the above snippet :)

Thanks to my friend —and seasoned Linux geek— [@racter](https://twitter.com/racter/) for showing me these two tricks. I found them quite neat and maybe worth sharing. Or at least, worth using as an excuse to finally start writing a blog, which, here it is! So, hello world! 👋
