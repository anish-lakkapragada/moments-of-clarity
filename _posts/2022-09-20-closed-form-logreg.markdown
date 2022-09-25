---
layout: post
title:  "Attempts at Closed-Form Logistic Regression"
date:   2022-09-20 16:27:08 -0700
categories: jekyll update
---
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

**Keywords: Logistic Regression, Regression, Normal Equation, Logistic Function, Optimization**


Let's work our way up from the start. Linear Regression is a ubiquitous algorithm in machine learning today, which is most commonly performed through iterative gradient descent. However, another method that I find pretty fascinating is the closed-form solution called the *Normal Equation*, where instead of iteratively trying to minimize $$ L = \sum_{i=1}^{N} (mx_{i} + b - y_{i})^2 $$, ($${m, b}$$ are the parameters), a solution of what value of $$ m $$ sets $$ \dfrac{dL}{dm} $$ to 0 is found. The bias $$ b $$ is then found as $$ \dfrac{\bar{y} - m\bar{x}}{N} $$. Thus this solution is called *closed-form* as it takes a known amount of mathematical operations to solve. 

However, this is old news. Unfortunately, this style of optimization is only possible for simple linear regression. The main reason for this is that the derivative of a linear model is really simple, compared to something like a composite neural network, which likely will require endless chain rule. The closest thing I could find to Linear Regression that has a different shape (hence ridge regression not included) is Logistic Regression, where predictions of $$y_{i}$$ are modeled as $$\sigma(mx_{i} + b)$$, where $$\sigma$$ is the logistic (hence the name) function. The thing to remember though is that Logistic Regression is not really a regressor, but actually a binary classifier model. 

My question is whether we actually can try to create a closed-form solution for Logistic Regression. Two years ago, I tried doing exactly [this](https://www.reddit.com/r/MachineLearning/comments/no5q8j/p_potential_logistic_regression_closed_form/) with such a lazy method that yieled itself a rightful 0 upvotes on r/MachineLearning. Instead of this really bad method, how about trying to edit the current linear Normal Equation for our case? A really good derivation of the Normal Equation can be found [here](https://eli.thegreenplace.net/2014/derivation-of-the-normal-equation-for-linear-regression/) - Perhaps, let's see if we can modify the objective function to make it more logistic-y and see where that takes us? 

The objective function is defined as $$ L = \dfrac{(X\theta - y)^{T}(X\theta - y)}{N} $$ (let's stick to $$\theta$$ instead of $$ m $$ to look smarter) where $$ X $$ is the training feature matrix, $$ \theta $$ is weight vector (multi-dimensional $$ m $$), and $$ y $$ is the labels vector. the feature We would modify this to contain $$ \sigma(X\theta)- y $$, and soon it becomes clear this approach probably will not work as the resulting expression (before differentiation) will contain a lot  $$\sigma(X\theta^{T})\sigma(X\theta)$$ which is too annoying for my brain to work with. Nobody, promised there would be a solution right?

Another method that I think would be more serious, if only slightly, would be to modify the data itself with an inverse function. Exponential Regression does exactly this by applying a log to all the labels (y-values) to turn the exponential curves more linear. The model then learns a linear model to predict the $$ \ln(y_{i}) $$ which is then exponentiated to give the actual function. Essentially, this just uses an inverse of the $$ \sigma $$ function before the linear outputs. So, let's just calculate the inverse of the logistic/sigmoid function 
($$ \dfrac{1}{1 + e^{-x_{i}}} $$)! This comes out to be $$ -\ln(\dfrac{1}{x_{i}} - 1) $$. Definitely not the worst thing in the world!

Let's specify this inverse as $$ \sigma' $$ and take a step back. We need to apply the function $$ \sigma' $$ to every label to convert it to a line, train a linear model (closed-form), and then take linear productions and run them through $$ \sigma $$ (actual logistic function.) We probably should take a look at the domain of this inverse function, and see if our labels are valid in this range. Unfortunately the inverse of the logistic function is not defined for all real numbers and has semi-sharp asymptotes at $$x=0$$ and $$x=1$$. Even more unfortunate, our labels are binary integers of 0 or 1! 

So far, we have tried a closed-form solution and then layering modifications of inputs and predictions on top of a standard linear closed-form solve. If anything, these examples demonstrate why the logistic regression has no closed-form solution. I believe it is always better to fail yourself than to take somebody else's word that the [transcedental equation](https://youtu.be/32ZemGEYraY?t=76) is why there is no logistic regression closed-form solution. The intuitive explanation I could come up with is that closed-form solutions don't work as well when not trying to draw a line not to predict values (regression) but instead trying to separate areas (classification).

This is the end of our journey. Please let me know what errors I may have made or whatever you find. Thanks.
