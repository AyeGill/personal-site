---
title: Hedges - Morphisms of Open Games
date: 2019-09-02
tags: open games, double category, category theory
---

About [@Hedges17]

## Globular morphisms


::: Definition :::
Given open games $\cG, \cH: (X,S) \to (Y,R)$ a *globular morphism* $\cG \to \cH$ consists of a map $f: \Sigma_\cG \to \Sigma_\cH$ commuting with all the structure of the game.
For the best-response relation, this means that, if $\sigma,\sigma' \in B_\cG(c,k)$, then $f(\sigma),f(\sigma') \in B_\cH(c,k)$.
:::

This gives the category of open games a $2$-structure, which has the correct notion of isomorphism for composition to be well-defined.

## Lenses

::: Definition ::: 

A *diset* is a pair of sets $(X,S)$. We think of the first set as *covariant* and the second as *contravariant*.
A lens $\lambda: (X,S) \to (Y,R)$ consists of

- A map $v_\lambda : X \to Y$ (*get*)
- A map $u_\lambda : X \times R \to S$ (*set*).

Lenses define a category $Lens$, with disets as objects, lenses as morphisms, and composition defined in the only way that makes sense.
:::

::: Definition :::

We define functors $\bV: Lens \to \Set$, given by $\bV(X,S) = X$, $\bV(\lambda) = v_\lambda$,
and $\bK: Lens^{op} \to \Set$ given by $\bK(X,S) = X \to S$, and $\bK(\lambda)(k)(x) = u_\lambda(x,k(v_\lambda(x)))$.

:::

Verifying functoriality is routine.

We think of $\bV$ as *states* or *points*, and *\bK* as *continuations*.

::: Proposition :::

There are natural isomorphisms $\bV \simeq \Hom(I,-)$, and $\bK \simeq \Hom(-,I)$, where $I = (*,*)$.
(these do exactly what you expect).

:::

Note that $Lens$ is symmetric monoidal, with $I$ the unit and "product" as the tensor product.

::: Definition :::

The bifunctor $\bC: Lens \times Lens^{op} \to \Set$ is defined by $\bC(\Phi,\Psi) = \bV(\Phi) \times \bK(\Psi)$.

:::

We call elements of $\cC$ *contexts*.
We identify $bV$ and $\bK$ with the corresponding representable functors, and write the maps $\bV(\lambda): \bV(\Phi) \to \bV(\Psi)$, etc, as composition.

We can define open games in terms of lenses:

::: Definition :::

Given disets $\Phi,\Psi$, an open game $\cG: \Phi \to \Psi$ consists of

- A strategy set $\Sigma_\cG$.
- A map $\Sigma_\cG \to Lens(\Phi,\Psi)$ (i.e, for every strategy, a given lens).
- A map $B_\cG: \bC(\Phi,\Psi) \to Rel(\Sigma_\cG)$, the *best response relation*.

:::

## Contravariant lens morphisms

::: Definition :::

Given open games $\cG: \Phi \to \Psi$ and $\cH: \Phi' \to \Psi'$, a *contravariant lens morphism* $\alpha: \cG \to \cH$ consists of the following data:

- Lenses $s_\alpha: \Phi' \to \Phi$ and $t_\alpha: \Psi' \to \Phi$
- A function $\Sigma_\alpha: \Sigma_\cG \to \Sigma_\cH$.

Satisfying the following conditions:

- For all $\sigma \in \Sigma_\cG$, the following diagram of lenses commutes.

```tikzcd
\Phi \ar[r, "\cG(\sigma)"] & \Psi\\
\Phi' \ar[u, "s_\alpha"] \ar[r, "\cH(\Sigma_\alpha(\sigma))"] & \Psi' \ar[u, "t_\alpha"]
```

- For all $(h,k) \in \bC(\Phi',\Psi)$ and all $\sigma,\sigma' \in \Sigma(\cG)$, if
    - $(\sigma,\sigma') \in B_\cG(s_\alpha \circ h, k)$, then 
    - $(\Sigma_\alpha(\sigma), \Sigma_\alpha(\sigma')) \in B_\cH(h, k \circ t_\alpha)$.

We call a pair $(h,k) \in \bC(\Phi',\Psi)$ a *context for $\alpha$*.
:::