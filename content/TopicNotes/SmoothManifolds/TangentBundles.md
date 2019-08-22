Tangent Bundles
---------------

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
