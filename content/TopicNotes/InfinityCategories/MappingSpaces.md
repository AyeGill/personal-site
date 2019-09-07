---
title: Mapping Spaces of $\infty$-categories
---

Let $S$ be a simplicial set with $x,y$ vertices of $S$. Define
$\Map_S(x,y) = \Map_{hS}(x,y) \in \cl{H}$

It will often be necessary to choose a concrete simplicial set
representing $\Map_S(x,y) \in \cl{H}$. Of course, by definition one can
choose $\Map_{\frk{C}(S)}(x,y)$, but the construction of this is very
complicated. Also, it's not necessarily a Kan complex, so it may be
inconvenient to work with.

Given a simplicial set $S$ with vertices $x,y$, define
$\Hom_S^R(x,y) \in sSet$ in the following way:
$$\Hom_{sSet}(\Delta^n, \Hom_S^R(x,y)) = \{z: \Delta^{n+1} \to S \mid z|\Delta^{\{n+1\}} = y,\ z|\Delta^{\{0, \dots n\}} \text{ constant at $x$}$$
$\Hom_S^R(x,y)$ is also called the set of *Right morphisms* from $x$ to
$y$

Define the set of *left morphisms* $\Hom_S^L$ in the dual way.

A $0$-simplex of $\Hom^R_S(x,y)$ is a $1$-simplex from $x$ to $y$ in
$S$. A $1$-simplex is a two-simplex of $S$ which has the left edge
degenerate at $x$ and the right endpoint at $y$. And so forth.

If $\cl{C}$ is an $\infty$-category containing objects $x,y$, then
$\Hom_\cl{C}^R(x,y)$ is a Kan complex

Given two edges $\phi, \phi'$ in a simplicial set $S$ with the same
source and target, we say they are *homotopic* if there exists a
$2$-simplex of $S$ like so:

Which we may also regard as a path between them in $\Hom_S^L(x,y)$

If $S$ in an $\infty$-category, the relation of homotopy is an
equivalence relation on the set of edges between $x,y$

-   If $\phi$ is an edge, $s_1(\phi)$ is seen to be a homotopy from
    $\phi$ to itself, so homotopy is a *reflexive* relation

-   Suppose $\phi, \phi', \phi''$ are edges from $C$ to $C'$, $\sigma$ a
    homotopy from $\phi$ to $\phi'$ and $\sigma'$ one from $\phi$ to
    $\phi''$. Let $\sigma''$ be the constant $2$-simplex at $C'$. This
    data defines a horn:

    And since $\cl{C}$ is an $\infty$-category, it can be filled. The
    induced face of the horn will be a homotopy from $\phi'$ to
    $\phi''$. Putting $\phi = \phi''$, we see that homotopy is
    *symmetric*. Then the above implies transitivity immediately.

Homotopy is not immediately self-dual, but it turns out to be so if
$\cl{C}$ is an $\infty$-category

Let $\cl{C}$ be an $\infty$-category. We define an ordinary category,
$\pi(\cl{C})$ in the following way:

-   The objects are the vertices of $\cl{C}$

-   The morphism set $\Hom_{\pi(\cl{C})}(x,y)$ is defined to be vertices
    from $x$ to $y$, quotient the relation of homotopy.

-   Composition is defined by filling the evident horn.

If $\cl{C}$ is an $\infty$-category, the composition law in
$\pi(\cl{C})$ is well-defined (i.e. every choice of composite is
homotopic), and the above data defines a category.

Use the horn-filling property on convenient horns. See [@LuHiTop]
Proposition 1.2.3.7 and 1.2.3.8 for details.

There's an isomorphism $h\cl{C} \to \pi(\cl{C})$ which is the identity
on objects and sends
$\phi \in \Hom^R_\cl{C}(x,y) \to [\phi] \in \Hom_{\pi(\cl{C})}(x,y)$.

This description of the "underlying" category of an infinity-category is
satisfyingly explicit.
