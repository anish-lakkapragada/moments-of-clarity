---
layout: post
title: "A Hard Question (Partially) Answered, Badly"
date: 2023-07-21 7:00:00
categories: [thinking]
---

<script type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_CHTML">
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$','$'], ['\\(','\\)']],
      processEscapes: true},
      jax: ["input/TeX","input/MathML","input/AsciiMath","output/CommonHTML"],
      extensions: ["tex2jax.js","mml2jax.js","asciimath2jax.js","MathMenu.js","MathZoom.js","AssistiveMML.js", "[Contrib]/a11y/accessibility-menu.js"],
      TeX: {
      extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"],
      equationNumbers: {
      autoNumber: "AMS"
      }
    }
  });
</script>

> I have managed to not post anything here for a whole month. :<

Every night, I am challenged with the question of whether to keep on watching videos on YouTube that I know I'll forget by the next morning or whether not to sleep. As a big fan of psuedomathematics - mathematics applied in the least non-rigorous setting for the most fun possible - I'm going to try to apply that here. I'll go over in the end why pseudomathematics is (maybe?) not a complete waste of time.

## Getting Started

Assuming everything in your life is predetermined (big assumption, I know) - we can assume the functions of $$ life(t) $$ or $$ l(t) $$ is set. This function will return your set of experiences $$ e $$ each of which can be evaluated for a happiness score $$ H(e(t)) $$ and a memorability score $$ M(e(t)) $$. For now, let's assume that $$ e(t) $$ is a vector-valued function with values that are interpretable in the same way of a latent space. The first element of this vector is the time at which this experience starts. Given this, the total happiness in your life $$ Q $$ from $$ t=0 $$ to time $$ T $$ over a total of $$ E $$ experiences

$$
Q(T) = \sum_{i=1}^{E} M(e_{i}) * H(e_{i})
$$

or with cheesy calculus,

$$
Q(T) = \int_{t=0}^{T} M(l(t)) * H(l(t)) dt
$$

But we are not done yet! Keep in mind that the memorability $$ M(e(t)) $$ and its happiness $$ H(e(t)) $$ will actually vary throughout your life. An event may be forgotten about but then remembered, or may seem happy at first but then become sad. Not to mention both $$ M $$ and $$ H $$ are probably correlated, which we can ignore to make things simpler. For now, let's revise the calculation of happiness to be for a single experience.

$$
Q(e_{i}, T) = \int_{t=e_{i}[0]}^{T} m_{i}(t) * h_{i}(t) dt
$$

where the $$i$$th event will have it's own memorability and happiness functions for each second - $$m_{i}(t)$$ and $$h_{i}(t)$$ respectively. Because "life is nothing more than experiences" we can just sum up the experiences given by $$ l(t) $$ at each second.

$$
Q(t) = \int_{t=0}^{T} Q(l(t), T)dt = \int_{t=0}^{T} [\int_{s=t}^{s=T} m_{i}(t) * h_{i}(t) * ds] * dt
$$

This also means the change of your happiness every second is given by

$$
    Q'(t)= \int_{t}^{T} m_{i}(t) h_{i}(t) dt
$$

Of course this can all be repeated for pain/sadness, which we'll just assume is the negative of happiness here. But the basic tradeoff of memorability vs. happiness is still there.

## Back to the Question

So basically this view of happiness leaves a question of whether its better to have higher happiness and less memorability or vice versa. We'll look at each case before translating our rationale to math.

### Case 1

A situation with higher happiness and less memorability looks like an overworked hedge fund manager choosing to have a year long vacation (at its extreme).

### Case 2

The most extreme example of living with no memorability but constant happiness would be partying every single day, watching YouTube every single day, not working a mundane job, etc.

The goal of contemplating this is to understand the behavior of the functions $$m(t) $$ and $$h(t)$$. Which scenario seems better? Of course, I think most people would choose Case 1 - the common argument would be that Case 2 is aimless and vainful. Both memorability & happiness of a given experience $$ i $$ decay past that event's starting time.

It's also imperative to remember that given the current mathematical formulation, we are trying to maximize happiness greedily as we are only looking at $$ Q(t) $$ of the current time and not considering long-term effects. This sways much more heavily to case 2 - that happiness leaves slower than memorability.

This actually, does make sense. When going to a restuarant and eating a dish we've never seen before we will likely only remember a few things - 2 minutes of conversation, the first time we saw our food, etc. Happiness of eating the dish when we are hungry would last a little longer.

Therefore, I think it's fair to say that because memorability of an experience after its start date is naturally focused on non-mundane points (beginning, end) whereas happiness of an experience seems to last longer we can rationale that happiness of an event dies down at a lesser power than memorability. Even further, because memorability focused on specific points (1-2% of the actual lifetime), that means that $$ m(t) $$ is very likely 0. Therefore, counterintuitively we should be optimizing memorability over happiness.

## Back to Problem Again

Because $$ m(t) $$ is going to be 0 a lot more than $$ h(t) $$, we need to increase $$ m(t) $$ as much as possible to make $$ h(t) $$ actually mean something. Therefore uniqueness of experience and variety matters more than feel-good indulgence.

> Stop watching YouTube at 4am lol.

## Why use Pseudomath

What I just did is a horrible way to solve a problem.

Pseudomath is a continual reminder that math can't solve _all_ our toughest problems. Problems so hard a book didn't come with them. Furthermore, if I had not used pseudomath how would I have thought about the tradeoffs of memorability and happiness? Maybe I would have instead said optimizing happiness is better because we only have one life, or that we don't forget the happy moments in our life.
