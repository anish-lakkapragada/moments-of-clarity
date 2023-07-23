---
layout: post
title: "Gradient Descent Revisited As Euler's Method"
date: 2022-10-11 0:00:00 -0700
categories: [theoretical]
---

<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

**Keywords: Gradient Descent, Euler's Method, Differential Equation**

I've already talked a fair amount about Gradient Descent. One of the most fascinating things about Gradient Descent is the amount of ways in which it secretly packs calculus concepts together. Aside from the fact that it literally uses *gradient*s, or partial derivatives, gradient descent is also derived from a [Taylor Series](2022-09-27-mltaylorseries%20copy.markdown) which I've detailed before. Today I'd like to detail Gradient Descent in further detail as actually an application of Euler's Method.

## Gradient Descent as a Differential Equation

As a refresher Gradient Descent is:

$$ \theta*{t} = \theta*{t - 1} - \alpha\nabla*{\theta*{t - 1}} J$$

Unlike with the Taylor Series article, this time we will be keeping the learning rate $$ \alpha $$ into consideration.

Gradient Descent can actually be summarized as this Differential Equation.

$$ \dfrac{∂\theta*{t}}{∂t} = -\alpha \dfrac{∂J(\theta*{t})}{∂\theta\_{t}} $$

This differential equation is obviously unsolvable. A common way of approximating a function when an unsolvable differential equation is given is to use Euler's method.

## Primer on Euler's Method

Euler's Method is a way to approximate any function's value giving an initial starting point and it's differential equation. For the given $$y(0)=0$$ and unsolvable differential equation $$\dfrac{dy}{dx} = \lvert x \rvert$$, we can solve for $$y(2)$$ by choosing a set number of iterations $$n$$ and working our approximation up.

So for example if we want to do only 2 iterations, we would increase $$ x $$ by 1 each time. The step to first calculate $$y(1)$$ is shown below.

$$y(1) \approx y(0) + \Delta x*y'(0)$$

where in this case $$y'(0)$$ would represent the derivative of $$y$$ at $$x=0$$ and $$ \Delta x$$ gives the change in x (which in our case is 1). This would give us an approximation of $$y(1) \approx 0$$.

We could redo this one more time and get $$y(2) \approx y(1) + y'(1)$$, yielding $$y(2) \approx 1$$. Of course this approximation is not accurate - however as the stepsize $$ \Delta x$$ approaches to 0 the approximations will get more accurate but there will be a lot more iterations. Hey, with gradient descent they always say a lower learning rate of $$\alpha$$ does better but requires more iterations -- I sense some very big similarities.

## Gradient Descent Conclusion

Let's look at our algo again - gradient descent is given by $$ \theta*{t} = \theta*{t - 1} - \alpha\nabla*{\theta*{t - 1}} J$$, thus we can see that it is basically euler's method with a step size of $$\alpha$$, however done in reverse (hence the negative in the step size.)

Yet another perspective on how to view Gradient Descent. More to come.
