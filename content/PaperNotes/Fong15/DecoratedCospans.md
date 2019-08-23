---
title: Decorated Cospans
---
Writing about [@Fong15].

We encounter the decorated cospans from [@BP17] (see above).

If $\cC$ is a category, a *cospan* in $\cC$ is a diagram

A map of cospans $(X \to P \from Y) \to (X \to P' \from Y)$ is a map
$P \to P'$ making the two obvious triangles commute (note the feet have
to agree). Given two cospans, we can form their composite by taking a
pushout, if it exists. This is well-defined up to equivalence of
cospans, and gives a category $\Cospan(\cC)$ with the objects of $\cC$
and equivalence classes of cospans as morphisms.

Suppose now $\cC$ has finite colimits, and
$F: (\cC,+) \to (\cD, \tensor)$ is a lax symmetric monoidal functor to
some braided monoidal category $\cD$. Then a *$F$-decorated cospan*
consists of a cospand $X \to P \from Y$ in $\cC$, and a morphism
$1 \to F(P)$ in $\cD$ (the *decoration*).

A map of decorated cospans is a map of the underlying cospans which
preserves the decoration, in the natural sense.

To compose decorated cospans
$(X \to P \from Y, 1 \labelto{\alpha} F(P))$ and
$(Y \to P' \from Z, 1 \labelto{\beta} F(P'))$, we first form the usual
composite cospan $X \to P +_Y P' \from Z$. To get a decoration on
$P +_Y P'$, we use the composite
$$1 \labelto{\sim} 1 \tensor 1 \labelto{\alpha \tensor \beta} F(P) \tensor F(P') \labelto{\phi_{P,P'}} F(P + P') \labelto{F([j_P,j_{P'}])}$$
Here $\phi$ is the "laxative" for $F$ and $[j_P,j_{P'}]$ is the
canonical map from the coproduct to the pushout.

This is well-defined up to equivalence of decorated cospans, and defines
a category $F\Cospan$

Note that the functoriality of $F$, applied to the map
$P+P' \to P +_Y P'$, captures exactly the idea of "gluing the shared
bits".

For $\cD = \cC$, we get usual undecorated cospans (since
$1 = \emptyset$). Moreover, for any choice of $\cD$, given a cospand
$X \to P \from Y$, there is a canonical "empty decoration", given by
$$I \to F(\emptyset) \to F(P)$$ where the first map is the laxative and
the second is the obvious thing.

$F\Cospan$ is a symmetric monoidal category, and each object carries the
structure of a special commutative Frobenius monoid (a *hypergraph
category*). The same is true for $\Cospan$, and the "empty decoration"
construction above is a hypergraph functor
$\Cospan(\cC) \into F\Cospan$. The monoidal product in both cases is
given by $+$ on objects.

Let us describe the comultiplication $X \to X + X$. In fact by necessity
the comultiplication, and all the other Frobenius operations, in
$F\Cospan$ are undecorated (since they must come from $\Cospan(\cC)$).
Hence it is given just by a cospan - it is the natural cospan
$X \to X \from X + X$. The other operations are defined similarly.

Functors between decorated cospan categories
--------------------------------------------

Let $\cC, \cC'$ be categories with finite colimits, and $\cD, \cD'$ be
braided monoidal categories. Let $F: \cC \to \cD, G: \cC' \to \cD'$ be
lax monoidal functors, so that we have monoidal categories
$F\Cospan, G\Cospan$. Suppose further we have a finit colimit preserving
functor $A:\cC \to \cC'$, a lax monoidal functor $B: \cD \to \cD'$, and
a monoidal natural transformation $\theta : BF \to AG$, i.e

Then there is an induced hypergraph functor $F\Cospan \to G\Cospan$,
sending $X$ to $AX$, and a cospan
$$X \to P \from Y, 1_\cD \to F(P) \mapsto AX \to AP \from AY, 1_{\cD'} \to B(1_\cD) \to B(FP) \labelto{\theta} G(AN)$$
