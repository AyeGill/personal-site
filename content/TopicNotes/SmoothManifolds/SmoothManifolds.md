---
title: Smooth Manifolds
---
These notes are taken chiefly from [@LeeSmoMan]

## Basic definitions
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

## Tangent Bundles

If $p \in M$ is a point of a smooth manifold, a *derivation at $p$* is a
map $X: C^\infty(M) \to \R$ satisfying:

-   $X$ is $\R$-linear

-   $X(fg) = f(p)X(g) + g(p)X(f)$

For any $p \in M$, the set of derivations is a vector space with
pointwise operations. It is called $T_p(M)$, or the tangent space of $M$
at $p$

Given a smooth map $F: M \to N$ and a point $p \in M$, there is a
natural pushforward map $F_*:T_p(M) \to T_{Fp}(N)$ defined by
$$F_*(X)(f) = X(f \circ F)$$
$$F_*(X)(fg) = X((fg)\circ F) = X(fF \cdot gF) = fF(p)X(gF) + gF(p)X(fF) = f(F(p))F_*X(g) + g(F(p))F_*(f),$$
so that this is actually a derivation.

The pushforward map $F_*$ should be regarded as a sort of generalization
of the derivative of $F$. Locally, $F$ looks like a smooth map between
open balls in $\R^n$ and $\R^m$, and the pushforward looks like a map
$\R^n \to \R^m$ - the matrix classifying this map is the "total
derivative" of $F$ at $p$.

There's a map $p: \R^n \to T_p(\R^n)$ which sends $(v_i)_i$ to
$$f \mapsto \sum v_i\dfrac{\partial f}{\partial x_i}$$ This is an
isomorphism

The product rule implies that $p(v)$ is a derivation.
$p(v)((x_i)_i \mapsto x_j) = v_j$, so that $p$ is injective. On the
other hand, given a derivation $X$, putting
$v_j = X((x_i)_i \mapsto x_j)$, one can show that $p(v) = X$ by using
the first-order Taylor approximation of $f$

$(M,p) \mapsto T_p(M)$ and $F \mapsto F_*$ defines a functor from
pointed smooth manifolds to $\R$-vector spaces. In other words, $F_*$ is
linear, takes identities to identities, and $(GF)_* = G_*F_*$.

As a corollary, the pushforward of a diffeomorphism is an isomorphism.

The tangent space is *local*, in the sense that if $U \subset M$ is an
open submanifold and $i$ is the inclusion, the pushforward map
$i_*: T_p(U) \to T_p(M)$ is an isomorphism for all $p \in U$.

This follows from the following facts:

-   If $f$ and $g$ agree on a neighborhood of $p$, $X(f) = X(g)$ for any
    derivation at $p$. This can be seen using bump functions.

-   For any smooth function on $U$, we can find one on $M$ so that they
    agree on a neighborhood of $p$ (a direct consequence of the
    *extension lemma*).

-   $i_*$ is injective, since if $i_*(X)$ is zero on all functions on
    $M$, it's also zero on all functions on $U$.

-   $i_*$ is surjective, since we can define $Y' \in T_p(U)$ by
    evaluating $Y$ on extensions.

The existence of bumb functions (very analytical) means that many
properties of smooth manifolds can be studied purely algebraically.

Since any point $p \in M$ is contained in a chart like
$(U, \phi: U \xrightarrow{\sim} B(0,1)\subset \R^n)$, and since $\phi$
is a diffeomorphism in this case, it follows that $\R^n \to T_p(M)$
given by pulling back a function to $B(0,1)$ and taking partial
derivatives is an isomorphism. Of course, this isomorphism is not
canonical, but depends on the choice of chart.

If $\gamma : (a,b) \to M$ is a smooth map (a smooth curve), define the
tangent of $\gamma$ at $x \in (a,b)$ to be the pushforward of
$f \mapsto df/dt$ under $\gamma_*: T_x(a,b) \to T_{\gamma(x)}(M)$.

If $M = \R^n$, we recover the usual tangent of $\gamma$.

Every tangent vector is the tangent of some curve.

Let $X \in T_p(M)$. By locality and diffeomorphism-invariance, we reduce
to the case where $p = 0$ and $M = B(0,1) \subset \R^n$. Then $X$ has
the form $f \mapsto \sum v_i (\partial f / \partial x_i)(0)$ - this is
the tangent at $x = 0$ of $\gamma(t) = t(v_i)$

We could also have defined the tangent space as a quotient of the set of
all curves with $\gamma(0) = p$ - but this is more complicated, and the
vector space structure is not obvious from this definition.

A smooth function element of $M$ at $p$ is a pair $(f,U)$, where
$p \in U \subset M$, $U$ open and $f: U \to \R$ smooth. The set of
*germs at $p$*, $C^\infty_p$ is the set of smooth function elements at
$p$, modulo the relation that $(f, U) \sim (g,V)$ is there is some
neighborhood $p \in W \subset V\cap U$ where $f$ and $g$ agree.

