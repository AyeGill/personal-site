Cotangent Bundles and Covector fields
-------------------------------------

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
