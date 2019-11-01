---
title: Turing Categories
date: 2019-09-23
---

Source: [n-Category Cafe: Turing Categories](https://golem.ph.utexas.edu/category/2019/08/turing_categories.html)

## Restriction Categories

A *restriction category* is a category equipped with an operator

$f: A \to B \mapsto \bar{f}: A \to A$

for each $A,B$, satisfying axioms:

- $f\bar{f} = f$[^idtotal]
- $\bar{f}\bar{g} = \bar{g}\bar{f}$
- $\overline{g\bar{f}} = \bar{g}\bar{f}
- $\bar{g}f = f \overline{gf}$

[^idtotal]: Observe that this implies $\bar{1_A} = 1_A$

The idea is that the morphisms of $\cC$ are partially defined, and $\bar{f}$ is the domain of the morphism $f$, represented as a map which is defined whenever $f$ is (and the identity on this subset), and undefined else.

This entails a partial order on morphisms:
$f \leq g$ if $f = g\bar{f}$. In the interpretation of morphisms as partially defined, this means that $g$ is an extension of $f$.

## Partial Products

We want to ask for this category to have products.
However, there is a subtlety here:
For instance, there are many partially defined functions of sets $A \to 1$ - one for each subset of $A$.
So we ask for a *partial terminal object* - there should be a unique *total* map $!_A: A \to 1$, and this family must satisfy
$!_A \bar{f} = !_B f$ for each $f: A \to B$.

Similarly for the product.
One way to think about this is that, given partial maps $X\to A, X \to B$, we can form a partial map $X \to A\times B$.
But the postcomposition with the projection, $X \to A \times B \to A$, can't necessarily recover the original map, because if $X \to B$ is undefined somewhere, so will this composite be.
So we can only ask that $f$ extends this map.

## Turing Objects

Given $\tau_{X,Y}: A \times X \to Y$, we say that a $\tau_{X,Y}-*index* for another map $Z \times X \to Y$ is a map $h: Z \to A$
making the obvious triangle commute.

If *every* such map admits a $\tau_{X,Y}$-index, we say $\tau_{X,Y}$ is *universal*. And if we have a family of *universal* $\tau_{X,Y}$s for every pair of objects, we call $A$ (or really, $(A,\tau)$) a *Turing object*, and $\cC$ a *Turing Category*.

The map $A \times A \to A$ is special - it is called the *Turing morphism*, and in fact the entire structure can be recovered from it, by
$A \times X \to A \times A \to A \to Y$.

Here $X \to A \to X$ and $Y \to A \to Y$ are the retractions coming from $\tau_{X,1}$ and $\tau_{Y,1}$.
