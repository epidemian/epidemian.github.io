---
title: "LLMs are not even good wordcels"
layout: post
tags: random LLMs
---

A chat with friends recently reminded me about pangrams, and what a cute little language curiosity they are.<span class="sidenote-number" /><span class="sidenote"> I also remembered that i never got a [self-enumerating pangram] generator to work. I should give that another try!</span> I thought it would be fun play with ChatGPT and see if it could generate some good ones, expecting it to do quite well on this task. After all, <abbr title="Large Language Models">LLMs</abbr> should be excellent wordcels, right?<span class="sidenote-number" /><span class="sidenote"> That is, is there's one thing they should be very good at, that is verbal intelligence. Yeah, i know [this meme][wordcels vs shape rotators] of "shape rotators vs. wordcels" can be a bit cringy, but i honestly find these terms ironically endearing.</span> Well, it doesn't seem so.

Just so we're on the same page: pangrams are phrases that use every letter of the alphabet. Even if you didn't know that definition, chances are you already knew of one such phrase: "the quick brown fox jumps over the lazy dog", which is typically used to showcase typographic fonts.

So, how did a state-of-the-art LLM like ChatGPT-4o fare with pangrams? Let's see:

{:.long}
> Demian: hola, sabés lo que es un pangrama?
>
> ChatGPT: ¡Hola! Sí, un pangrama es una frase o texto que utiliza todas las letras del alfabeto de un idioma al menos una vez. Los pangramas se usan a menudo en pruebas de tipografía, diseño gráfico y en la enseñanza de la mecanografía.
>
> Un ejemplo clásico en español es: "El veloz murciélago hindú comía feliz cardillo y kiwi."
>
> <details markdown=1>
> <summary>Translation (not really important; the chats are explained below)</summary>
> Demian: hello, do you know what a pangram is?
>
> ChatGPT: Hello! Yes, a pangram is a phrase or text that uses all the letters of the alphabet of a language at least once. Pangrams are often used in typography tests, graphic design, and in teaching typing.
>
> A classic example in Spanish is: "El veloz murciélago hindú comía feliz cardillo y kiwi."
> </details>

I went with Spanish because, why not? It's nice when software understands your native language.<span class="sidenote-number" /><span class="sidenote"> In fact, maybe even programming languages should be designed to let people program in their mother tongue. Learning how to program when you're not fluent in English, or when your alphabet is not based on Latin, is more difficult and frustrating than it needs to be. A recent [CoRecursive episode] touches on this idea, and i found the guest's arguments to be very compelling. She created [Hedy], a language that allows students to learn programming using their native tongue. The breadth of languages it supports, from Spanish to Korean, is awe-inspiring :)</span> And, in any case, if it were true that LLMs have an internal model of the world, the output language shouldn't make much difference.

So, ChatGPT starts with a good definition of what a pangram is, but then it botches the example badly. It doesn't include *many* letters: B, J, Ñ, P, Q, S, T, and X.

This is because the sentence it chose is only half of a well-known Spanish pangram that also includes all diacritics:

> El veloz murciélago hindú comía feliz cardillo y kiwi. La cigüeña tocaba el saxofón detrás del palenque de paja.

At the moment i only noticed the missing Ñ, which is of course a glaring omission to a Spanish speaker, as it's such a characteristic letter. It's even part of the language name!

So i tell ChatGPT about that:

{:.long}
> Demian: no le falta una letra del español a ese pangrama?
>
> ChatGPT: Tienes razón, el ejemplo que di no incluye la letra "ñ". Un pangrama en español que sí utiliza todas las letras del alfabeto, incluida la "ñ", es:
>
> "Jovencillo emponzoñado de whisky: ¡qué figurota exhibe!"
>
> Este pangrama incluye todas las letras del alfabeto español, incluyendo la "ñ".
>
> <details markdown=1>
> <summary>Translation</summary>
> Demian: isn't that pangram missing a Spanish letter?
>
> ChatGPT: You're right, the example I gave does not include the letter "ñ". A pangram in Spanish that does use all the letters of the alphabet, including "ñ", is:
>
> "Jovencillo emponzoñado de whisky: ¡qué figurota exhibe!"
>
> This pangram includes all the letters of the Spanish alphabet, including "ñ".
> </details>

