---
layout: post
title: "Double Backpropagation: A Forgotten Algorithm"

date: 1 January 2023
categories: [theoretical]
---

<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

**Keywords: Backpropgation, Gradient Descent, Theoretical ML**

Hope you are enjoying the new year 2023! It's been a while since I've uploaded a theoretical algorithm so here we are :)

I've made a few posts and challenges about typical first-order gradient descent that I think it's time I move on to other aspects of ML. But before I do, here's one last gradient-descent-ish article on a variant of standard optimization algorithms and my theory on its potential usefulness in generative models.

Double backpropagation was first created by Le Cun and Drucker in 1992 and since then has been widely dismissed (maybe for computational reasons).Introductory ML courses and books don't even cover it, so perhaps this article will help explain some things.

## Double Backpropagation Algorithm

The name for double backpropagation is a little weird because it's not actually backpropagation (basically gradient descent) applied twice but just an addition of another term in the objective function. For an objective function $$ J $$ to optimize parameters $$ \theta $$ on a training set $$ X $$ , the double backpropagation function $$ J'$$ is given by:

$$ J'(\theta) = J(\theta) + \lambda \lVert \frac{\partial J(\theta)}{\partial X} \rVert^{2} $$

It's actually pretty simple. The new objective function is just the regular objective functive plus the differentiable L2-norm of the gradient of the regular objective function with respect to the input scaled by some _hyperparameter_ (you choose the value) $$ \lambda $$.

### Why?

> Double Backpropagation is motivated by forcing the parameters to be as generalizable as possible.

More concretely, the value of the adjusted function $$ J' $$ does not care just about the performance of the model with the parameters $$ \theta $$ but also how stable they are. If the input $$ X $$ is changed slightly, the model's performance (objective function $$ J $$) should ideally not change much. This is similar to _augmentations_ where we want the predictions (e.g. a cat image predicted as a cat) to be the same regardless of small changes in the input - both double backpropagation + augmentations try to _force_ the model to be generalizable to differing input. This is of course helpful because when a model is deployed, the input the model will encounter may not be similar to the data gathered use for training.

This is why the (partial) derivative in the equation measures the model's performance (objective function value) sensitivity to small changes in the input $$ X $$ is added. The algorithm is known as _double_ backpropagation because a [gradient of a gradient](http://luiz.hafemann.ca/libraries/2018/06/22/pytorch-doublebackprop/) is utilized.

## Double-Backpropagation for Smooth Latent Spaces (?)

Just some background here. Generative models (for our purposes) are any type of model which takes in random vector input and generates some novel output. For example, a generative model $$ G $$ is a function that takes in a random generated vector $$ \vec{x} $$ and returns an image $$ Y $$.

Let's say this generative model is trained through some black-box witchcraft (or a GAN training procedure) to generate images of people through these vectors. In this case, differing vectors will produce different people (e.g. different genders, races, body type, etc.)

> A latent space is the full extent of values the vector can take, where similar generated images will come from vectors which are near each other in this space.

A short aside: one of the most underrated parts about machine learning is its ability to frame an infinite space (e.g. vector input values in a generative model) in a way that makes sense: similar output images are generated with vectors that are close to each other. More impressive, these computers don't really know the meaning of words or images (they just see numbers) but can formulate a good understanding of the world.

Ideally in these models, the mapping of the input vector $$ \vec{x} $$ to the image $$ Y $$ learned by $$ G $$ is _smooth_ - small changes in $$ \vec{x} $$ shouldn't lead to drastic changes in $$ Y $$. Do you see where I am going with this?
