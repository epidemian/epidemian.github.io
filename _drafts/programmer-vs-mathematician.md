---
title: "Programming vs mathematical curiosity"
layout: post
tags: maths ruby
---

If you're having too much free time and no internet connection to kill it, you may come up with this question: what would happen if we pick a number, arrange its digits in descending and ascending order to get two different numbers, and then subtract those two?

For example, let's pick the number 1988. Arranging its digits in descending and ascending order we get 9881 and 1889, and subtracting those two we get 7992. Fascinating, yes, but what would happen if do the same thing again starting from 7992, and then keep going?

Well, let's see. Starting from 1988 the sequence would go:

<div class="sidenote">Sidenote: if we had started from 2023 —the year i started writing this post— the sequence would look almost the same. The first step would be 3220&nbsp;−&nbsp;0223&nbsp;=&nbsp;2997, and after that it would continue the same way. This is not such a cosmic coincidence as it seems; the numbers on these sequences tend to repeat a lot.</div>

{:style="list-style-type: '→ '"}
- 9881 − 1889 = 7992
- 9972 − 2799 = 7173
- 7731 − 1377 = 6354
- 6543 − 3456 = 3087
- 8730 − 0378 = 8352
- 8532 − 2358 = 6174
- 7641 − 1467 = 6174
- 7641 − 1467 = 6174
- …


Once we hit 6174 the sequence starts repeating, as the result of applying this "biggest digit-rearrangement minus smallest digit-rearrangement" operation to 6174, is 6174 itself.<span class="sidenote-number" /><span class="sidenote">Or in maths parlance: 6174 is a [fixed point](https://en.wikipedia.org/wiki/Fixed_point_(mathematics)) of this operation.</span>

Now here's the kicker: as long as the starting number is not a single repeated digit, **we can start from any 4-digit number and the sequence will always reach 6174**.

Turns out this number is known as [Karprekar's constant](https://en.wikipedia.org/wiki/6174_(number)), in honor of the mathematician who discovered this curious property.

I was pretty surprised when i first heard about this. All numbers converging to a single one, instead of maybe converging to different ones or getting into loops, was not what i expected. But i didn't have the mathematical tools or curiosity to understand this better (and i still don't).

Luckily, there aren't that many 4-digit numbers, and computers are quite fast. So instead of mathematically proving this the "correct" way, we can write a simple Ruby program<span class="sidenote-number" /><span class="sidenote">Ruby is quite convenient for writing these simple programs. It gets out of the way and allows expressing things quite freely. But we could use almost any language and things would look more or less the same.</span> that checks this property for every 4-digit number.

### Writing a simple "proof" program

Let's start with the simplest part: checking if a number consists of a single repeating digit. These are called [repdigits](https://en.wikipedia.org/wiki/Repdigit) in recreational mathematics.

```ruby
def repdigit?(n) = n.digits.uniq.size == 1
```

There's quite a bit going on on this line if you're not used to Ruby, so let's break it apart. The `digits` method gives us an array with the number's digits (in base 10 by default). And then we're filtering out repeated digits using `Array#uniq`. So we're basically saying "a number is a repdigit if it has only one distinct digit" converted to code in a pretty natural way.

By the way, if you're wondering about this `def name(args) = expr` business, it's Ruby's ["endless" method](https://bugs.ruby-lang.org/issues/16746) syntax, which debuted on version 3.0. I'm still on the fence about it to be honest. On the one hand, it seems like the kind of unnecessary syntax sugar that tends to bloat languages and complicates answering basic questions like "how do i define a method?". But at the same time, it can be useful to distinguish the cases where something can be said in a single expression and the cases where multiple statements are needed.

Anyways, back to our program. This `repdigit?` definition is correct and works for numbers of any size. But we only care about 4-digit numbers. And Kaprekar's property also works for smaller numbers if we extend them with leading zeroes. E.g. 777 is a repdigit, but if we consider it a 4-digit number as 0777 then we can start the sequence with 7770&nbsp;-&nbsp;0777&nbsp;=&nbsp;6993 and we'd reach Kaprekar's constant in 3 more steps.

So we only care about repdigits of 4 digits like 1111, 2222, ..., 9999. In other words, multiples of 1111:

```ruby
def repdigit?(n) = n % 1111 == 0
```





Here goes a post about Kaprekar's constant and how i approached "proving" it with code, as opposed to how a mathematician might approach it.

The code for the "proof" would be:

```ruby
def kaprekar(n)
  k = descending_digits(n) - ascending_digits(n)
  k == n ? k : kaprekar(k)
end

# ascending_digits(2012) == 122
def ascending_digits(n) = n.digits.sort.join.to_i

# descending_digits(2012) == 2210
def descending_digits(n) = n.digits.sort.reverse.join.ljust(4, '0').to_i

def repdigit?(n) = n % 1111 == 0

# Test Kaprekar "magic" result for every 4-digit-integer.
(1..9999).each do |n|
  repdigit?(n) or kaprekar(n) == 6174 or
    fail "#{n} is not a repdigit nor does it converge to 6174"
end
```

[^1]: In maths jargon, we could say that 6174 is a [fixed point](https://en.wikipedia.org/wiki/Fixed_point_(mathematics)) of this operation.
