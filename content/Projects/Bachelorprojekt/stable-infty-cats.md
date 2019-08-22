Stable $\infty$-categories
==========================

An object in an $\infty$-category is called a $0$-object if it's both
initial and final. An $\infty$-category with a $0$-object is called a
pointed $\infty$-category.

If $\cl{C}$ is a pointed $\infty$-category with zero object $0$, a
triangle in $\cl{C}$ is a map $\Delta^1 \times \Delta^1 \to \cl{C}$ like

(In other words, one where $(0,1) \mapsto 0$).

A triangle is called a cofiber sequence, or a cofiber of $f$, if it's a
pushout square, and a fiber sequence, or a fiber of $g$, if it's a
pullback square.

An $\infty$-category is said to be *stable* if it satisfies the
following:

-   There exists a zero object $0 \in \cl{C}$

-   Every morphism admits both a fiber and a cofiber.

-   A triangle in $\cl{C}$ is a fiber sequence if and only if it's a
    cofiber sequence.

This definition is self-dual, so that $\cl{C}\op$ is stable iff $\cl{C}$
is.

An $\infty$-category is called preadditive if it is pointed, admits
finite products and coproducts, and the canonical morphism
$A + B \to A \times B$ is an isomorphism for each $A,B$.

A preadditive $\infty$-category is *additive* if, in addition, the
"shear map" $$s: A+A \to A \times A$$ given by projection
$pr_1: A \times A \to A$ on the first coordinate and the fold map
$\nabla: A + A \to A$ on the second, is an equivalence.

The definition of preadditive $\infty$-category applies to ordinary
categories in an obvious way, giving rise to a notion of preadditive
category. Then it's a fact that an $\infty$-category $\cl{C}$ is
preadditive if and only if $Ho(\cl{C})$ is preadditive, and additive if
and only if $Ho(\cl{C})$ is also additive (in the usual sense).

If $\cl{C}$ is a pointed $\infty$-category which admits cofibers, we let
the suspension of $X \in \cl{C}$, $\Sigma X$, be the pushout

Define the loop $\Omega X$ dually if $\cl{C}$ admits fibers. Note that
these can be constructed functorially.

If $\cl{C}$ is stable, we get both a loop and a suspension functor, and
they can be constructed so that they are inverses (details in higher
algebra page 23-24, just before 1.1.2.6).

Any stable $\infty$-category is additive.

By definition it is pointed. It will suffice to show that $Ho(\cl{C})$
is additive, and to see this it will suffice to show that it's enriched
over abelian groups and admits coproducts. The enrichment is constructed
by noting that $\Hom(\Sigma X,Y) = \Omega \Hom(X,Y)$, where the latter
loop is the usual loop functor in spaces. This means that
$[\Sigma^2 X,Y] = \pi_0 \Hom(\Sigma^2 X,Y) = \pi_2 \Hom(X,Y)$, which has
a canonical abelian group structure. Since $\Sigma$ admits an inverse in
this case, every space is a double suspension, which gives such
structure to all hom-sets in $Ho(\cl{C})$.

To construct the coproduct of $X,Y$, let
$cofib : Fun(\Delta^1, \cl{C}) \to \cl{C}$ be the functor which takes
each morphim to its cofiber. We see that
$X \simeq cofib(\Omega X \to 0)$, and $Y \simeq cofib(0 \to Y)$. By some
abstract nonsense from $HTT$, we get that $\Omega X \overset{0}{\to} Y$
is the coproduct of these two morphisms. By more abstract nonsense,
cofib preserves coproducts, so that the cofiber of this map is a
coproduct of $X$ and $Y$.

The first bit of abstract nonsense is the following corollary of HTT
5.1.2.2 (which is slightly stronger than the one noted in the book,
5.1.2.3):

Suppose $\cl{C}$ is an $\infty$-category, $K$ and $S$ are simplicial
sets. Suppose $p: K \to Fun(S,\cl{C})$ is a diagram, and suppose that
for each $s \in S$, the induced diagram $K \to \cl{C}$ has a colimit in
$\cl{C}$. Then $p$ has an extension to $K \star \ast$ which restricts to
a colimit diagram on each $s \in S$, and extension of $p$ are colimit
diagrams iff they have this property.

We also need the fact that the coproduct of $0$ and anything exists and
is that thing. This can be seen by considering this diagram:

![](35774b1193f3bd30ceeeee2f4a4c45775ff9456c.svg)

This is clearly a pullback diagram. By definition, the right map is a
trivial fibration, hence so is the left. Hence the diagram $x \to x$,
which is a colimit for $x$, gives rise to a diagram
$x \to x \leftarrow 0$ which must also be initial, i.e. a colimit
diagram.

This could also have been done using the discussion in HTT 4.4.1.

The second bit is just that $cofib$ is left adjoint, hence preserves
colimits.
