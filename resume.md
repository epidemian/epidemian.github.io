---
layout: resume
bare_layout: true
title: Demian Ferreiro's Résumé/CV
override_head_title: true
---

# Demian Ferreiro <small>Résumé/CV</small>

**Go to:** [Contact](#contact) \| [Projects](#projects) \| [Skills](#skills) \| [Experience](#work) \| [Education](#education)<br><br>

I'm a software developer with more than 15 years of professional experience, most recently working on web applications, as well as backend services and technical leadership.

I'm fluent in Ruby, Java/TypeScript, and English. I've also written my fair share of Java, Python, SQL, Bash, C++, Rust, and many more. I like learning, and care about detail, so I tend to go in-depth in whatever I'm working on.

I always have a user-first perspective when developing software. So valuing aspects like correctness, simplicity, or performance comes naturally: users like non-buggy, easy-to-use, and fast software.

I've worked in teams of many sizes, from tiny startups where I was the sole developer of the whole backend, to big organizations where the coordination between hundreds of developers was a big challenge. And from greenfield projects to maintenance and modernization of legacy systems.

## Contact
- <epidemian@gmail.com>
- <https://demian.ferrei.ro>
- GitHub: <https://github.com/epidemian>
- Location: Bariloche, Argentina (GMT-3)

## Selected projects {#projects}
- [URL Snake](https://demian.ferrei.ro/snake): a silly snake game that can be played in the browser URL.
- [λ-Espresso](https://demian.ferrei.ro/lambda-espresso/): an online lambda calculus interpreter.
- <abbr title="Advent of Code">AoC</abbr> solutions for years [2020](https://github.com/epidemian/advent-of-code-2020) (in Ruby), [2021](https://github.com/epidemian/advent-of-code-2021), [2022](https://github.com/epidemian/advent-of-code-2022) and [2023](https://github.com/epidemian/advent-of-code-2023) (in Rust). Done for fun and to hone my skills in these languages. I tried to write "good" code and journal my learnings. Getting to 100% completion was a great challenge :)

## Skills, or what I do... {#skills}
- Develop complex web applications using the "modern" React-centric approach.
- Prefer writing "classic" web pages —with server-side rendered HTML, CSS, and vanilla JavaScript— when interactivity is low and the complexity of JS frameworks is not justified.
- Develop and deploy backend services.
- Work with other developers to design complex systems. And always keep an eye on opportunities to reduce incidental complexity.
- Write technical documentation and give internal talks.
- Collaborate with product managers to plan and prioritize features.
- Write and contribute to open source projects.
- Mentor new developers, review code, and help with establishing good engineering practices and camaraderie.
- Interview and review hiring candidates.

## Professional Experience {#work}

{% for job in site.data.jobs %}
<h3>
  <span>{{ job.role }}, {{ job.org }}</span>
  <small>{{ "" | split: "" | push: job.location | push: job.time | compact | join: ", " }}</small>
</h3>
{{ job.description }}
<p class="techs">{{ job.buzzwords | join: ' · ' }}</p>
{% endfor %}

## Education & Teaching {#education}

### Software Engineering, Universidad de Buenos Aires <small>2006 – 2011</small>

A 6-year career program comparable to a master's degree, with a focus on natural sciences, maths, programming, and software design. I ended dropping out at around 2/3rds into the program, but learning a ton.

### Collaborator, Universidad de Buenos Aires <small>2009 – 2010, 2021</small>

While at uni, I worked as an ad honorem professor on the "Algoritmos y Programción II" course, which teaches intermediate programming concepts. In 2020 I got back as a collaborator on the "Algoritmos y Programción III" course, which focused on OOP and was taught remotely due to the Covid pandemic.


---

**Last update:** September 2024