We could also have defined $T_p(M)$ as the set of derivations on
$C^\infty_p$ (the $\R$-algebra structure descends). This is preferable
in some cases where the extension lemma is not available, such as
analytical manifolds.

The tangent bundle $TM$ of a smooth manifold is defined in the following
way:

-   As a set, it consists of pairs $(p,X)$, where $p \in M$ and
    $X \in T_p(M)$.

-   For each chart $(U, \phi)$ of $M$, define a chart on $TM$ as
    $(\pi\inv(U), (X,p) \mapsto (\phi(p), (\phi\inv)_*(X)))$

Where we think of the maps as going into $\R^{2n}$. They take a point
and a derivation at that point to the local coordinates of the point,
followed by the expression of the derivation as a vector in local
coordinates. We note that the transition maps are easily seen to be
smooth, that this satisfies the cocycle condition, and that the
resulting space is easily seen to be second-countable and Hausdorff. So
this data equips $TM$ with the structure of a smooth $2n$-manifold.
Furthermore $F_*: (p, X) \mapsto (F(p), F_*(X))$ is a smooth map
$TM \to TN$ if $F: M \to N$ is smooth, so this defines a functor
$C^\infty Man \to C^\infty Man$.

A smooth map $p: E \to M$ is a smooth fiber bundle with fiber $F$ if's a
(topological) fiber bundle, in such a way that the homemorphism
$p\inv(U) \to U \times F$ can be chosen to be a diffeomorphism ($F$
should have a specified smooth structure).

A smooth vector bundle of rank $n$ is a smooth fiber bundle with fiber
$\R^n$, where each $p\inv(U)$ can be equipped with a real vector space
structure, such that $\phi: p\inv(U) \to U \times \R^n$ is a linear
isomorphism at each $\phi\inv(\{u\} \times \R^n)$.

The canonical projection $TM \to M$ is a smooth vector bundle of rank
$n$.

Given a derivation $X$ at $(p_i)_i$ on $\prod_i M_i$, there is a natural
derivation $\alpha_i X$ of $M_i$ at $p_i$ given by the pushforward along
$\pi_i$. The composite of these is an isomorphism, so that
$(M,p) \mapsto T_p(M)$ preserves (finite) products. From this it follows
that $T(M \times N) \cong TM \times TN$, in the natural way.

## Vector Fields

A *vector field* of a smooth manifold $M$ is a section of the tangent
bundle. It is smooth if the section is smooth.

If $Y$ is a vector field we typically write $Y_p$ rather than $Y(p)$, so
that we can write $Y_p(f)$ rather than $Y(p)(f)$.

The set of smooth vector fields on $M$ is denoted $\cl{T}(M)$. It's an
$\R$-vector space in an obvious way. Moreover, it's actually a module
over $C^\infty(M)$ - merely put $(fY)_p = f(p)Y_p$.

If $F: M \to N$ is smooth, and $Y\in \cl{T}N, X \in \cl{T}M$, we say
that $Y$ and $X$ are $F$-related if $Y_{F(p)} = F_*(X_p)$. Note that
there is not necessarily any vector field on $N$ $F$-related to $X$, and
it may not be unique.

However, if $F$ is a diffeomorphism, this does define a $1$-to-$1$
correspodence between $\cl{T}M$ and $\cl{T}N$ (as we would expect).

## Cotangent Bundles, Covector fields

The *cotangent space* of $M$ at $p \in M$, $T^*_pM$ is the dual $T_pM^*$
of the tangent space at $p$.

If $F: M \to N$ is a smooth map, dualizing the pushforward map gives a
linear map, the pullback map: $F^* : T_{F(p)}^*N \to T_p^*M$. This is
functorial just like the pushforward map.

The *cotangent bundle* $T^*M$ of a space is a smooth manifold defined in
the following way: As a set, it consists of pairs $(p, \xi)$ with
$p\in M$ and $\xi \in T_pM$. Letting $\pi: T^*M \to M$ be the
projection, and $(U,\phi)$ a chart on $M$ we define a chart on $T^*M$ by
$$\Phi:\pi\inv(U) \to \R^{2n}:(p, \xi) \mapsto (\phi(p), (\phi\inv)^*\xi)$$
As in the case of the tangent bundle, these satisfy the requirements
that allow them to define a smooth structure on $T^*M$, which becomes a
smooth vector bundle over $M$.

Just as in the case of tangent bundles, the pushforward maps assemble
into a map $T^*N \to T^*M$

The above data defines a contravariant functor
$T^* : C^\infty Man \to Vec_\R$

A covector field a section of the cotangent bundle. A smooth covector
field is what it is.

The collection of all smooth covector fields on $M$ is denoted
$\cl{T}^*M$. It is a $C^\infty(M)$-module in the obvious way.

If $\sigma_p$ is a smooth covector field on $N$, and $F: M \to N$ is
smooth, we can define a covector field on $M$ by
$(F^*\sigma)_p(X_p) = \sigma_p(F_*(X_p))$. This data defines a
contravariant functor $C^\infty Man \to Vec_\R$