It identifies that the phrase is indeed missing an Ñ,<span class="sidenote-number" /><span class="sidenote"> Even though it's also missing many other letters. But, to be fair, programmers routinely forget about non-ASCII characters too. So ChatGPT might even be emulating that frequent mistake, honoring a tradition learned from an English-centric corpus.</span> and it manages to quote a correct well-known pangram. Yay!

Then i ask it to come up with a novel pangram:

{:.long}
> Demian: bien. podrías armar un pangrama que no exista en la internet? no hace falta que sea muy breve
>
> ChatGPT: ¡Claro! Aquí tienes un pangrama en español que incluye todas las letras del alfabeto, incluyendo la "ñ":
>
> "El pingüino ñato y jovial, experto en boxeo, lanzó su eficaz jaque mate a la rápida bruja del volcán."
>
> Espero que te guste este pangrama original.
>
> <details markdown=1>
> <summary>Translation</summary>
> Demian: good. could you put together a pangram that does not exist on the internet? it doesn't have to be concise.
>
> ChatGPT: Sure! Here is a pangram in Spanish that includes all the letters of the alphabet, including the "ñ":
>
> "El pingüino ñato y jovial, experto en boxeo, lanzó su eficaz jaque mate a la rápida bruja del volcán."
>
> I hope you like this original pangram.
> </details>

Ok, not the most natural-sounding phrase.<span class="sidenote-number" /><span class="sidenote"> Roughly, "The small-nosed and jovial penguin, an expert in boxing, launched his effective checkmate to the fast witch of the volcano"</span> But fair enough, i didn't say anything about the phrase having to make much sense.

However, a keen eye will notice that this is not a pangram: it's missing the letters H, K and W.

So then i ask ChatGPT what i thought would be a trivial task: to identify which 3 letters are missing from that phrase:

{:.long}
> Demian: le faltan 3 letras del castellano a ese intento de pangrama. qué letras le faltan?
>
> ChatGPT: Mis disculpas por el error. Revisaré el pangrama para identificar las letras que faltan.
>
> El pangrama proporcionado es:
> "El pingüino ñato y jovial, experto en boxeo, lanzó su eficaz jaque mate a la rápida bruja del volcán."
>
> Voy a revisar si incluye todas las letras del alfabeto español:
> - a, b, c, d, e, f, g, h, i, j, k, l, m, n, ñ, o, p, q, r, s, t, u, v, w, x, y, z
>
> Al revisar, noto que faltan las letras **h**, **k** y **s**. Intentaré nuevamente crear un pangrama completo:
>
> ---
>
> "El pingüino ñato y jovial husmeaba feliz, cuando la bruja rápida y excéntrica le dio un box con whisky."
>
> ---
>
> Este pangrama incluye todas las letras del alfabeto español.
>
> <details markdown=1>
> <summary>Translation</summary>
> Demian: that attempt at a pangram is missing 3 Spanish letters. what letters are missing?
>
> ChatGPT: My apologies for the error. I will review the pangram to identify the missing letters.
>
> The provided pangram is:
> "El pingüino ñato y jovial, experto en boxeo, lanzó su eficaz jaque mate a la rápida bruja del volcán."
>
> I'm going to check if it includes all the letters of the Spanish alphabet:
> - a, b, c, d, e, f, g, h, i, j, k, l, m, n, ñ, o, p, q, r, s, t, u, v, w, x, z
>
> Upon checking, I notice that the letters **h**, **k**, and **s** are missing. I'll try to create a complete pangram again:
>
> ---
>
> "El pingüino ñato y jovial husmeaba feliz, cuando la bruja rápida y excéntrica le dio un box con whisky."
>
> ---
>
> This pangram includes all the letters of the Spanish alphabet.
> </details>

In typical ChatGPT fashion, it spouts a lengthy answer that makes it seem like it's reasoning about which letters are missing from the previous pangram attempt.

But it's wrong. It says the phrase was missing the H, K and S letters, when it clearly had an S (in the word "su"), and it failed to spot the missing W.

