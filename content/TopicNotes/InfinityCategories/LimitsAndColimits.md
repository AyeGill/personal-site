---
title: Limits and Colimits
---
An object (ie, vertex) $X$ of a simplicial set $\cl{C}$ is *initial* if
it's "weakly initial" in $h\cl{C}$ with the $\cl{H}$-enriched structure,
i.e. if $\Hom_{h\cl{C}}(X,y)$ is contractible for all other objects $Y$.
Dually define *final* (or *terminal*) objects.

Let $p: K \to \cl{C}$ be a functor. The $\infty$-category $\cl{C}_{/p}$
should be regarded as the category of cones on the diagram $p$. Indeed,
an object of $\cl{C}_{/p}$ is a morphism
$\Delta^0 \star K = K^\triangleleft \to \cl{C}$ agreeing with $p$ on
$K$, which is essentially the data of a cone on $p$

We should expect $\cl{C}_{/p}$ to equal (or at least be equivalent to)
the full subcategory of $Fun(K^\triangleleft, \cl{C})$ spanned by those
functors restricting to $p$ on $K$. Is this true?

If $p: K \to \cl{C}$ is a diagram in $\cl{C}$, a *colimit* of $p$ is an
initial object of $\cl{C}_{p/}$, and a *limit* of $p$ is a final object
of $\cl{C}_{/p}$.

Let $\cl{C}$ be an $\infty$-category, $q: T \to \cl{C}$ and
$p: K \to \cl{C}_{/q}$ two diagrams. Let $p_0 : K \to \cl{C}$ be the
composition with the projection, and suppose it has a colimit. Then:

-   $p$ has a colimit in $\cl{C}_{/q}$, which is preserved by the
    projection.

-   A cone on $p$ is a colimit if and only if the composition with the
    projection is a colimit.

This dualizes to a statement about limits and undercategories in an
obvious way.

If $\cl{C}$ is an $\infty$-category which admits all colimits of a
certain shape (that is, colimits of diagrams $K \to \cl{C}$ for some
$K$), then the same is true of $\cl{C}_{/p}$ for any diagram $p$.
