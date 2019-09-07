---
title: Regular and Relational Categories
date: 2019-09-04
---

[@FongSpivakRRCat]

::: Definition :::
Let $\cR$ be a *regular category*, and $A,B \in \cR$ objects.
Then a span $A \from X \to B$is *jointly monic*,
if the map $X \to A \times B$ is a monomorphism.

A *map of spans* is just a commutative diagram. A *relation* is an equivalence class of jointly monic spans.
Given two relations, we can compose them by taking the pullback, then the image inside $A \times C$.

Then we can define a category $Rel(\cR)$ in the following way:

- The objects are objects of $\cR$.
- A morphism is a relation.

This category can be enriched over posets, by saying $R \leq R'$ if there is a map of spans $R \to R'$.

$Rel(\cR)$ also receives a symmetric monoidal structure from the product in $\cR$.
This is compatible with the poset enrichment.
:::

A "regular category" is essentially a category where this construction makes sense.

One reason to be interested in these things is that the "primitive" wiring diagrams in hypergraph categories are sort of the dual thing: the monoidal structure is coproduct, and a morphism $X \to Y$
is given by a "hypergraph" or really, "corelation" on $X \sqcup Y$, which is to say a jointly *epic* *co*span.

These *also* have a natural ordering, which we choose to be by specification (i.e $* \from * \to * \leq * \from \emptyset \to *$ - a more connective diagram is smaller).

Note that relations supply "wiring", which is the posetal version of frobenius monoids -d
there are canonical relations $X \times X \to X, X \to X \times X$, and so on.

(This is not really part of the paper)
::: Remark :::
To interpret a wiring diagram in relations, we imagine each wire and each relation as imposing a certain correspondence between its inputs.
A wire says "what's on both sides must be equal"
A relation says.. something else.
Then given some values on the boundary of the diagram, they are related if there exists a consistent interal configuration.

This is also essentially what was going on when talking about reaction networks - there exists some steady state with these values at the interface.
:::