Then it gives another incorrect pangram example while still confidently proclaiming it includes all Spanish letters.

Honestly, i was surprised by how poorly ChatGPT did on this prompt. Checking whether a phrase is a pangram is a trivial task that can be done with [a simple Bash one-liner][chanchuscript]. And of all "AI" models, i thought an LLM would be especially good at identifying missing letters on words.

But i think this is faulty reasoning on my part. I'm using a wrong mental model of what an LLM is. More on this at the end.

Losing patience, i tell it about the missing Q on its last example, but then give it a more interesting task: to generate a phrase that contains all letters except S:

{:.long}
> Demian: no incluye la Q. olvidate de eso. podés generar una frase que tenga todas las letras del castellano excepto la S?
>
> ChatGPT: Por supuesto, aquí tienes un pangrama en español que incluye todas las letras del alfabeto excepto la "s":
>
> "El pingüino ñato y jovial brinca feliz, comiendo kiwi y exquisito budín de limón."
>
> Este pangrama utiliza todas las letras del alfabeto español, excepto la "s".
>
> <details markdown=1>
> <summary>Translation</summary>
> Demian: it doesn't include the Q. forget about that. can you generate a phrase that has all the letters of Spanish except S?
>
> ChatGPT: Of course, here is a pangram in Spanish that includes all the letters of the alphabet except "s":
>
> "El pingüino ñato y jovial brinca feliz, comiendo kiwi y exquisito budín de limón."
>
> This pangram uses all the letters of the Spanish alphabet, except "s".
> </details>

An obvious failure once again: the word "exquisito" has an S. I didn't even check if the phrase has all the other letters.

{:.long}
> Demian: la palabra "exquisito" tiene una S
>
> ChatGPT: Tienes razón, me equivoqué. Aquí va otro intento:
>
> "El rápido murciélago ñoño volaba feliz comiendo kiwi, jabalí y pizza con budín."
>
> Este pangrama debería incluir todas las letras del alfabeto español excepto la "s".
>
> <details markdown=1>
> <summary>Translation</summary>
> Demian: the word "exquisito" has an S
>
> ChatGPT: You're right, I made a mistake. Here's another attempt:
>
> "El rápido murciélago ñoño volaba feliz comiendo kiwi, jabalí y pizza con budín."
>
> This pangram should include all the letters of the Spanish alphabet except "s".
> </details>

At last, it manages to produce a phrase without an S as instructed. But once again it fails to include every other letter, while still confidently claiming to have done so.

I call it quits after this last attempt.

## Some closing thoughts

I don't know what to think about this little exercise in futility to be honest.

One thing that is clear to me is that we're vastly overestimating the "intelligence" of LLMs, if it even makes sense to use that word in this context. We're being fooled by their apparent capacity to produce human-sounding text.

This semblance of intelligence quickly falls apart when you start prodding the LLMs and they start "making mistakes" that no person would make. A person can easily check if a phrase contains all the letters in the alphabet, even if it's a phrase they've never seen before. Hell, even if the phrase is in a language they don't know. It's an easy task.

But an LLM will make trivial errors while at the same time giving the impression of competently having done what you asked for.

One thing LLMs seem incapable of doing is to say "i don't know".

### On our mental model of LLMs

I think we're being too generous to LLMs when we talk about what they do. That's why i used quotes around "making mistakes" or "intelligence". We're using a wrong mental model of what LLMs are. An LLM is not making mistakes, or even trying to answer a question. It's only "trying" to predict text, word after word, based on all the text it's been trained on.

And once we start thinking about an LLM as a text predictor, things start to make more sense:

* It can claim that some phrase is a pangram because its training data included similar phrases on texts that talked about pangrams. It's not like it learned the general rule of what a pangram is or how to check if a phrase is a pangram or not.
* It will generally give an answer after we ask a question because that's what its training corpus has. Questions are generally followed by answers.
* It won't say "i don't know" because its training data doesn't have that many examples of questions being answered like that. People write about questions they have successfully answered. And when someone asks a question on the internet, they generally receive answers, not "i don't know"s. And that's the text the LLM has been trained on, so it makes sense for it to predict an answer-looking text after a question, even if the answer is incorrect.

