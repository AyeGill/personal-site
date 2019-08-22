Basic Definitions
-----------------

A (topological) $n$-manifold is a space $X$ with the following
properties:

-   $X$ is Hausdorff

-   $X$ is second-countable (i.e. there exists a countable basis for the
    topology on $X$)

-   For each point $x\in X$, there's an open neighborhood $U \ni x$, an
    open ball $B \subset \R^n$, and a homeomorphism
    $U \xrightarrow{\sim} B$

A space satisfying the third condition is said to be *locally euclidian
of dimension $n$*

A chart (or coordinate chart) of an $n$-manifold $X$ is a pair
$(U,\phi)$, where $U \subset X$ is an open subset and
$\phi: U \to \tilde{U}$ is a homeomorphism to an open subset of $\R^n$.

If $\tilde{U}$ is a ball, the chart is called a coordinate ball.

If $U$ contains $p \in X$, we also say the chart contains $p \in X$.

If $U \subset \R^n, V \subset R^m$ are open, a map $f: U \to V$ is
called smooth at $p \in U$ if each coordinate functions has all partial
derivatives of all orders at $p$. It is smooth if it's smooth at all
$p \in U$.

If a smooth map has a smooth inverse, it is called a diffeomorphism.

Given an $n$-manifold $X$ and two charts $(U,\phi), (V,\psi)$, with the
property that $U \cap V \neq \emptyset$, define the *transition map*
$\psi\circ\phi\inv : \phi(U \cap V) \to \psi(U \cap V)$.

This is automatically a homemorphism. If it's also a diffeomorphism, or
if $U \cap V = \emptyset$, the charts are said to be *smoothly
compatible*

An *atlas* for a manifold $X$ is a collection of charts which covers
$X$. An atlas is said to be smooth if any two charts in it are smoothly
compatible.

It suffices to check that each transition map is smooth - the inverse to
the transition map of $\phi$ and $\psi$ will be given by the transition
map of $\psi$ and $\phi$.

A smooth atlas $A$ is *maximal* if it is not contained in a larger
smooth atlas, i.e. if any chart which is smoothly compatible with each
chart in $A$ is also in $A$.

A smooth structure on an $n$-manifold $X$ is a maximal smooth atlas on
$X$. A smooth manifold is a pair $(X,A)$, where $X$ is a manifold and
$A$ is a smooth structure on $X$.

Relaxing the requirement of smooth compatibility (e.g. requiring only
that the maps be $C^k$), we obtain various relaxations of the theory of
smooth manifolds. We can also strengthen it, requiring e.g. that the
maps are analytic, to obtain stronger theories.

If a chart is compatible with all charts in an atlas, we say it is
compatible with the atlas.

Let $X$ be a smooth manifold. Any smooth atlas $A$ is contained in a
unique maximal smooth atlas $\bar{A}$. Furthermore, $\bar{A} = \bar{B}$
if and only if $A \cup B$ is smooth.

Define $\bar{A}$ to be the collection of charts smoothly compatible with
all charts in $A$. It is clear that $A \subset \bar{A}$, since it is
itself smooth. We claim $\bar{A}$ is both smooth and maximal. To see
$\bar{A}$ smooth, let $(U, \phi), (V, \psi)$ be two charts in $\bar{A}$.
It is sufficient to show
$\phi\circ\psi\inv : \psi(U \cap V) \to \phi(U \cap V)$ smooth. Take an
arbitrary point $x = \phi(p) \in \psi(U \cap V)$. Then we can find an
atlas $(W, \theta) \in A$ with $x \in W$. Now $p \in W \cap U \cap V$,
so we can write
$\phi \psi\inv = \phi\theta\inv\theta\psi\inv : \psi(W \cap u \cap V) \to \phi(W \cap U \cap V)$.
By compatibility this is smooth, and since smoothness can be checked
locally and $p$ was arbitary, $\phi\psi\inv$ is smooth on all of
$U \cap V$. Hence $\bar{A}$ is smooth. If a chart is compatible with
$\bar{A}$, it's in particular compatible with $A$, so it's contained in
$\bar{A}$. So $\bar{A}$ is maximal. If $\hat{A} \supset A$ is smooth,
all charts in it are compatible with $A$, so $\hat{A} \subset \bar{A}$.
So if $\hat{A}$ is maximal, it equals $\bar{A}$.

