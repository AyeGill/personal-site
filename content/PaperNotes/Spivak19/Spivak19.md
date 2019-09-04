---
title: Generalized Lens Categories via functors $\cC^{op} \to \Cat$
date: 2019-09-02
tags: category theory, lenses
---

## Classical (Cartesian) lenses

::: Definition :::
Let $\cC$ be a category with products.
The *category of lenses in $\cC$* is a category $Lens_{\cC,\times}$ with

- Objects pairs $(c,x) \in \cC \times \cC$.
- Morphisms $(c,x) \to (c',x')$ given by pairs $(f: c \to c', f^\sharp: c \times x' \to x)$.

:::

Composition is defined as for normal lenses in $\Set$, in the only way that makes sense.

::: Example :::

- A *simple lens* is a lens $(c,c) \to (d,d)$.
- If $\cC$ has finite coproducts, its dual has finite products. The category $Lens_{\cC^{op},+}^{op}$ is then called the category of *prisms* in $\cC$.
    - The category of prisms in $\Fin_{/T}$ for a set $T$ is precisely the category of wiring diagrams from [@SSV16].
- A discrete dynamical system $A \to B$ with state set $S$ is a lens $(S,S) \to (A,B)$.
:::

## Generaller lenses

We generalize this to lenses in a symmetric monoidal category:

::: Definition :::

Let $\cC, \tensor, I$ be a symmetric monoidal category.
Let $Comon_\cC$ denote the category of comonoids in $\cC$.

Then the *category of $\cC$-lenses*, still denoted $Lens_{\cC,\tensor}$, is a category with

- Objects pairs $(c,x)$, where $c \in Comon_\cC, x \in \cC$
- Morphisms $(c,x) \to (c',x')$ pairs of maps $f\in Comon_\cC(c,c'), f^\sharp \in \cC(c \tensor x', x)$

:::

Since a comonoid in a Cartesian monoidal category is equivalent to just an object, this generalizes the previous definition.

## Generallest lenses

Given a functor $\cC^{op} \to \Cat$, the category of $F$-lenses is simply the opposite of the (contravariant) Grothendieck construction of $F$.
This is just buzzwords, so let's get into it:

::: Definition :::

Let $\cC$ be a category, and $F: \cC \to \Cat$ be a functor.
Then the (covariant) *Grothendieck construction* of $F$ consists of a category over $\cC$,
$\pi_F: Gr(F) \to \cC$, where

- $ob(Gr(F)) = \coprod_{c \in ob(\cC)} ob(F(\cC))$
- $Gr(F)((c,x),(c',x')) = \coprod_{f\in \cC(c,c')} \Hom_{F(c')}(F(f)(x),x')$.

:::

We can also define a *contravariant* version of this construction, for functors $F: \cC^{op} \to \Cat$. (See the paper). Let us write this $Gr^o$.

::: Proposition :::
Let $F: \cC^{op} \to \Cat$ be a functor, and let $F^p : \cC^{op} \to \Cat$ denote its pointwise opposite.
Then $Gr(F)^{op} \cong Gr^o(F^p)$, and both are equivalent to the category with the same objects, and morphisms

$\Hom((c,x),(c',x')) := \coprod_{f\in \cC(c,c')} \Hom_{F(c)}(F(f)(x'),x)$

Moreover, these isomorphisms are over $\cC$.
:::

::: Definition :::

Let $F: \cC^{op} \to \Cat$ be a functor. The *category of $F$-lenses* is the category of the proposition.
It is denoted $Lens_F$.

:::

::: Example :::

Taking the functor $Sub: Mfd \to \Cat$ which sends a manifold to the category of submersions over it,
we recover open dynamical systems as lenses of the form

$(M, TM \to M) \to (B, A \times B \to B)$.

:::

## Todo

### Flashcards

- Definitions of the various types of lens.
- The Grothendieck construction.
- How to recover notions of lens from the Grothendieck construction.
- Monoidal Grothendieck construction.