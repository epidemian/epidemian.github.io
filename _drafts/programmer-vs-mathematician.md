---
title: "Programming vs mathematical curiosity"
title: "6174: Programming vs maths curiosity"
layout: post
tags: maths ruby
---

Recently i came across a puzzling property of numbers that made me think of what "tickles" my mind as a programmer, and how that might differ from what sparkles curiosity on a typical mathematician's mind<span class="sidenote-number" /><span class="sidenote">Of course, this is all painting with very broad strokes. Every person is different.</span>.

Consider this simple question: what would happen if we pick a number, arrange its digits in descending and ascending order to get two different numbers, and then subtract those two?

For example, let's pick the number 1988. Arranging its digits in descending and ascending order we get 9881 and 1889, and subtracting those two we get 7992. Riveting, yes. But what would happen if we repeat this process now starting from 7992, and then keep going?

I would recommend to take a moment to consider what would happen. Not necessarily to check it with pen and paper, but what does your intuition say?

Well, let's see. Starting from 1988 the sequence would go:

<div class="sidenote">Sidenote: if we had started from 2023 —the year i started writing and procrastinating this blog post— the sequence would look almost the same. The first step would be 3220&nbsp;−&nbsp;0223&nbsp;=&nbsp;2997, and after that it would continue the same way. This is not such a cosmic coincidence as it seems; the numbers on these sequences tend to repeat a lot.</div>

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


Once we hit 6174 the sequence starts repeating, as the result of applying this "biggest digit-arrangement minus smallest digit-arrangement" operation to 6174, is 6174 itself.<span class="sidenote-number" /><span class="sidenote">Or in maths parlance: 6174 is a [fixed point] of this operation.</span>

Now here's the kicker: as long as the starting number is not a single repeated digit, **we can start from any 4-digit number and the sequence will always reach 6174**.

Of course, i'm not the first person to notice this. This number is known as [Karprekar's constant][6174], in honor of the mathematician who discovered this curious property.

I don't know about you, but i was quite surprised when i first heard about this. All numbers converging to a single one, instead of maybe converging to different numbers or getting into loops. I would not have expected that!

But i didn't have the mathematical tools, or curiosity really, to dig into this more deeply. Luckily, there aren't that many 4-digit numbers, and computers are quite fast, or so i've been told. So instead of mathematically proving this the "correct" way, let's have some fun and write a simple Ruby program<span class="sidenote-number" /><span class="sidenote">We could've gone with any language really, but i like using Ruby for this kind of thing. It gets out of the way and allows expressing things quite freely. </span> to check this property for every 4-digit number.

### A simple "proof" program

Let's do some bottom-up development and start with the simplest bit: checking if a number consists of a single repeating digit. These numbers are called [repdigits][repdigit] in recreational mathematics.

```ruby
def repdigit?(n) = n.digits.uniq.size == 1
```

There's quite a bit going on on this line if you're not used to Ruby, so let's break it apart. The `n.digits` method gives us an array with the number's base-10 digits. Then we filter out repeated digits using `uniq`. So we're basically saying: a number is a repdigit if it has only one distinct digit. The code reads almost as a condensed version of it's English explanation.

By the way, if you're wondering about this `def name(args) = expr` business, that is Ruby's ["endless" method][endless methods] syntax, which debuted on version 3.0. I'm still on the fence about it to be honest. On the one hand, it seems like the kind of unnecessary syntax sugar that tends to bloat languages and complicates answering basic questions like "how do i define a method?". But at the same time, it can be useful to distinguish the cases where something can be expressed succinctly in a single expression, and the cases where multiple statements are needed.

Oh and yes, method names can end with `?`, which is actually the convention for boolean predicates in Ruby.

Anyways, back to our program. This `repdigit?` definition is correct and works for numbers of any length. But we only care about 4-digit numbers. And Kaprekar's property also works for smaller numbers if we extend them with leading zeroes. For example, 777 is a repdigit, but if we consider it a 4-digit number and write it as 0777 then we can start the sequence with 7770&nbsp;-&nbsp;0777&nbsp;=&nbsp;6993 and we'd reach Kaprekar's constant in 3 more steps.

