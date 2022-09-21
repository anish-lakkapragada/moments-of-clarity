---
layout: post
title:  "Closed-Form Logistic Regression, anyone?"
date:   2022-09-20 16:27:08 -0700
categories: jekyll update
---
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

**Keywords: Logistic Regression, Regression, Normal Equation, Logistic Function, Optimization**


Let's start from the beginning. Linear Regression is a ubiquitous algorithm in machine learning today, and is most commonly associated with iterative gradient descent. However, another method that I find pretty fascinating is the closed-form solution of the Normal Equation, where instead of iteratively trying to minimize $$ L = \sum_{i=1}^{N} (mx_{i} + b - y_{i})^2 $$, ($${m, b}$$ are the parameters), a solution of what value of $$ m $$ sets $$ \dfrac{dL}{dm} $$ to 0 is found. The bias $$ b $$ is then found as $$ \dfrac{\bar{y} - \bar{x}}{N} $$. Thus this solution is called *closed-form* as it takes a known amount of mathematical operations to solve. 

However, this is old news. Unfortunately, this style of optimization is only possible for simple linear regression. The main reason for this is that the derivative of a linear model is really simple, compared to something like a composite neural network, which likely will require endless chain rule. The closest thing I could find to Linear Regression that has a different shape (hence ridge regression not included) is Logistic Regression, where predictions of $$y_{i}$$ are modeled as $$\sigma(mx_{i} + b)$$, where $$\sigma$$ is the logistic (hence the name) function. The fundamental name is that Logistic Regression is not really a regressor (hence the misnomer), it is actually a binary classifier model. 

My question is whether we actually can try to create a closed-form solution for Logistic Regression. Two years ago, I tried doing exactly [this](https://www.reddit.com/r/MachineLearning/comments/no5q8j/p_potential_logistic_regression_closed_form/) with such a lazy method that yieled itself a rightful 0 upvotes on r/MachineLearning. A really good derivation of the Normal Equation can be found [here](https://eli.thegreenplace.net/2014/derivation-of-the-normal-equation-for-linear-regression/) - perhaps, let's see if we can modify the objective function to make it more logistic-y and see where that takes us? 

The objective function is defined as $$ L = \dfrac{(X\theta - y)^{T}(X\theta - y)}{N} $$ (let's stick to $$\theta$$ instead of $$ m $$ to look smarter.) We would modify this to contain $$ \sigma(X\theta)- y $$, and soon it becomes clear this approach probably will not work as the resulting expression (before differentiation) will contain a lot  $$\sigma(X\theta^{T})\sigma(X\theta)$$ which is too annoying for my brain to work with. Nobody, promised there would be a solution right?

Another method that I think would be more serious, if only slightly, would be to modify the data itself with an inverse function. Exponential Regression does exactly this by applying a log to all the labels (y-values) to turn the exponential curves more linear. The model then learns a linear model to predict the $$ \ln(y_{i}) $$ which is then exponentiated to give the actual function. Essentially, this just uses an inverse of the $$ \sigma $$ function before the linear outputs. So, let's just calculate the inverse of the logistic/sigmoid function 
($$ \dfrac{1}{1 + e^{-x_{i}}} $$)! This comes out to be $$ -\ln(\dfrac{1}{x_{i}} - 1) $$. Definitely not the worst thing in the world!

Let's specify this inverse as $$ \sigma' $$ and take a step back. We need to apply the function $$ \sigma' $$ to every label to convert it to a line, train a linear model (closed-form), and then take linear productions and run them through $$ \sigma $$ (actual logistic function.) We probably should take a look at the domain of this inverse function (which will become our labels in training the linear model.) Unfortunately the inverse of the logistic function is not defined for all real numbers and has semi-sharp asymptotes at $$x=0$$ and $$x=1$$. This means we basically need the original input data to be from 0-1, which isn't that bad of an assumption to make considering the bajillion medium articles stating to normalize your data. 

Further experiments would be needed, but who knows - maybe this actually could work? Normalizing the data, using the inverse logistic function, training linear regression, and then sigmoiding the predictions sounds wack, but I guess backpropagation did as well 20 years ago :/. 

I don't want to end this post on a lownote - so I'll save the results for this once I actually run them instead of here. 

Please let me know what errors I may have made or whatever you find. Thanks.





