---
title: Compactly generated categories
---
Let $\cl{C}$ be an . Then $\cl{C}$ is called *compactly generated* if
$\cl{C}$ is presentable and generated under filtered colimits by
$\cl{C}^\omega$.

Let $\cl{C}$ be an arbitrary . Then the following are equivalent:

1.  $\cl{C}$ is compactly generated.

2.  There exists a small cartesian $\cl{T}$ so that
    $\Fun^{cart}(T,\cl{S}) \simeq \cl{C}$.

3.  The yoneda embedding followed by restriction gives an equivalence
    $\cl{C} \labelto{\sim} \Fun^{cart}((\cl{C}^\omega)\op, \cl{S})$.

The of , $\Cat_\infty$, is compactly generated.

For this proof only, we will distinguish carefully between ordinary
colimits and homotopy colimits (i.e. the colimits in an ).

Recall that $\Cat_\infty$ is the underlying of $\catname{sSet}^+$ with
the *Cartesian* model structure. We proceed in two steps:

1.  Any is a filtered homotopy colimit of equivalent to a finite marked
    simplicial set.

2.  These are compact objects.

Clearly these two steps suffice. First, let $\cl{C} = (K, I)$ be a
fibrant object, i.e $K$ is a quasicategory and $I$ is the collection of
isomorphisms. Then we can find a sequence $K_0 \into K_1 \dots$ of
finite simplicial sets so that $K = \colim (K_0 \into K_1 \dots)$. Now,
if we let $I_i$ be those edges of $K_i$ which become isomorphisms in the
homotopy category (which makes sense for any simplicial set), then we
claim that $\colim (K_0,I_0) \into (K_1,I_1) \dots  = (K,I)$ (Note that
the inclusion $K_i \into K_{i+1}$ certain preserves isomorphisms). This
is true because, if $f \in K$ is an isomorphism, there must be some
stage $n$ where both $f$, its inverse, and the two $2$-cells marking
them as inverses have all appeared, and then $f \in I_n$.

However, since this is a cotower of cofibrations (and $(K_0,I_0)$ is
cofibrant), the strict colimit actually computes the homotopy colimit.
This finishes step 1.

Now let $\cl{C}$ be an which is equivalent (in $\catname{sSet}^+$) to a
finite (marked) simplicial set.

Suppose $i \mapsto D(i)$ is a filtered diagram of . We may suppose it is
represented by a projectively cofibrant diagram in $\catname{sSet}^+$,
so that the homotopy colimit can be computed as a strict limit. Now the
statement that $\cl{C}$ is compact is that the map
$$\hocolim_{i \in I} \Map_{\Cat_\infty}(\cl{C},D(i)) \to \Map_{\Cat_\infty}(\cl{C},\colim_{i\in I} D(i))$$
is a homotopy equivalence (note in particular that we have both homotopy
and strict colimits). By using the Whitehead theorem and rearranging
some things, we see that it suffices to prove that the map
$$\colim_{i\in I}\pi_0 \Map_{\Cat_\infty}(S^k \times \cl{C}, D(i)) \to \pi_0 \Map_{\Cat_\infty}(S^k \times \cl{C}, \colim_{i \in I} D(i))$$
Note that $S^k \times \cl{C}$ is again (equivalent to) a finite marked
simplicial set, which we will call $(K,I)$.

Now $\pi_0 \Map_{\Cat_\infty}(\cl{A},\cl{B})$ is just
$\Hom_{\catname{sSet}^+}(\cl{A},\cl{B}) / \sim$, where $\sim$ is
homotopy. In particular, any map (functor) out of $S^k \times \cl{C}$ is
represented by one out of $(K,I)$. Now the surjectivity follows by a
standard argument (used to prove the strict version of this statement).
The injectivity follows from this by considering instead
$\Delta^1 \times S^k \times \cl{C}$ (which is also finite).

This is actually stronger than just the statement that finite simplicial
sets are compact quasicategories, since e.g. the walking isomorphism is
not a finite simplicial set.

The functor
$\Cat_\infty \to \Fun^{cart}((\Cat_\infty^\omega)\op, \cl{S})$ is an
equivalence of .

In other words, an `\icat `{=latex}is determined by its functor spaces
from "essentially small" `\icats`{=latex}, and in order for such an
assembly of functor spaces to come from an actual `\icat`{=latex}, it
suffices that they preserve limits (i.e map colimits to limits).

