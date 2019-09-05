---
title: Generalized Petri Nets
date: 2019-09-04
---

[@Master19]

::: Definition :::

Let $Q$ be a Lavwere teory. A $Q$-net is a pair of maps

$T \xrightrightarrows M_QP$ in $\Set$, where $M_Q$ denotes the free $Q$-model functor, and we think of $T$ and $S$ as the sets of *transitions* and *places*

The two maps are called *source* and *target*.

A map of $Q$-nets is a map $T \to T'$, $S \to S'$, rendering the obvious diagrams commutative.
:::

We recover usual petri nets by putting $Q = \mathbf{CMON}$. If we instead do monoids, we get "pre-net", i.e nets with an ordering of the inputs and outputs.
If we instead do semi-lattices, we get nets where each input/output can appear at most once (maybe nets with at most one token in each place).
If we do abelian groups, we get nets where input/outputs can be negative, nets where token counts are allowed to be negative.

This last example seems like it's "symmetric" in some way - like inputs should just be negative outputs.

The main output of the paper is an adjunction between $Q$-nets and models of $Q$ in categories.
This semantics is a little bit problematic, since it applies to e.g. *strict* commutative monoidal categories, which leaves something wanting.

It's worth investigating the difference between "models of $Q$ in $\Cat$" and "categories in models of $Q$",
or maybe "categories in the Kleisli category of $Q$".
It seems plausible that we can upgrade the adjunction between quivers and categories to an adjunction between quivers in $Mod_Q$ and categories in $Mod_Q$ - and a net is just a quiver in $Mod_Q$ where the objects are free (so a quiver in the Kleisli category of $Q$).

Note that the Eilenberg-Moore category of a monad on set *always* has limits, so we can talk about category objects in it. It may not be so easy for the Kleisli category.

::: Proposition :::

For $Q$ a lavwere theory, $\cC$ an category with finite limits, there is an equivalence

$\Cat(\Mod(Q,\cC)) \simeq \Mod(Q,(\Cat(\cC))$
:::

We can identify both categories with the full subcategory of $\Fun(\Delta^{op}\times Q \to \Set)$ consisting of functors $F$ such that

- $F(-, t)$ is a Segal set, i.e the nerve of a category, for each $t \in Q$.
- $F([n],-)$ is a model, i.e preserves products, for each $[n] \in \Delta$.

::: Proposition :::
Consider the functor $\bullet \xrightrightarrow \bullet \into \Delta^{op}$ which sends the two arrows to the two arrows $[1] \to [0]$ (which are dual, notice).

For any $\cC$ with finite limits, this functor induces $U: \Cat(\cC) \to Quiv(\cC)$ in the obvious way.
If $\cC$ also has countable coproducts, this functor has a left adjoint, which we call the *free category* functor.

:::
In general this can be deduced from the special adjoint functor theorem, (if $\cC$ is nice enough).
In particular, we can form the category $C(Q)$ by setting

- $C(Q)_0 = Q_0$
- $C(Q)_1 = Q_0 \sqcup Q_1 \sqcup Q_1 \times_{Q_0} Q_1 \sqcup \dots $
- Composition given by "concatenating paths".

Why is this left adjoint? Consider $\Hom_{Quiv(\cC)}(Q, U(D))$
This consists of maps $Q_0 \to D_0, Q_1 \to D_1$, such that source and targets match.
Now consider $\Hom_\Cat(\cC)(C(Q),D)$.
A functor here is given by a map $C(Q)_0 = Q_0 \to D_0$, and a map $Q_0 \sqcup \dots \to D_1$, such that a whole bunch of conditions hold.
Note that the latter map can be decomposed into maps
- $Q_0 \to D_1$
- $Q_1 \to D_1$
- $Q_1 \times_{Q_0} Q_1 \to D_1$
- etc
However, the functoriality conditions require precisely that the first map is given by $Q_0 \to D_0 \labelto{Id} D_1$, the second map can be anything that makes source and target match, the second map must be given by sending $f,g$ to the composite of whatever you sent them to in the previous step, and so on.
It follows that the entire map is uniquely determined by the maps $Q_0 \to D_0, Q_1 \to D_1$.
Hence we have the desired natural bijection, making it an adjunction.

Alternative proof: We know the adjunction works for sets (this is essentially what we just proved),
and hence we can do $\Cat(\cC) \cong \Cat \tensor \cC \xleftrightharpoons Quiv \tensor \cC \cong Quiv(\cC)$.
But this probably also requires $\cC$ to be very nice.

Whatever the means, we will have this adjunction for categories $\Mod(Q,Set)$.

There is a question about whether we can find an adjunction $Quiv(Klei_Q) \xleftrightharpoons Quiv(\Mod(Q,Set))$.
This is essentially the question about whether the inclusion $Klei_Q \into \Mod(Q,Set)$ admits a right adjoint - since quiver categories are just functor categories.
This is not true, since any algebra is a coequalizer of free algebras, meaning the inclusion is not cocontinuous.

$Quiv(Klei_Q) \xleftrightharpoons \Cat(\Mod(Q,Set))$.

But this doesn't seem right, at least not using our method above - clearly a category in $\Mod(Q,Set)$ is allowed to have non-free algebras of arrows and objects.
In fact, how *do* we get a quiver?

There seems to be considerable time spent on this in the paper - it seems to be the real point.

## Todo

Add flashcards about $Q$-nets, Lavwere theories.