The pullback of a smooth vector field also preserves the multiplication
by smooth functions, but it's not clear what category the functor should
go into to reflect this.

If $f: M \to \R$ is a smooth function on $M$, and $X_p$ is a tangent
vector at a point $p$, we obtain the value $X_p(f)$. This defines a map
$p \mapsto (T_pM)^* = T_p^*M$, which can be combined with the identity
to build a section of the tangent bundle. This will be a smooth vector
field, which we call $df$.

The assignment $f \mapsto df$ satisfies the following properties:

(a) $d(af + bg) = a(df) + b(dg)$ for $f,g \in C^\infty(M), a,b \in \R$

(b) $d(fg) = f dg + g df$

(c) $d(f/g) = (g df + f dg)/g^2$ on the open submanifold where
    $g\neq 0$.

(d) If $f(M) \subset J$ for some interval $J$, and $h: J \to \R$ is
    smooth, $d(h \circ f) = (h'\circ f) df$

(e) If $f$ is constant, $df = 0$.

Properties a and b state that $d: C^\infty(M) \to \cl{T}^*M$ is a
differential.

## Tensors, Tensor Fields
An $n$-tensor on a vector space $V$ over a field $k$ is an $n$-linear
map $V^n \to k$.

There is a natural $k$-vector space of $n$-tensors on $V$, denoted
$T^nV$.

The map $V^* \otimes V^* \cdots \otimes V^* \to T^nV$ sending
$\alpha_1 \otimes \alpha_2 \cdots \otimes \alpha_n$ to
$(V_i) \mapsto \prod_i\alpha_iV_i$ is an isomorphism of vector spaces.

Taking the above as an identification, we can define a bilinear map
$T^k \times T^l \to T^{k+l}$, denoted
$\sigma, \tau \mapsto \sigma \tensor \tau$, by defining it on elements
of the form
$(\sigma_1 \tensor \dots \tensor \sigma_k, \tau_1 \dots \tensor \tau_l)$
as $(\sigma_1 \dots \sigma_k \tensor \tau_1 \dots \tensor \tau_l)$.

This classifies a map $T^k \tensor T^l \to T^{k+l}$, which under the
above identification is just the identity.

If $M$ is a smooth manifold of dimension $n$ define the bundle of
(covariant) $k$-tensors on $M$ as the bundle of pairs
$(p\in M, \eta \in T^kT_p(M))$. Give it a smooth structure as as vector
bundle of rank $n^k$ in the usual way by lifting local charts. Define
also the real vector space (and $C^\infty-algebra$) $\cl{T}^k(M)$ of
smooth sections of $T^k$. These are called smooth $k$-tensor fields.
Given $F: M \to N$ smooth, there is an obvious pullback map
$\cl{T}^k(N) \to \cl{T}^k(M)$. This defines a contravariant function
$C^\infty Man \to Vec_\R$.

If $\sigma$ and $\tau$ are smooth tensor fields, so is (pointwise)
$\sigma \tensor \tau$.

## Line Integrals

A curve segment in a smooth manifold is a map $\gamma: [a,b] \to M$. It
is a smooth curve segment if it admits a smooth extension to an open set
containing $[a,b]$. A piecewise smooth curve segment has the obvious
definition.

If $M$ is a connected smooth manifold, any two points can be joined by a
piecewise smooth curve segment.

If $\omega$ is a smooth covector field on $[a,b]$, it has the form
$f(t)dt$ for some smooth function $f(t)$. We then define
$\int_{[a,b]}\omega = \int_a^b f(t)dt$

If $\omega$ is a smooth covector field on $M$, and $\gamma: [a,b] \to M$
is a smooth curve segment, we define
$$\int_gamma \omega = \int_[a,b]\gamma^* \omega$$

Extend this definition to piecewise smooth curve segments in the natural
way.

Suppose $\gamma:[a,b] \to M$ is a piecewise smooth curve segment, and
$\omega, \omega_1, \omega_2 \in \cl{T}^*(M)$

(a) $\int_\gamma(c_1\omega_1 + c_2\omega_2) = c_1\int_\gamma \omega_1 + c_2 \int_\gamma \omega_2$

(b) If $\gamma$ is constant, $\int_\gamma \omega = 0$.

(c) If $a < c < b$, then
    $\int_{\gamma|_{[a,c]}}\omega + \int_{\gamma|_{[c,b]}} \omega = \int_\gamma\omega$

(d) $$\int_\gamma\omega = \int_a^b \omega_{\gamma(t)}(\gamma'(t))dt$$
    where the right-hand integral is a normal Riemann integral,
    $\omega_p$ is the covector at the point $p$, and $\gamma'(t)$ is the
    tangent of $\gamma$ at time $t$

The last equation would also serve as a definition of the line integral.

$\int_\gamma df = f(\gamma(b)) - f(\gamma(a))$

This is an immediate consequence of (d) above and the fundamental
theorem of calculus.
