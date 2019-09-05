---
title: Simplicial Nerve and $\mathfrak{C}$
---

The usual functor $N: Cat \to sSet$ is defined by
$\Hom_{sSet}(\Delta^n, N\cl{C}) = \Hom_{Cat}([n], \cl{C})$. This makes
sense for $\cl{C}$ a simplicial category, but it's not very interesting,
since it forgets the simplicial structure. We want to replace $[n]$ by a
simplicial category $\mathfrak{C}(\Delta^n)$ which is more interesting.
The idea is this:

-   A functor $\frk{C}(\Delta^0) \to \cl{C}$ should be the same thing as
    an object in $\cl{C}$.

-   A functor $\frk{C}(\Delta^1) \to \cl{C}$ should be the same thing a
    a morphism in $\cl{C}$.

-   A functor $\frk{C}(\Delta^2) \to \cl{C}$ should be the same thing,
    not just as a pair of composible morphisms $x \to y \to z$ in
    $\cl{C}$, but three morphisms: $f: x \to y,\ g:y \to z,\ h:x \to z$,
    and a $1$-simplex (path) between $g \circ f$ and $h$ in
    $\Hom_\cl{C}(x,z)$. In other words, a choice of two composible
    morphisms, and a *choice* of composite $h$ and of homotopy
    witnessing the relation.

This suggests that $\frk{C}(\Delta^0)$ should be $[0]$,
$\frk{C}(\Delta^1)$ should be $[1]$ (both regarded as simplicial
categories with discrete morphism sets) and that $\frk{C}(\Delta^2)$
should have three objects $0,1,2$, with singleton hom-spaces except
$\Hom(0,2)$, which has two morphisms and a $1$-simplex connecting them.

The higher versions of $\frk{C}(\Delta^n)$ are more complicated to
describe like this. There is a description on page 20 of [@LuHiTop]
(definition 1.1.5.1).

Given a simplicial category $\cl{C}$, define the *Simplicial nerve* of
$\cl{C}$, $N\cl{C} = N_\Delta(\cl{C})$ by the property
$$\Hom_{sSet}(\Delta^n, N\cl{C}) = \Hom_{Cat_\Delta}(\frk{C}(\Delta^n), \cl{C})$$

We generally omit the subscript $\Delta$ from simplicial nerve. This is
potentially ambiguous, since in principle $N\cl{C}$ could also mean the
usual nerve of $\cl{C}$ regarded as an ordinary category. We are
generally not interested in the usual nerve of categories with
nontrivial simplicial structure, so there is no great risk of confusion.

On the other hand, an ordinary category may be regarded as simplicial by
letting the hom-sets be discrete/constant. In this case, the two
possible versions of the nerve do coincide.

If the simplicial category $\cl{C}$ is fibrant (has all hom-sets Kan
complexes), then $N\cl{C}$ is an $\infty$-category.

$\frk{C}$ can be regarded as a functor $\Delta \to Cat_\Delta$ (we
already used this implicitly when describing the nerve). Since
$Cat_\Delta$ admits colimits, $\frk{C}$ extends along the inclusion
$\Delta \hookrightarrow sSet$ in a unique colimit-preserving way. We
denote the resulting functor also $\frk{C}: sSet \to Cat_\Delta$

Essentially by construction, $\frk{C}: sSet \to Cat_\Delta$ is left
adjoint to $N: Cat_\Delta \to sSet$

This functor is the desired comparison functor from $\infty$-categories
to simplicial categories.

Let $\cl{C}$ be a simplicial category. Then the map
$$\Hom_{\frk{C}(N\cl{C})}(A,B) \to \Hom_\cl{C}(A,B)$$ is a weak
equivalence for each $A,B \in \cl{C}$.

This proposition essentially states that "no information is lost" by $N$
- at least, no homotopy information.

Many of the following constructions will be of primary interest in the
case where the simplicial sets in question are $\infty$-categories.
However, since they make sense for any simplicial set and the general
case is of some technical interest, we develop it.

If $S$ is a simplicial set, we define the homotopy category
$hC = h\frk{C}(C)$. We will consider both the $\cl{H}$-category and the
underlying ordinary category. A map of simplicial sets is a *categorical
equivalence* if the induced functor of homotopy categories is an
equivalence of $\cl{H}$-enriched categories.

The reliance on $\frk{C}$ to describe the homotopy category is not very
satisfying - it seems that all we can satisfyingly say about
$\infty$-categories so far is that no (homotopy) information is lost
when we apply $N$. We would like to have a more explicit description of
the homotopy category in terms of the simplicial data. Fortunately this
is available.

We have an adjunction $\adjunction{\frk{C}}{sSet}{Cat_\Delta}{N}$ By the
general nonsense of enriched categories, we have another adjunction
$\adjunction{U}{Cat_\Delta}{Cat}{F}$, where $U$ forgets the simplicial
structure, and $F$ equips a normal category with discrete morphism
spaces. This yields a characterization of the ordinary category
$h\cl{C}$ of a simplicial set $\cl{C}$ (sometimes called the fundamental
category) - it is characterized by
$Cat(h\cl{C}, D) = sSet(\cl{C}, N(D))$ (since the simplicial nerve of a
discrete simplicial category is the usual nerve).

We can't quite describe the $\cl{H}$-enriched version in the same way,
because there's no left adjoint to the localization functor
$sSet \to \cl{H}$ - there's no canonical way of choosing a simplicial
model for a homotopy diagram.
