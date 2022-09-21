---
layout: post
title:  "Yet Another Comparison of Svelte & React"
date:   2022-09-21 0:00:00 -0700
categories: jekyll update
---

**Keywords: Reactive Frameworks, Svelte, React, JavaScript**

About a year ago, I was introduced to the ever-evolving frontend world where JavaScript frameworks keep on [getting released every single day](https://dayssincelastjavascriptframework.com/) and would like to share my comparison on two frameworks I've worked with the most. In no way am I an expert on either of these frameworks, but I think it's a healthy exercise for me to understand them better by drawing a comparison between them.

React is a framework brought to us by Facebook and is widely considered the most popular JavaScript frontend framework there is. Svelte meanwhile is a relatively new framework introduced by Rich Harris, a journalist for the New York Times, focused on developing small-scale, light web applications. As far as Stack Overflow surveys go, there is an interesting split between them - while React is the most *wanted* framework, Svelte is the most *loved* framework among current developers. Based on my experience thus far, I kind of can see why that is. More on that later. For now, here are the major differences that I felt. 

## 1. useState() in React Sucks

This is probably the biggest thing I can think about between React and Svelte. In Svelte, whenever you have a reactive variable you want to change (which also is used in rendering for-loops or conditionals), you just change it. Just `foo = "bar"` and you are done!

In React, though, a clunky state management solution is provided, where you have to first initialize the default value with `useState(default)` and then use the provided functions (e.g. `foo` and `setFoo`) to update your variables instead of assignment (as aforementioned for Svelte.)

<img src="https://preview.redd.it/twvap8pq9fg91.png?width=680&format=png&auto=webp&s=9bd1e81563e26210644561038b221d25b481bc23">

Because I started out with Svelte and then React, I forget so many times (often for 2 hours at a time) that I can't just use assignment and instead need to go with `useState`. Considering React is older than Svelte, it is somewhat expected that Svelte would have the edge on this one. 

## 2. React Styling

In React, you can either attach another stylesheet or you can use inline styles (in JSON) to the individual components themselves. This is likely just personal preference, but I find it annoying to have to link each component to another css file (~2x more files that way), or to use inline styles. 

Compared to this, Svelte offers either using inline styling or separate styles in the same file as your HTML the same way as vanilla HTML. This is one of the examples where Svelte demonstrates its ridiculously low learning curve. 

## 3. Performance

React is said to treat your model as a blackbox and calculate the difference between what is currently on the page and what should be on the page in a theoretical DOM known as the virtual DOM. Svelte, on the other hand, takes the approach of not using the virtual DOM and instead compiling components at build in a way where the code will take care of whatever rendering changes need to take place. This has been noted to make Svelte have the edge in performance; the Svelte website goes as far as saying the idea that the vDOM makes applications faster is a ["suprising resilient meme"](https://svelte.dev/blog/virtual-dom-is-pure-overhead).

The main idea stated by Svelte is that even if the DOM is slow, adding another vDOM will only make things slower as the native DOM will eventually have to be changed. Furthermore, they point that the `useState` function in React can in some cases lead to parts of applications rerendering even when not needed. 

For fairness, I've only really argued for Svelte thus far (and based pretty closely on their own article.) However, other sources also confirm this and the fact that Svelte is [nearly 26x more lightweight compared to React](https://massivepixel.io/blog/svelte-vs-react/). 

## 4. Popularity 

It would be foolish to discard popularity in this discussion. React, hands down, has more popularity. Svelte has 62K stars, React has almost 200K and has been used in plenty of websites. 

Thus, it follows that when it comes to UI libraries and other community open-source tools React likely will have much better support. 

## Final Remarks 

Both Svelte and React are decent frameworks with intended uses. Given the popularity difference,Svelte makes sense to be primarily for much smaller stuff, whereas React is for building larger websites. 

Back to what I was saying about the most *wanted* vs. most *loved*. Thus far, I still prefer Svelte to React. It's extremely similar to raw HTML/CSS/JS and takes basically no effort to learn (very easy learning curve.) In fact, I think it's easier to learn Svelte first than it is to learn HTML and JS first. However, despite me loving Svelte, I felt that I needed to learn React to collaborate with others on projects, such as the current project to build a coding competition website and grading server for our school's computer science club with 3-4 other devs. 

While React isn't as good as Svelte for me, it isn't terrible and *it's allowing bigger collaborations with more people. After all, that probably matters more.*