Maybe we're attributing a false cause for this capacity of LLMs to produce text.

We humans have a rich internal mental model of the world. And we use that model to —among many other things— speak somewhat coherently about the world. So, in some way, the text we produce is *caused* by our internal world model.

But when it comes to LLMs, we observe that they can produce text that is very similar to what we humans produce, and then we conclude that they must also have a rich internal model of the world in order to be able to produce that text. But maybe we're jumping to this conclusion too early. Maybe we're anthropomorphizing these things. There could be other mechanisms by which LLMs are able to produce that text.

If we see a photocopier machine producing beautiful art, we don't jump to the conclusion that the photocopier has somewhat understood what makes great art and became an artist. No, we conclude that someone has put a beautiful image on its scanner. But this is because we understand how a photocopier works internally. But with LLMs we have the problem of them being quite black-boxy, or at least much more so than a photocopier.

### On what the future may hold

This one is tricky. And i find myself torn between an optimistic and a pessimistic view.

On the one hand, i find it quite relieving to see that even the latest and most powerful "AI" models are still so far off from anything that we could call general intelligence with a straight face.

I don't think we're anywhere close to <abbr title="Artificial general intelligence">AGI</abbr>, and i'm glad for that. I don't know if i'm an "AI doomer" or not, but i generally agree with the statement of [AGI posing an existential risk][AI risk statement] to humanity. I guess i could try to articulate why i think creating something more intelligent (and therefore more powerful) than ourselves seems like a spectacularly stupid idea, and i don't understand why anyone would want to do that instead of trying to improve humanity in some less naive and risky way,<span class="sidenote-number" /><span class="sidenote"> Like, IDK, trying to augment *human* intelligence, or our capacity for coordination, or for empathy.</span> but this post is too long already.

Suffice to say, any anxiety i may hold for AI killing us all gets subdued by evidence suggesting that we're still a long way off that. Even though this is contrary to what some AI-hype-bros may say.<span class="sidenote-number" /><span class="sidenote"> It's unsurprising that many of the people who are trying to sell us the "AI revolution" today were also trying to sell us blockchain and NFTs as revolutions not too long ago.</span>

On the other hand, however, i do worry about the AI-hype-bros winning, and these dumb inscrutable black boxes known as LLMs being deployed for actually important stuff.

And this is already happening to some extent. Google already provides "AI-based" results that regularly [make the same kind of basic mistake][AI search] illustrated on this blog post: confidently asserting something generated by a text predictor that's been trained on a huge corpus of Reddit posts.<span class="sidenote-number" /><span class="sidenote"> Nothing against Reddit posts. I regularly add "site:reddit.com" to my Google searches when looking for stuff, especially opinions and reviews. But i also have the common sense to tell apart a genuine comment from a troll or a shitpost. These nuances seem completely opaque to an LLM, understandably so.</span> Mistakes that generally don't pass the sniff test of a well-informed person, let alone of an expert on a given field.

I can only assume that unscrupulous job recruiters are already using similar models to filter out job applications. So these models may already be leaving people out of jobs. And we're trusting their overconfident token-prediction-based "judgment".

This has real-world consequences; it's not just wrong pangrams.

And we keep pouring more and more money and resources into this.

At this point, my biggest hope for the problem of the misuse of LLMs (or generative models in general) is for this "AI" movement to collapse under its own weight. And maybe after this hype cycle passes, the memories that this current "AI" moment leaves us will be so bitter that we'll choose to dismantle all its deleterious uses.

In the meantime, let's remember to touch grass and connect with other people.


[self-enumerating pangram]: https://en.wikipedia.org/wiki/Pangram#Self-enumerating_pangrams
[wordcels vs shape rotators]: https://roonscape.ai/p/a-song-of-shapes-and-words
[CoRecursive episode]: https://corecursive.com/hedy-with-felienne-hermans/
[Hedy]: https://www.hedycode.com/
[chanchuscript]: https://www.youtube.com/watch?v=PA_zfdH9pX0
[AI risk statement]: https://www.safe.ai/work/statement-on-ai-risk
[AI search]: https://pluralistic.net/2024/05/15/they-trust-me-dumb-fucks/