So we only care about repdigits of 4 digits like 1111, 2222, and so on. In other words, multiples of 1111. So the `repdigit?` predicate can be simplified to:

```ruby
def repdigit?(n) = n % 1111 == 0
```

Jumping up a bit in abstraction level, the logic of repeatedly rearranging the digits of a number into ascending and descending order, and subtracting those two until the result starts to repeat —aka Kaprekar's routine— can be written as:

```ruby
def kap(n)
  d = descending_digits(n) - ascending_digits(n)
  n == d ? n : kap(d)
end
```

We take the difference of the two rearrangements of the number's digits (which we haven't defined yet). If that difference equal to the input number, then we have found where the sequence starts repeating and we return that number. And if it's not the same, we recur and do the same thing again with the difference.

Note that this recursive function only terminates if the operation reaches the same number at some point. But we *know* that to be true; that's the whole point of writing this program! We just want to check it ourselves. Even more: [it is known][kaprekar routine] that for 4-digit numbers this operation actually converges in 7 or less steps, so if we preferred iteration over recursion we could've written:

```ruby
def kap(n)
  7.times do
    n = descending_digits(n) - ascending_digits(n)
  end
  n
end
```

Both versions will work fine for our purposes. If for some reason Kaprekar's property would not hold for some number, the iterative version would give us a wrong result, and the recursive version would hang forever or overflow the stack<span class="sidenote-number" /><span class="sidenote">Which of the two? That's [an interesting question][ruby TCO]!</span>. Either way, we would know that we have screwed up our "proof" somewhere. *It's fine.*

Rearranging the digits of a number to be in ascending order is straightforward now that we know about the `digits` method:

```ruby
def ascending_digits(n) = n.digits.sort.join.to_i
```

We take the digits of the number, sort them, then `join` them into a string, and then convert that string to an integer with `to_i`. Maybe a bit much unnecessary allocations for my current taste, but for a small proof program like this that's totally fine.

We can quickly test this on Ruby's interactive console, `irb`<span class="sidenote-number" /><span class="sidenote">Which i would recommend using for this kind of exploratory programming instead of the more "classic" approach of writing a program on a source file, running it, tweaking it, running it again, etc. Once you have your little bits of program written and tested on the console, you can copy them onto an actual program file.</span>:

```irb
$ irb
irb(main):001> def ascending_digits(n) = n.digits.sort.join.to_i
=> :ascending_digits
irb(main):002> ascending_digits(3713)
=> 1337
```

Now, for rearranging the digits in *descending* order, a naive solution could be to just add a `reverse` call after sorting:

```ruby
def descending_digits(n) = n.digits.sort.reverse.join.to_i
```

But this logic hides a sneaky bug. Can you spot it?

We can test `descending_digits` on the console, which seems to work fine and even makes `kap(n)` return the Kaprekar constant for the example number we started with:

```irb
irb(main):007> descending_digits(1988)
=> 9881
irb(main):008> kap(1988)
=> 6174
```

But when called with the first number of 4 digits, 1000, we get:

```irb
irb(main):009> kap(1000)
=> 0
```

Which is not right. 1000 is not a repdigit. It should not converge to 0.

What's happening here is that, on the first iteration, `ascending_digits(1000) == 1` and `descending_digits(1000) == 1000`, which are both correct. Their difference is 999 though, and when we try to get its digits' rearrangements on the second iteration we get 999 for both the ascending and descending variants, which of course then causes the result of the subtraction to be 0 and then repeat.

We need to make `descending_digits` consider its inputs as 4-digit numbers, so that 999 is seen as 0999, and then its descending order digit rearrangement would be 9990 instead of 999. Here's one way of doing this:

```ruby
def descending_digits(n) = n.digits.sort.reverse.join.ljust(4, '0').to_i
```

After sorting the digits and joining them into a string, we're using `ljust(4, '0')` to pad the string with zeroes to the right so it is 4 characters long<span class="sidenote-number" /><span class="sidenote">A bit hacky, yes, but it gets the job done. And i think it's quite succinct, and readable enough. If you can think of a better alternative, please let me know :)</span>.

