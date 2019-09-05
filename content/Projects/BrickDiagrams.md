---
title: Brick Diagrams
date: 2019-09-04
---

This is about an "invariant" approach to pseudo double categories.
The fact that one must choose a composite for each pair of horizontal morphisms feels unsatisfying to me.
This is pretty far from being usable.
This also seems to be an attempt to axiomatize "double categories with pinwheel", see [nlab](https://ncatlab.org/nlab/show/double+category#Unbiased)

::: Definition :::

A *double poset* is a set equipped with two partial orders, which I will usually write $\leq_V, \leq_H$.
We call one the *vertical* order, and one the *horizontal* order.

A map of double posets is a map of the underlying sets which preserves the ordering.
We call it a double monotonic map.

Given a double poset $(A, \leq_V, \leq_H)$, we can regard it as a (strict) double category,
by letting $A$ be the set of objects, having the vertical category be $(A,\leq_V)$, the horizontal category be $(A, \leq_H)$, and defining there to be exactly one 2-cell filling every square, i.e a 2-cell is precisely four objects $a,b,a',b'$, such that $a\leq_H b, a'\leq_H b', a\leq_V a', b\leq_V b'$.

A map of double posets is equivalent to a functor of the corresponding double categories.

Given posets $X,Y$, we equip $X \times Y$ with a double poset structure where

- $(x,y) \leq_H (x',y') if $x \leq x'$ and $y = y'$.
- $(x,y) \leq_V (x',y') if $x = x'$ and $y \leq y'$.

A *brick diagram* is a sub-double poset of $[n]\times [m]$, for $n,m \in \bN$.[^Nzero]

We denote by $Brick$ the category of brick diagrams and double monotonic maps between them.

A *brick set* is a presheaf $Brick^{op} \to \Set$.
We write $bSet$ for the category of brick sets.
:::

[^Nzero]: Here $0 \in \bN$.

We denote by $Db\Cat$ the $1$-category of pseudo double categories and functors.[^Ftype]
Note that we do not want equivalence classes of functors.
Hence we must use a notion of functor which composes strictly.

[^Ftype]: This is not really unambiguous - see the nlab page.

::: Proposition :::
The natural functor $Db\Cat \to bSet$, sending a double category $\bC$ to the presheaf $D \mapsto Db\Cat(D,\bC)$, is fully faithful.
:::

To see faithfulness, note that if $F,G: \bC \to \bD$ are identified under this functor,
then in particular they act the same on $Db\Cat(\to, -), Db\Cat(\downarrow, -)$, and $Db\Cat(\square,-)$,
the sets of vertical, horizontal and $2$-cells. Hence they must agree.

There are some problems with this - it seems that we currently must have strict composition of horizontal morphisms, which is clearly a mistake.
This is probably related to the choice of type of functor above.

There is also weirdness, as noted, in relation to the pinwheel:

![The pinwheel](/images/pinwheel.png)

Which is a perfectly fine brick diagram, but a composition of this type is not allowed in a general double category.

However, it seems composites of this type do exist in most examples of double categories, so this may actually be an advantage of this approach.

It is possible that the correct approach has a *category* for each brick diagram - as we would get if we took the bicategory nature of $Db\Cat$ seriously.
This may account for the "unnatual choices" we seem to encounter.
But such an approach would seem unreasonably complicated.
