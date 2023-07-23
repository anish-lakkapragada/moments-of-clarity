---
layout: post
title: "Hidden Taylor Series in Theoretical Machine Learning"
date: 2022-09-26 0:49:49 -0700
categories: [theoretical]
---

<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

**Keywords: Taylor Series, Calculus, Gradient Descent, Polynomial Regression, Theoretical ML**

This article hopes to provide an alternate look at some of the most foundational algorithms in machine learning, namely Gradient Descent and Polynomial Regression, from an angle of Taylor Series.
Taylor Series are an extremely nice approximation method from calculus and are actually quite common in machine learning.

> Machine Learning is about creating functions to model (i.e. approximate) functions in data - Taylor series is about approximating functions as well; it should come as no suprise that they are related in many cases.

## Taylor Series Primer

So, what are taylor series? I won't go into the proof here, because I don't remember it and I don't think its required, but the main detail is that Taylor Series are a way to approximate any function $$ f(x) $$ at a given point $$ c $$ using an infinite sum of polynomials. It's formula is shown below:

$$f(x)=\sum_{n=0}^\infty f^{(n)}(c)\frac{(x-c)^n}{n!} = f(c) + f^{(1)}(c)(x-c) + \dfrac{f^{(2)}(c)(x-c)^2}{2} + \ldots$$

Where $$f^{(n)}(c) $$ represents the $$n$$-th derivative (or just $$f(c)$$ if $$ n$$ is 0), at a point of $$x=c$$. Above, we only explicitly show the summation up to the second degree term - if we were to remove the other terms $$ \ldots $$, we would be left with the *second-degree approximation* of $$ f(x) $$. Using finite approximations of a taylor series will become important later, as infinite summations are not always possible in a computer.

On with the examples!

## Taylor Series in Gradient Descent

_Before reading about the usage of Taylor Series in gradient descent, keep in mind that many different calculus concepts (not just taylor series!) play into gradient descent._

Gradient Descent is an iterative algorithm to generally optimize some function overtime based on its gradient (vector of partial derivatives.) The gradient yields a vector that tells the fastest way to ascend a curve - with gradient _descent_ you try to go _down_ the curve and thus constantly move in the negative of this gradient (moving with the positive is called gradient ascent). Gradient Descent is shown below.

$$ \theta*{t} = \theta*{t - 1} - \alpha \* \nabla*{\theta*{t - 1}} J $$

For more clarification, $$ \theta*{t} $$ are the parameters of the model (gradient descent is model agnostic, so this could range from linear regression to GPT-3) at a timestep $$ t $$ and $$ \nabla*{\theta\_{t - 1}} J $$ represents the gradient of the objective function $$ J $$ that we are trying to minimize. It's not shown, but $$ J $$ takes in the parameters $$ x, y $$ and $$ \theta $$.  As stated, we move in the direction of the negative of the gradient. $$ \alpha $$ is the learning rate and is applied to scale the gradient and prevent too high movements.

Gradient Descent can be re-thought of as finding some value $$ \Delta \theta $$ to adjust $$ \theta*{t - 1} $$ at each iteration $$ t $$ such that $$ J(\theta*{t - 1} + \Delta \theta) $$ is less than $$ J(\theta\_{t - 1}) $$. This is where taylor series come in - they help us find this required change. The taylor series to approximate the new value of the objective function to the first-degree is shown below.

> Disclaimer: My linear algebra and multivariable calculus skills are kinda DNE, so please don't try to inspect every term and make sure that the shapes all match up (probably missing a transpose here and there). Instead try to built intuition of the general approach.

$$ J(\theta*{t - 1} + \Delta \theta) \approx J(\theta*{t - 1}) + \nabla*{\theta*{t - 1}} J \* \Delta \theta $$

This is a bit confusing, so let's clarify, in this case the $$ x $$ in the approximation of $$ f(x) $$ is actually $$ \theta*{t - 1} + \Delta \theta $$ and thus the taylor series is centered at a point $$ c $$ of $$ \theta*{t - 1} $$. This means that the first-degree term $$ x - c $$ actually equals just $$ \Delta \theta $$.

This is where it gets clever. Given that we set $$ J(\theta*{t - 1}) $$ or $$ J(\theta*{t - 1} + \Delta \theta) $$ to be less than $$ J(\theta*{t - 1}) $$, to make both sides of the approximation equal, we basically need to find a way to balance the right and left side by reducing $$ J(\theta*{t - 1}) $$ with negatives from the first-degree expression ($$ \nabla*{\theta*{t - 1}} J \* \Delta\theta $$) to it. We could just set $$ \Delta \theta $$ to $$ -1 $$, but because $$ \nabla*{\theta{t - 1}} J $$ is a matrix - there is no guarantee that all of the numbers inside of it will necessarily be the same sign. Thus we need to find some value of $$ \Delta \theta $$ that will make $$ \nabla*{\theta{t - 1}} J $$ ALL negative.