With that fix, now `kap(n)` seems to work as intended:

```ruby
irb(main):011> kap(1988)
=> 6174
irb(main):012> kap(1000)
=> 6174
```

Finally, we can define the main logic of this "proof":

```ruby
1.upto(9999) do |n|
  repdigit?(n) or kap(n) == 6174 or
    fail "#{n} is not a repdigit nor does it converge to 6174"
end
```

Again, notice how Ruby code can read as a condensed version of its English translation: for every number from 1 up to 9999, the number is either a repdigit, or its Kaprekar routine converges to 6174. If neither of these is true, the "proof" program fails.

You may be wondering why i used the wordy `or` boolean operator instead of the more common symbolic `||` form. Well, it's a stylistic choice really. First, if i had used `||`, the `fail` method call would've needed parentheses around its argument, which i prefer to avoid since i think of `fail` as control flow and i like to visually distinguish it from other "normal" method calls, like `kap(n)` or `repdigit?(n)` in this case. And second, i think using `and` and `or` as control flow operators —and alternatives to `if` and `unless` respectively— is [a brilliant idea][avdi and or] and can help expressing things in the "natural" way we think them<span class="sidenote-number" /><span class="sidenote">Although, i have to admit, this might be a form of Stockholm Syndrome; a rationalization of Ruby's [multiple ways of doing the same thing][timtowtdi]. Generally i prefer languages having one obvious way of doing things, so i'll think about my choice here as a rare escape to my usual structuredness :)</span>.

Stitching all these snippets together, the complete "proof" program is:

```ruby
def kap(n)
  d = descending_digits(n) - ascending_digits(n)
  n == d ? n : kap(d)
end

def ascending_digits(n) = n.digits.sort.join.to_i
def descending_digits(n) = n.digits.sort.reverse.join.ljust(4, '0').to_i
def repdigit?(n) = n % 1111 == 0

1.upto(9999) do |n|
  repdigit?(n) or kap(n) == 6174 or
    fail "#{n} is not a repdigit nor does it converge to 6174"
end
```

And running it confirms that, indeed, Kaprekar's routing converges to 6174 for all 4-digit as long as the number is not a single repeated digit.

### Wait wasn't this about maths or something?

Well, yes. And no. The story starts as a maths puzzle, but it's really about the journey after that.

In my case at least, when i learned about Kaprekar's result, my mind immediately jumped from "that cannot be!" to "i *must* write a program to check this for all numbers!". And you can see where my curiosity wandered while writing that program:

* to different ways of expressing the same thing and trying to find one i like the best
* to recursion vs iteration
* to programming languages' syntactic choices
* to programming languages' philosophy
* to writing software top-down vs bottom-up

Of course, these are the things that interest me, and so naturally my mind went there. Once i got the program written and running, the little speck of mathematical curiosity i initially had was gone.

I suspect a more maths-oriented person would go through this very differently. Maybe they'd try to find an elegant analytical proof, without the aid of a dumb number-crunching machine brute-forcing its way through. Or they'd try to generalize the problem to different number of digits, or different number bases. I don't really know.

But i appreciate having played with this. It seems i'm not that into maths as i once thought. And that i like programming a lot. Who would have thought?

And how about you? What was on *your* mind while your eyes read this?

Thank you very much for coming with me in this journey.

[fixed point]: https://en.wikipedia.org/wiki/Fixed_point_(mathematics)
[6174]: https://en.wikipedia.org/wiki/6174_(number)
[repdigit]: https://en.wikipedia.org/wiki/Repdigit
[endless methods]: https://bugs.ruby-lang.org/issues/16746
[kaprekar routine]: https://en.wikipedia.org/wiki/Kaprekar%27s_routine#Kaprekar's_constants_in_base_10
[ruby TCO]: https://nithinbekal.com/posts/ruby-tco/
[avdi and or]: https://avdi.codes/using-and-and-or-in-ruby/
[timtowtdi]: https://en.wikipedia.org/wiki/There%27s_more_than_one_way_to_do_it
