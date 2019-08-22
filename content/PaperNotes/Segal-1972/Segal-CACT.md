Segal - Categories and Cohomology theories
==========================================

This is [@SegCatCoh]. The paper is about certain structured spaces - not
quite topological monoids, but *homotopy coherent monoids*. The main
idea is that i $\cl{C}$ is a category with sums (or products, dually),
$B\cl{C}$ acqquires, not quite a the structure of a topological monoid,
but of a homotopy coherent monoid (which Segal studies in an ad hoc
fashion). From a modern point of view, we can recognize this as a study
of a certain type of homotopy coherent structure. We can also recognize
more concretely the use of forgetful functors that are trivial
fibrations - for instance, the functor from diagrams of this type:

![](c6dfae8746933deefda97166d729cab1eeea633c.svg)

Which present $XY$ as the sum of $XY$, to just $\cl{C} \times \cl{C}$,
which in classifying space becomes a trivial fibration, as encoding the
right notion of "uniqueness" for products.

$\Gamma$ -spaces
----------------

Here Segal essentially gives an ad hoc description of what, in the
language of [@LuHiAlg], we would call a (cartesian) $E_\infty$-monoid in
spaces. Actually it's slightly different (we don't have the language of
"$\infty$-functors"), but it's almost certainly equivalent.

A $\Gamma$-space is a functor $A: \Gamma^{op} \to Top$ so that
$A(\ang{0})$ is contractible, and the function
$A(\ang{n}) \to A(\ang{1}) \times A(\ang{1}) \cdots \times A(\ang{1})$
induced by the maps $\rho_i: \ang{1} \to \ang{1}$ sending everything but
$i$ to the basepoint, is a homotopy equivalence.

$\Gamma$ is the opposite of the category of finite pointed sets,
although Segal describes it slightly differently. The notation above is
that used by Lurie in [@LuHiAlg].

We may abuse language and write $A(i)$ for $A(\ang{i})$

As in [@LuHiAlg], a $\Gamma$-space acquires multiplication maps
$A(\ang{1})^n \simeq A(\ang{n}) \to A(\ang{1})$ given by the maps
$\ang{n} \to \ang{1}$ sending everything but $\ast$ to $1$ - these don't
quite describe a commutative monoid of spaces, but this structure is
stricter than a commutative monoid in $\cl{H}$.

There's a functor $\Delta \to \Gamma$ given by $[m] \mapsto \ang{m}$,
and $f: [m] \to [n] \mapsto f^*: \ang{n} \to \ang{m}$, with $f^*(i)$
being the unique number (if one exists) so that
$f(f^*(i)-1) < i \leq f(f^*(i))$ (and the basepoint otherwise).

By precomposition with this functor, a $\Gamma$-space can be regarded as
a simplicial space with extra structure. In particular, we can take the
geometric realization of a $\Gamma$-space.

If $A: \Gamma\op \to Top$ is a $\Gamma$-space, $BA: \Gamma\op \to Top$
is the $\Gamma$-space given by
$BA(\ang{n}) = |\ang{m} \mapsto A(\ang{n \cdot m})|$. Of course, we need
to describe the action on morphisms of the latter $\Gamma$-space, and
prove that $B(A)$ satisfies the assumptions of a $\Gamma$-space. The
first thing can be done by describing
$\ang{n},\ang{m} \mapsto \ang{n\cdot m}$ as a functor
$\Gamma \times \Gamma \to \Gamma$ (or equivalently on $\Gamma\op$.)

If $A$ is a $\Gamma$-space (or even a simplicial space), recall that the
geometric realization $|A|$ is defined as
$\coprod_{i = 0} A(i) \times \Delta^i$, quotiented by a certain
relation. The $1$-skeleton can be defined as the subspace given by the
quotient of $A(1) \times \Delta^1 \coprod A(0) \times \Delta^0$. This is
$I \times A(1) / \sim$, where $\sim$ identifies all points of the form
$(1,a)$ or $(0,a)$. (Here we are silently identifying along the homotopy
equivalence $A(0) \simeq \ast$). Segal claims this is the unreduced
suspension, but it seems like it just receives a (quotient) map,
identifying the endpoints. In any case, the composition
$SA(1) \to S_1|A| \hookrightarrow |A| = BA(1)$ equips the sequence
$A(1), BA(1), B^2A(1), \dots$ with the structure of a spectrum.

Categories with composition laws
--------------------------------

A $\Gamma$-category is a functor $\cl{C}: \Gamma\op \to Cat$ so that
$\cl{C}(0)$ is equivalent to the category with one object and one
morphism, and the functor
$\cl{C}(n) \to \cl{C}(1) \times \cdots \times \cl{C}(1)$ is an
equivalence for each $n$.

Clearly, if $\cl{C}$ is a $\Gamma$-category,
$\ang{n} \mapsto |\cl{C}(n)|$ is a $\Gamma$-space.

The main source of examples is the one hinted at in the beginning: if
$\cl{C}$ is a category with sums, we can in a natural way form a
$\Gamma$-category, also called $\cl{C}$, so that the objects of
$\cl{C}(1)$ are the objects of $\cl{C}$, and the natural functor
$$\cl{C}(1) \times \cl{C}(1) \simeq \cl{C}(2) \to \cl{C}(1)$$ is given
by (a choice of) $(A,B) \mapsto A+B$.

If $S$ is a finite set, let $\cl{P}(S)$ be the category corresponding to
the poset $\cl{P}(S)$ ordered by inclusion. If $\cl{C}$ is a category
with (finite) sums, let $\cl{C}(\ang{n})$ be the category whose objects
are functors $\cl{P}(\ang{n}) \to \cl{C}$ taking disjoint union diagrams
to sum diagrams, and whose morphisms are *isomorphisms* of functors. A
map $\ang{n} \to \ang{m}$ induces a functor
$\cl{P}(\ang{m}) \to \cl{P}(\ang{n})$ (inverse image), which induces a
functor $\cl{C}(\ang{n}) \to \cl{C}(\ang{m})$ (precomposition). The
functors $\cl{C}(n) \to \cl{C}(1)^n$ are equivalences essentially by
uniqueness of products (here it is essential that maps are
isomorphisms). Clearly $\cl{C}(1)$ is the "groupoid skeleton" of
$\cl{C}$.
