---
title: Dynamical Systems and Sheaves
date: 2019-08-27
---

On [@SSV16].

## Wiring diagrams and operads.

Here is a figure from the paper:

![Wiring diagram](/images/SSV16-wiringdiag.png)

We can imagine labelling the boxes with the names of certain systems.
This diagram then tells us how to connect the inputs of one system with the output of another, and which outputs/inputs should be outputs of the entire system.

We can imagine interpreting this diagram, for instance, in a monoidal category (since the wires do not cross: there is an ordering on the inputs which is not violated), subject to the requirement that certain objects be dualizable (since certain arrows are reversed).

The perspective of the paper is somewhat different: we can interpret this diagram as an operation in a certain *operad of wiring diagrams*.
We can compose these operations by pasting wiring diagrams inside each other.
The *colors* of this operad are the various possible input/output signatures of a box.
If we augment the operad by labeling each arrow with an object of $\cC$, a monoidal, fully dualizable category gives rise to an algebra, where the color corresponding to input $X_1, \dots X_n$ and output $Y_1, \dots Y_m$ is sent to the set of functions $X_1 \tensor \cdots \tensor X_m \to Y_1 \tensor \cdots \tensor Y_m$, and the wiring diagrams act in exactly the expected way.[^1]

[^1]: This perspective is also developed in [@FS18HypergraphCats], for *hypergraph categories*

Note that "wiring diagram algebras" are almost categories, since the wiring diagram with two boxes in sequence gives a composition.
However, the models considered in the paper lack identities - the reason for this is that there is no identity open dynamical system.
Hence the extra generality of the wiring diagram approach seems to be really necessary.

::: Definition :::

Given a category $\cC$, we let $\mathbf{TFS}_\cC$ denote the category of *$\cC$-typed finite sets*, i.e finite sets equipped with a map to $\mathrm{ob} \cC$.
(note that this does not involve the category structure of $\cC$)

Note that this category has finite coproducts. Moreover, any functor $\cC \to \cD$ induces a functor
$\mathbf{TFS}_\cC \to \mathbf{TFS}_\cD$ by composing with the action of the functor on objects.
Equipping $\mathbf{TFS}_\cC$ with the coCartesian monoidal structure, we construct a functor
$\mathbf{TFS}_{(-)}: \mathbf{Cat} \to \mathbf{SMC}$, from the category of categories to the category of symmetric monoidal categories and strong symmetric monoidal functors.

Suppose $\cC$ has finite products. Given $(X,\tau) \in \mathbf{TFS}_\cC$, we can form the product
$\prod_{x\in X} \tau(x) =: \hat{X}$.

This construction gives a functor $\hat{(-)}: \mathbf{TFS}_\cC \to \cC$.
:::

In fact, more is true: if we let $\mathbf{FPCat}$ denote the category of categories with finite products and functors that preserve them, we obtain a "pseudonatural transformation":

```tikzcd
& \mathbf{Cat} \ar[rd, bend left=30] & \\
\mathbf{FPCat} \ar[rr, draw=none, bend left=60, ""{name=U,above}] \ar[rr, bend right=60, ""{name=D, below}], \ar[ru, bend left=30]& & \mathbf{SMC}\ar[from=U, to=D, "\hat{(-)}", shorten <=10pt,shorten >=10pt, Rightarrow]
```

By "pseudonatural transformation", we mean that the functors we are looking at are 2-functors between 2-categories. It seems to me that they are not automatically strict - the functor $\mathbf{FPCat} \to \mathbf{SMC}$ seems to rely on a choice of products, which smells like the sort of thing that makes things non-strict.
But my thinking on this area is imprecise.