This is actually much easier than expected. Just set $$ \Delta \theta $$ to the _negative_ of $$ \nabla\_{\theta{t - 1}} J$$ and we guarantee all elements are negative (as a gradient squared yields all positive values.) This leads to the approximation having any chance of balancing out. As we add more degrees to the taylor polynomial, this approximation would keep on getting better.

This means that in our (minimization) algorithm of Gradient Descent, with $$ \alpha $$ for stability, we have:

$$ \theta*{t} = \theta*{t - 1} + \Delta \theta _{t - 1} = \theta_{t - 1} - \alpha \* \nabla\_{\theta{t - 1}} J $$

That's gradient descent!

A lot of this information was taken from [here](https://www.cs.princeton.edu/courses/archive/fall18/cos597G/lecnotes/lecture3.pdf) and summarized to be less confusing and more intuitive here. We can expand this method to actually include second and third derivatives as well - but those aren't used as much due to requiring more computational power (sorry for the explanation that literally _everyone_ gives.)

## Taylor Series in Polynomial Regression

Weeee that was a lot of work for gradient descent! Luckily, applications of taylor series in polynomial regression is much more straightforward.

Polynomial regression is basically a type of linear regression where a single input (let's stick to one-dimensional input for simplicity) is raised to higher powers and then the appropriate coefficients are found. The prediction function for a two-degree polynomial regression is shown below.

$$ \hat{y} = h(x) = \beta*{0} + \beta*{1}x + \beta\_{2}x^{2} $$

As shown above, $$ \hat{y} $$ are the predictions and $$ \beta\_{n} $$ are the coefficients for $$ x $$ raised to the $$n$$-th power. Already looks like a taylor series (or maclaurin series as $$ c = 0 $$) right?

In fact, it is! It's that simple. Let's see if this actually works in practice.

### Empirical Experiment with Exponentials

Alliteration, huh? Okay, so the famous taylor series of the function $$ e^{x} $$ is shown below.

$$ e^{x} = \sum\_{n = 0}^{\infty} \dfrac{x^{n}}{n!} = 1 + x + \dfrac{x^{2}}{2} + \ldots$$

Will Polynomial Regression (to a degree of 2) actually learn this specific taylor series? To reiterate, if I train a Linear Regression model with [scikit-learn](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html)'s in Python, that takes in $$ x $$ and $$ x^{2} $$ as input - will it learn $$ {1, 1, 0.5} $$ as $$ \beta*{0}, \beta*{1}, \beta\_{2} $$ respectively?

Will this taylor series be learned, from an algorithm derived from taylor series 🤯 ?

```py
from sklearn.linear_model import LinearRegression
import numpy as np

"""
we'll generate from a normal distribution as the
second-degree polynomial approximates best in this range.
"""
X = np.abs(np.random.randn(1000, )) # 1000 standard normal samples
y = np.power(np.e, X) # labels
```

We can now construct the $$ X^{2}$$ data. We'll merge into `X_poly` which will contain two columns - the first one for $$ X $$ and the second one for $$ X^{2} $$.

```py
X_2 = np.power(X, 2)
X_poly = np.concatenate((X.reshape(-1, 1), X_2.reshape(-1, 1)), axis=1)
```

Let's apply Linear Regression.

```py
lin_reg = LinearRegression() # lin reg algorithm
lin_reg.fit(X_poly, y)
```

Let's inspect the coefficients $$ \beta*{1}, \beta*{2} $$.

```py
>>> lin_reg.coef_
array([-1.24106858,  2.25427569])
```

And the bias $$ \beta\_{0} $$.

```py
>>> lin_reg.intercept_
1.5053263303981406
```

Looks like it won't.

My hypothesis is that if you use a higher-degree approximation (and of course have much more data), it will be more likely the coefficients will slowly fall in line with the _true_ taylor polynomial. In our case, given that it only had a sample of $$ e^{x} $$ and not the whole infinite set of values, it is to be expected that not the precise values were found as these values actually could have minimized the mean-squared error more for this specific training set $$ X $$.

Also, if Polynomial Regression is a taylor series polynomial then linear regression is a first-degree taylor series?

## Review

Congrats on making it here!

Taylor Series are a great way to approximate any function into polynomials. They have a lot of hidden applications in machine learning mathematics. We went over their role in helping determine how to move iteratively in Gradient Descent and it's very clear application to Polynomial Regression.

Please let me know what more theoretical machine learning applications you find! Thanks for reading.