We denote by $\Cat_\infty(\omega)$ the subcategory of $\Cat_\infty$
spanned by those which have all finite colimits, and those functors
which preserve finite colimits. Then $\Cat_\infty(\omega)$ is compactly
generated.

This notation is inspired by Lurie's $\Cat_\infty(\cl{K})$-notation.

This implies that the same is true for the category of with finite
*limits* and finite limit-preserving functors, since these two
categories are equivalent via the $(-)\op$ functor.

The inclusion $\Cat_\infty(\omega) \into \Cat_\infty$ admits a left
adjoint. Moreover, it preserves filtered colimits (it is
*$\omega$-continuous*, in Lurie's terminology).

The existence of the adjoint follows from [@LuHiTop 6.3.5.2].

Now let $C: F \to \Cat_\infty(\omega)$ be a filtered diagram. Then the
composite diagram $A \to \Cat_\infty$ surely admits a colimt, call it
$\cl{C}$. We must show first that the colimit diagram
$A^\rtri \to \Cat_\infty$ lies in $\Cat_\infty(\omega)$ (i.e that
$\cl{C}$ has all finite colimits, and the canonical functors
$C(\alpha) \to \cl{C}$ preserve them).

To see this, let $d: I \to \cl{C}$ be a finite diagram. By the above,
$I$ is categorically equivalent to a compact , so that $\Fun(I,-)$
preserves filtered colimits in $\Cat_\infty$. Hence the diagram $d$
comes from a diagram $\bar{d}: I \to C(\alpha)$, for some
$\alpha \in A$. Moreover, since each of the maps
$C(\alpha) \to C(\beta)$ preserves finite colimits, the colimit of
$\bar{d}$ in $C(\alpha)$ has the right universal property with respect
to any object in $\cl{C}$, hence is actually a colimit. An analogous
argument shows that each of the inclusions $C(\alpha) \to \cl{C}$
preserves finite colimits.

Now let $\cl{D}$ be another with finite colimits. We must show that
$$\Map_{\Cat_\infty(\omega)}(\cl{C},\cl{D}) \to \Map_{\Fun(A,\Cat_\infty(\omega))}(C, \delta(\cl{D}))$$
is an equivalence. We already know that $\cl{C}$ is a colimit in
$\Cat_\infty$, so that the analgous map

$$\Map_{\Cat_\infty}(\cl{C},\cl{D}) \to \Map_{\Fun(A,\Cat_\infty)}(C, \delta(\cl{D}))$$
is an equivalence. On the left-hand side, we have the connected
component of those maps (functors) which preserve finite colimits. On
the right-hand side, we have the connected components of those natural
transformations where each component map preserves finite colimits. It
hence suffices to prove that a functor $\cl{C} \to \cl{D}$ preserves
finite colimits if and only if each induced functor
$C(\alpha) \to \cl{D}$ preserves finite colimits. But this follows from
the above observation that any finite colimit in $\cl{C}$ can be
calculated in one of the $C(\alpha)$.

$\Cat_\infty(\omega)$ is known to be presentable \[HA reference\]. Let
$A$ be the full subcategory of $\Cat_\infty(\omega)$ generated by
colimits under $\Cat_\infty(\omega)^\omega$ It suffices to prove
$A = \Cat_\infty(\omega)$. Denote by $L$ the adjoint
$\Cat_\infty \to \Cat_\infty(\omega)$. For clarity, we denote the
inclusion by $i$. Note that it carries compact objects to compact
objects by \[HTT ref\]. In particular, since $\Cat_\infty$ is compactly
generated, all $L\cl{C}$ are in $A$.

Consider the coequalizer (in $\Cat_\infty(\omega)$ of the two morphisms
$$Li(Li\cl{C} \times_\cl{C} Li\cl{C}) \overset{\to}{\to} Li\cl{C}$$ Call
it $\cl{D}$. Concretely, a finitely cocontinuous functor
$\cl{D} \to \cl{E}$ consists of

-   A finitely cocontinuous functor $Li\cl{C} \to \cl{E}$ - in other
    words, a functor (without conditions) $\cl{C} \to \cl{E}$.

-   A functor $Li\cl{C} \times_\cl{C} Li(\cl{C}) \to \cl{E}$.

-   A natural isomorphism between each of the composite functors
    $$Li\cl{C} \times_\cl{C} Li(\cl{C}) \to Li\cl{C} \to \cl{E}$$ and
    the given one.

It's clear that one can build a functor $\cl{D} \to \cl{C}$, simply by
putting the tautological thing everywhere. On the other hand, the
functor $\cl{C} \to \cl{D}$ coming from the identity map clearly
preserves colimits (the other data witnesses this), and it is not hard
to check that these are inverses, using the fact that composition with a
functor $\cl{E} \to \cl{F}$ is given on the data above by composing all
the functors into $\cl{E}$ with this thing.

By the above, there is an equivalence
$\Cat_\infty^{fc} \simeq \Fun^{fc}(\Cat_\infty^{fc,\omega,op},\cl{S})$.
The latter category is stable under products and filtered colimits
inside $\Fun$, hence stable under ultraproducts, which may therefore be
computed pointwise. We note that the "free pullback" category, which
receives a map from the "free square" category, is compact, because it
is equivalent to the "free lower-right corner" category. Hence the
subspace of pullbacks inside squares is stable under ultraproduct.

---
title: SUPERFLUOUS - Approach to the theorem by some ideas of Shulman
---
We say a map $X \to Y$ in a general $\cl{C}$ is a monomorphism if
$$\Map(A,X) \to \Map(A,Y)$$ is a equivalent to the inclusion of a subset
of the connected components in $\Map(A,Y)$.

Let $\cl{C}$ be a presentable $\infty$-category, and let
$\cl{K} = \{K_\alpha\}_{\alpha \in A}$ be a (small) set of objects in
it. Suppose $\cl{K}$ detects isomorphisms, i.e a map $A \to B$ is an
isomorphism if and only if each of the maps
$\Map(K_\alpha, A) \to \Map(K_\alpha, B)$ is a homotopy equivalence.
Then $K_\alpha$ generates $\cl{C}$ under colimits.

This is due to Mike Shulman in the classical case. The proof is
essentially unchanged.

For each $X \in \cl{C}$, we let
$$RX = \coprod_{K_\alpha \to X}K_\alpha$$ where the coproduct is indexed
by the set of maps $K_\alpha \to X$, for all $K_\alpha$. Then there is
an obvious canonical map $\epsilon_X : RX \to X$. Note that $RX$ is
functorial in $X$.

$\epsilon_X$ is an *extremal epimorphism*, meaning that for any
factorization

if $\alpha$ is a monomorphism, it is in fact an isomorphism.

To see this, choose a $K_\alpha$. By assumption,
$$\Map(K_\alpha, A) \to \Map(K_\alpha, X)$$ is the inclusion of certain
connected components. To see it is surjective, choose a map
$$K_\alpha \to X$$ This gives a tautological commutative diagram:

And the composite of the left and top arrows provides a lift of our map
into $A$.

Since $K_\alpha$ detects isomorphisms by assumption, this finishes the
proof.

Now we will construct, for each $X$, a factorization $RX \to Z \to X$,
with $Z$ generated from $K_\alpha$ by colimits and the latter map a
monomorphism. To do this, we simply take the geometric realization of
the Cech nerve of $RX \to X$, which is a map $RX \to Z_0$, and which
$\epsilon_X$ factors over, to obtain $RX \to Z_0 \to X$. We iterate this
construction transfinitely (taking next the realization of the nerve of
$Z_0 \to X$), and we claim that it must eventually terminate. However,
when it terminates, the map $Z_\alpha \to X$ must be a monomorphism,
hence an isomorphism. Moreover, each of the $Z_\alpha$ so constructed
can be obtained as colimits of the previous ones.

We have three facts to prove:

(a) A map is a monomorphism if and only if it is the geometric
    realization of its Cech nerve.

(b) The geometric realization of the Cech nerve of $Z_\alpha \to X$ may
    be computed by a colimit of $K_\alpha$s.

(c) The sequence $Z_0 \to Z_1 \dots \to Z_\alpha \to \dots$ must
    stabilize at a certain point.

To see (b), consider the Cech nerve
$$\cdots \to Z_\alpha \times_X Z_\alpha \times_X Z_\alpha \overset{\to}{\underset{\to}{\to}} Z_\alpha \times Z_\alpha \overset{\to}{\to} Z_\alpha$$
Now, it may happen that
