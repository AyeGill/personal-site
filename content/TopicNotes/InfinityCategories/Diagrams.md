---
title: Diagrams
---
If $\cl{C}$ is some topological category, which we think of as a higher
category (for example the category of CW-complexes, representing
$\cl{H}$), and $I$ is some (ordinary) index category, the correct notion
of $I$-indexed diagram is not generally a functor $I \to \cl{C}$ - after
all, these are just ordinary commutative diagrams. It's also not quite
functors $I \to h\cl{C}$ - we should require that the diagram commute
not just up to homotopy, but up to *coherent homotopy*. A chief
advantage of $\infty$-categories as a device for higher category theory
is that a functor is just a map of simplicial sets - the definition of
the map on higher simplices supplies the coherence data.

If $\cl{C, D}$ are simplicial sets, we let $\Fun(\cl{C, D})$ be the
simplicial set $\Map_{sSet}(\cl{C, D})$ parameterizing simplicial maps
$\cl{C \to D}$. Of course, this makes sense for any $\cl{C,D}$, but we
use it only when $\cl{D}$ is an $\infty$-category. $\cl{C}$ will often
be an $\infty$-category, but not always.

-   A vertex in $\Fun(\cl{C,D})$ - i.e. a simplicial map $\cl{C \to D}$
    is called a *functor* or a *diagram*, mirroring usual usage.

-   A morphism in $\Fun(\cl{C,D})$ is called a *natural transformation*
    of functors.

-   An equivalence in $\Fun(\cl{C,D})$ is called a *natural
    equivalence*.

Let $K$ be a simplicial set

(1) $\Fun(K,\cl{c})$ is an $\infty$-category for any $\infty$-category
    $\cl{C}$.

(2) If $\cl{C\to D}$ is a categorical equivalence of
    $\infty$-categories, then $\Fun(K,\cl{C}) \to \Fun(K, \cl{D})$ is a
    categorical equivalence.

(3) If ${K'\to K}$ is a categorical equivalence of simplicial sets, then
    $\Fun(K,\cl{C}) \to \Fun(K', \cl{C})$ is a categorical equivalence.

Since any simplicial set $K$ is categorically equivalent to an
$\infty$-category, $\Fun(K, \cl{C})$ can always be replaced by
$\Fun(\cl{K,C})$ for $\cl{K}$ an infinity-category. The point is that
this is not actually necessary - one can similarly define functor
categories between ordinary categories without actually requiring that
the domain is a category (although this is not nearly as natural).

A functor $f: \cl{C \to D}$ between $\infty$-categories is a categorical
equivalence if and only if there exists a functor $g: \cl{D \to C}$ and
natural equivalences $1_\cl{C} \to gf$, $fg \to 1_\cl{D}$.

See [@RezkQuasi], where this is used as the definition of categorical
equivalence.

If $S, S'$ are simplicial sets, define their *join*, $S \star S'$, in
the following way:
$$(S \star S')_n = S_n \sqcup S_{n'} \sqcup \coprod_{i+j=n-1} S_i \times S_j$$

Geometrically, we imagine placing $S$ and $S'$ next to each other,
inserting a single edge from each vertex in $S$ to each vertex in $S'$,
and filling in higher-dimensional data in a similar way.

There's an isomorphism
$\phi_{ij}:\Delta^{i-1} \ast \Delta^{j-1} \to \Delta^{i+j-1}$ for all
$i,j\geq 0$ (declaring $\Delta^{-1} = \emptyset$).

Fixing $T$ a simplicial set, we may regard $- \star T$ and $T \star -$
as functors $sSet \to sSet_{T/}$ - this means that there's a natural map
$T \to T \star S$ (and the other one), which respects the functoriality
of $\star$. Regarded in this way, both these functors preserve colimits.

[\[prop:joins-are-quasi\]]{#prop:joins-are-quasi
label="prop:joins-are-quasi"} If $S, S'$ are $\infty$-categories, so is
$S \star S'$.

There's a natural map
$X \star Y \to \Delta^0 \star \Delta^0 = \Delta^1$. So given
$f: K \to X \star Y$, we can construct three maps:

-   $g: K \to \Delta^1$ by composition

-   $f_0 : g\inv({0}) \to X$, since the preimage of ${0}$ in $X \star Y$
    is precisely $X$.

-   $f_1 : g\inv({1}) \to Y$

This assignment is a bijection between the sets $sSet(K,X\star Y)$ and
the set of triples of this form.

Let $h: \Lambda^n_i \to S \star S'$ be an inner horn. Let
$(g, f_0, g_1)$ be the associated triple. To build a map
$\Delta^n \to S \star S'$, we have to build a new triple
$(g': \Delta^n \to \Delta^1, f_0', f_1')$. Since $\Delta^1$ is a
quasicategory, defining $g'$ is easy. It's not hard to see that
$g\inv({0}) \subset \Lambda^n_i$ coincides with
$g'^{0}) \subset \Delta^n$, except in the case where it's the entire
set. In the first case, $f'_0 = f_0$. In the latter case, use
quasicategoricity of $S$ to define $f'_0$. Define $f'_1$ similarly.

Let $K$ be a simplicial set. The *left cone* $K^\triangleleft$ is
defined as $\Delta^0 \star K$. The *right cone* $K^\triangleright$ is
defined as $K \star \Delta^0$. The left cone has an extra "initial
object", whereas the right cone has an extra "terminal object".

In ordinary category theory, we can define the overcategory $C_{/p}$,
given $p: I \to C$, by the universal property that:
$$\Hom_{Cat}(Y, C_{/p}) = \Hom_p(Y \star I, C)$$ where the subscript $p$
means we consider only those functors restricting to $p$ on $I$. This
condition generalizes in a natural way to $\infty$-categories, given our
definition of joins.

Let $S, K$ be simplicial sets and $p:K \to S$ a map. Then there exists a
simplicial set $S_{/p}$ with the following property:
$$\Hom_{sSet}(Y, S_{/p}) = \Hom_p(Y \star K, S),$$ for all $Y$, where
the subscript indicates that we consider only maps restricting to $p$ on
$K$. If $S$ is an $\infty$-category, so is $S_{/p}$. If $q: S \to S'$ is
a categorical equivalence of $\infty$-categories, so is the induced map
$S_{/p} \to S'_{/qp}$.

We can define undercategories dually

If $p: \Delta^n \to S$ classifies an $n$-simplex $\sigma \in S$, we
often write $S_{/\sigma}$ for $S_{/p}$. Particularly for the case of
objects.

If $C$ is a category and $X \in C$, we have $N(C_{/X}) = N(C)_{/X}$, so
overcategories of $\infty$-categories generalize the ordinary
overcategories in the expected way.

-   Define a category, $QCat$ as the full subcategory of $sSet$ spanned
    by the quasicategories.

-   Define a simplicial category $QCat_\Delta$ (or $Cat_\infty^\Delta$)
    as the natural simplicial enrichment of $QCat$.

-   Define a category $hQCat$ with objects quasicategories and morphisms
    *natural equivalence classes* of functors.

-   Define a quasicategory $QCat_\infty$ (or just $Cat_\infty$) as the
    homotopy coherent nerve of $QCat_\Delta$

-   Define a *strict 2-category* $h_2QCat$ with objects the
    quasicategories, morphisms functors, and $2$-cells isomorphism
    classes of natural transformations between functors (i.e
    $h_2QCat(C,D) = hFun(C,D)$).

Note that $hQcat = QCat[W^{-1}]$, with $W$ the class of categorical
equivalences.
