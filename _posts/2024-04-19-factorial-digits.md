---
title: "Sum of factorials tweet “proof”"
layout: post
tags: maths ruby
---

<!-- TODO: Extract this into a reusable math.html snippet, or better yet: pre-render LaTeX. -->
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

Many moons ago, Vsauce [tweeted][vsauce tweet]:

> 1 = 1!\
> 2 = 2!\
> 145 = 1! + 4! + 5!\
> 40,585 = 4! + 0! + 5! + 8! + 5!
>
> These are the only four numbers with this property.
>
> {:.source}
> — Vsauce (@tweetsauce) [February 18, 2018][vsauce tweet]

Searching for these numbers on <abbr title="The On-Line Encyclopedia of Integer Sequences">OEIS</abbr>, we can find them on the sequence [A014080][factorion] and learn that they are called **factorions**. Defined as numbers equal to the sum of the [factorials][factorial] of their digits, there are indeed only four of them (in base 10).

Let's try to "prove" this by [once again][programming vs maths] writing a simple Ruby program that checks all possible numbers, and hopefully confirms that these are the only four factorions.

But *which* possible numbers? All of them? Do we just leave the computer checking bigger and bigger numbers until we get bored and declare that there must not be any more factorions if we haven't found a new one after an arbitrary limit? We couldn't call *that* a proof.

We can try to get an intuition for how these sums behave by comparing the numbers made of only 9s (i.e., 9, 99, 999, and so on) to the sum of the factorials of those 9s (i.e., $$9!$$, $$9!+9!$$, $$9!+9!+9!$$, and so on).

<span class="sidenote">Note that $$9!$$ is $$362\,880$$.</span>

<span class="sidenote">And maybe the string formatting here also warrants a comment. In Ruby, "multiplying" a string and number —that is, sending the `*` message with a number argument to a string—, like in `'9' * n`, returns a string with `n` copies of the original. Similarly, multiplying an array with a number, as in `['9!'] * n`, returns an array with the elements of the original repeated `n` times. And curiously, multiplying an array *with a string*, as in the second `*` of `['9!'] * n * ' + '`, is the same as [joining the elements](https://ruby-doc.org/3.3.0/Array.html#method-i-2A) of the array with that string. A somewhat cryptic choice, yes, but since we're dealing with factorials here, multiplying stuff together seemed appropriate.</span>

```ruby
1.upto(10) do |n|
  gt = ('9' * n).to_i > n * 362_880
  puts "#{'9' * n} #{gt ? '>' : '≤'} #{['9!'] * n * ' + '}"
end
```

Which prints:

```
9 ≤ 9!
99 ≤ 9! + 9!
999 ≤ 9! + 9! + 9!
9999 ≤ 9! + 9! + 9! + 9!
99999 ≤ 9! + 9! + 9! + 9! + 9!
999999 ≤ 9! + 9! + 9! + 9! + 9! + 9!
9999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9!
99999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9!
999999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9!
9999999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9!
```

So, from $$9\,999\,999$$ onwards, the numbers made of only 9s become bigger than the **sum of the factorials of their digits**, or **SFD** for short. And they seem to remain that way, at least up to 10 digits.

A more rigorous way of seeing this is to consider any positive number of $$n$$ digits. The number itself must be greater or equal to $$10^{n-1}$$ (otherwise it wouldn't have $$n$$ digits), but its SFD can be at most $$n \cdot 9!$$ (if it's all 9s). In other words, as we add more digits, numbers grow exponentially, while their SFDs only grow linearly. This means that **there must be a finite number of factorions**, as the exponential growth of the numbers with each new digit will outpace the linear growth of the SFD at some point.

And for 7 digits we can already see that $$9\,999\,999$$ is greater than $$7 \cdot 9! = 2\,540\,160$$. In fact it's even greater than 8 or 9 times $$9!$$, the maximum SFDs for numbers of 8 and 9 digits. So at that point numbers are definitely greater than their SFDs, which means that if we "only" check all numbers up to $$9\,999\,999$$, we can be sure to find all possible factorions.

Then let the brute-forcing begin!

<span class="sidenote">Note the very succinct and cute factorial definition: `(1..n).reduce(1, :*)`. We're taking advantage of `reduce()` accepting both a block or a symbol for the reducer function. Given the `:*` symbol, `reduce()` combines the numbers `1..n` using their `*` method. In other words: it multiplies them together.</span>

```ruby
# Store the factorials from 0 to 9 to avoid recalculating them each time.
factorials = (0..9).map {|n| (1..n).reduce(1, :*) }

1.upto(9_999_999) do |n|
  sfd = n.digits.map{|d| factorials[d] }.sum
  if n == sfd
    puts "#{n} = #{n.digits.reverse.map {|d| "#{d}!"}.join(' + ')}"
  end
end
```

Running this snippet, which takes around 6 seconds of number-crunching on my computer, outputs:

```
1 = 1!
2 = 2!
145 = 1! + 4! + 5!
40585 = 4! + 0! + 5! + 8! + 5!
```

Which matches all the equations on the original Vsauce tweet. We've found the four factorions!

Q.E.D.

<div style="height:20rem"></div>
…
<div style="height:20rem"></div>

Hmmm… 6 seconds to run that snippet. Isn't that… kind of slow?

I mean, this has nothing to do with the proof, but modern computers can do many *billions* of instructions per second. And we're doing a linear search over only 10 million numbers. Even if some of the operations on that loop could be somewhat expensive, like calling the `digits` method to get the digits of a number, it *feels* like a computer should be able to run this much faster.

But that will be a topic for a following post!


[vsauce tweet]: https://twitter.com/tweetsauce/status/965259567322943490
[programming vs maths]: {% post_url 2024-04-12-programmer-vs-mathematician %}
[factorial]: https://en.wikipedia.org/wiki/Factorial
[positional notation]: https://en.wikipedia.org/wiki/Positional_notation
[factorion]: https://oeis.org/A014080