If $\bar{A} = \bar{B}$, anything compatible with everything in $A$ is
compatible with everything in $B$. In particular, since $A$ is smooth,
all charts in $A$ are compatible with $B$. And vice versa, this implies
$A \cup B$ smooth. If $A \cup B$ smooth, we have
$A \subset \bar{A \cup B}$, so $\bar{A} = \bar{A \cup B}$ by uniqueness.
Since this holds for $B$ also, the result follows.

If $(X,A)$ is a smooth manifold, and $U \subset X$ is an open set,
define $A_U = \{(V,\phi) \in A | V \subset U\}$. Then $(U, A_U)$ is a
smooth manifold. In this situation we call it a submanifold (or smooth
submanifold) of $X$.

$GL(n,\R) \subset \R^{n^2}$ is an open subset, hence a smooth
$n^2$-manifold

An $n$-dimensional *manifold with boundary* is a second countable
Hausdorff space $X$ where each point has a neighborhood homeomorphic to
an open subset of the upper half-space
$\mathbb{H}^n = \{(x^1, \dots, x^n) \in \R^n \mid x^n \geq 0\}$.

An open subset of $X$ equipped with a homeomorphism to an open subset of
$\mathbb{H}^n$ is called a generalized chart.

Say a map $\phi: U \to \R^n$, for $U$ a general subset of $\R^m$, is
smooth if it admits a smooth extension to an open neighborhood of $U$.
Define an atlas, smooth compatibility, smooth atlas, and maximal smooth
atlas for a manifold with boundary in the same way as before, using
generalized charts and this notion of smoothness.

Given a smooth manifold $(X,A)$, a function $X \to \R^n$ is called
*smooth* if for each chart $(U, \phi) \in A$, the composition
$f\phi\inv: \phi(U) \to \R^n$ is a smooth function.

Given two smooth manifolds $(X,A), (Y,B)$, a map $f: X \to Y$ is smooth
if for any chart $(U,\phi) \in A, (V,\psi) \in B$, the function
$\psi f\phi\inv : \phi(U\cap f\inv (V)) \to \R^m$ is smooth.

This generalizes the previous definition.

It suffices to check smoothness on some (pair of) (not necessarily
maximal) smooth atlas(es).

It suffices to check smoothness at some neighborhood of each point.

The set of smooth functions on $M$ is denoted $C^\infty(M)$. It has a
natural $\R$-algebra structure.

The identities are smooth for any atlas, and compositions of smooth maps
are again smooth, so that smooth manifolds assemble into a category
$C^\infty Man$.

An isomorphism in this category is called a diffeomorphism.

The category of smooth manifolds admits a finite products, where
$(M, A) \times (N,B)$ is $(M \times N, A \times B)$, defining
$A\times B$ in the natural way.

Because a manifold has the same dimension everywhere, and $C^\infty Man$
contains smooth manifolds of all dimensions, there is no coproduct of
smooth manifolds.

A smooth map $p: \tilde{M} \to M$ is said to be a *smooth covering map*
if, for each $p \in M$, we can find a neighborhood $U \ni p$ and a
diffeomorphism $\phi: U \times F \xrightarrow{\sim} p\inv(U)$ for some
discrete set $F$ (endowing $U \times F$ with the evident smooth
structure), with the property that $p\phi$ equals the projection
$U \times F \to U$.

This is equivalent to the condition that, on each component of
$p\inv(U)$, $p$ is a diffeomorphism to $U$.

Being a smooth covering map is, prima facie, a stronger condition than
merely being smooth and a covering map (in the topological sense)

If $p: \tilde{M} \to M$ is a smooth covering map, a map $M \to X$ is
smooth if and only if the composition with $p$ is smooth.

If $\tilde{M} \to M$ is a topological covering map from a space
$\tilde{M}$ to a smooth manifold $M$, there is a unique smooth structure
on $\tilde{M}$ making this map a smooth covering map.
