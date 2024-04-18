---
title: "Sum of factorials tweet proof"
layout: post
tags: maths ruby
---

Some time ago Vsauce [tweeted][vsauce tweet]:
<!-- <span class="sidenote">It's been 6 years already?? Time got seriously messed up with the pandemic…</span> -->

> 1 = 1!\
> 2 = 2!\
> 145 = 1! + 4! + 5!\
> 40,585 = 4! + 0! + 5! + 8! + 5!
>
> These are the only four numbers with this property.
>
> {:.source}
> — Vsauce (@tweetsauce) [February 18, 2018][vsauce tweet]

So let's "prove" this by [once again][programming vs maths] writing a simple Ruby program that checks all possible numbers and tells us which ones have this property.

The key here is to first realize that the numbers that have this property *must* be finite, as the numbers on the left of these equations grow faster than the sum of their digits' [factorials][factorial].

We can get an quick intuitive feel for this by comparing the numbers made of all 9s —that is, 9, 99, 999, and so on— to the sum of those 9s factorial —that is, $$9!$$, $$9!+9!$$, $$9!+9!+9!$$, and so on— and seeing which of the two is bigger. Note that $$9! = 362\,880$$.

<span class="sidenote">Maybe the string formatting here warrants a comment. In Ruby, "multiplying" a string and number —that is, sending the `*` message with a number argument to a string—, like in `'9' * n`, returns a string with `n` copies of the original. Similarly, multiplying an array with a number, as in `['9!'] * n`, returns an array with the elements of the original repeated `n` times. And curiously, multiplying an array *with a string*, as in the second `*` of `['9!'] * n * ' + '`, is the same as [joining the elements](https://ruby-doc.org/3.3.0/Array.html#method-i-2A) of the array with that string. A somewhat cryptic choice, yes, but since we're dealing with factorials here, multiplying stuff together seemed appropriate.</span>

```ruby
1.upto(10) do |n|
  gt = ('9' * n).to_i > n * 362_880
  puts "#{'9' * n} #{gt ? '>' : '<='} #{['9!'] * n * ' + '}"
end
```

Which prints:

```
9 <= 9!
99 <= 9! + 9!
999 <= 9! + 9! + 9!
9999 <= 9! + 9! + 9! + 9!
99999 <= 9! + 9! + 9! + 9! + 9!
999999 <= 9! + 9! + 9! + 9! + 9! + 9!
9999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9!
99999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9!
999999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9!
9999999999 > 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9! + 9!
```

So, from $$9\,999\,999$$ onwards, the numbers made up of *n* consecutive 9s become bigger than the sum of *n* 9 factorials. And they seem to remain that way, at least up to 10 digits.

A more rigorous way of seeing this is to consider any number of *n* digits. The number itself grows exponentially with the number of digits<span class="sidenote-number" /><span class="sidenote">A consequence of using a [positional numeral system][positional notation].</span>, while the sum of its digits' factorials only grows linearly, as its value for a number of $$n$$ digits can be at most $$9! + 9! + \cdots + 9! + 9! = n9!$$.

And for 7 digits, we can see that that $$9\,999\,999$$ is already greater than $$7 \cdot 9! = 2\,540\,160$$, so we "only" need to check up to $$9\,999\,999$$ to find the possible numbers that are equal to the sum of their digits' factorials.

Let the brute-forcing begin!

<span class="sidenote">Note the very succinct and cute factorial definition: `(1..n).reduce(1, :*)`. We're taking advantage of `reduce()` accepting both a block or a symbol for the reducer function. Given the `:*` symbol, `reduce()` combines the numbers `1..n` using their `*` method. In other words: it multiplies them together.</span>

```ruby
# Store the factorials from 0 to 9 to avoid recalculating them each time.
factorials = (0..9).map {|n| (1..n).reduce(1, :*) }

1.upto(9_999_999) do |n|
  if n == n.digits.map{|d| factorials[d] }.sum
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

Which matches all the equations on the original Vsauce tweet.

Q.E.D


[vsauce tweet]: https://twitter.com/tweetsauce/status/965259567322943490
[programming vs maths]: {% post_url 2024-04-12-programmer-vs-mathematician %}
[factorial]: https://en.wikipedia.org/wiki/Factorial
[positional notation]: https://en.wikipedia.org/wiki/Positional_notation
