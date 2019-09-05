---
title: Basic Definition
---
A *topological category* is a category enriched over $\cl{CG}$, the
category of compactly generated Hausdorff spaces

The condition that mapping spaces be compactly generated Hausdorff
should be regarded merely as a technically convenient assumption.

A *simplicial category* is a category enriched over $sSet = Set_\Delta$,
the category of simplicial sets.

We will regard each of the mapping sets as representing a homotopy type.
For this reason we are mainly interested in *fibrant* simplicial
categories, i.e. ones with Kan complex mapping sets.

An $\infty$-category is a simplicial set $C$ with the following
extension property: for each diagram of the following type:

There is a dashed arrow as shown making the diagram commute if
$0 < i < n$ (if $\Lambda^n_i$ is an *inner horn*)

Given a topological category $\cl{C}$, we define an ordinary category
$h\cl{C}$ in the following way:

-   The objects of $h\cl{C}$ are the objects of $\cl{C}$

-   $\Hom_{ho\cl{C}}(A,B) = \pi_0(Hom_\cl{C}(A,B))$

The composition is defined in the natural way from the functoriality of
$\pi_0$ - the identities are obtained by taking the path component of
the identitity.

Recall from classical homotopy theory that any space has the weak
homotopy type of a CW-complex, and that this *CW-approximation* can be
carried out in a functorial manner, presenting a functor
$\theta : \cl{CG \to H}$, where $\cl{H}$ is the usual *(weak) homotopy
category of spaces*.

Given a topological category, we define a $\cl{H}$-enriched category,
also called $h\cl{C}$, in the following way:

-   The objects of $h\cl{C}$ are the objects of $\cl{C}$

-   $\Hom_{h\cl{C}}(A,B) = [\Hom_{\cl{C}}(A,B)]$

Where composition is defined using functoriality of $\theta$ and that it
preserves products.

These two definitions of $h\cl{C}$ are compatible with one another, in
that the underlying (ordinary) category of the latter is the former.

We say that a functor $F: \cl{C \to D}$ of topological categories is a
*weak equivalence* if the induced functor $h\cl{C} \to h\cl{D}$ is an
equivalence of $\cl{H}$-enriched categories.

Concretely, this means that the two following conditions hold:

-   The map $\Hom_\cl{C}(A,B) \to \Hom_\cl{D}(FA, FB)$ is a weak
    equivalence for each pair $A,B$

-   For each $D \in \cl{D}$, there exists $C \in \cl{C}$ with
    $FC \simeq D$ in $h\cl{D}$.

Looking at those conditions, it's not obvious that each equivalence has
an actual inverse - does a weak equivalence always have a "weak inverse"
(for spaces, say)?

Since $|-|$ and $Sing$ preserve finite products, they induce functors
between simplicial categories and topological categories. Explicitly:

-   Given a simplicial category $\cl{C}$, define $|\cl{C}|$ to have the
    same objects and $\Hom_{|\cl{C}|}(A,B) = |\Hom_\cl{C}(A,B)|$

-   Given a topological category $\cl{D}$, define $Sing \cl{D}$ to have
    the same objects and
    $\Hom_{Sing \cl{D}}(A,B) = Sing(Hom_\cl{D}(A,B))$

Homotopy category, simplicial categories If $\cl{C}$ is a simplicial
category, we let $h\cl{C}$ be the $\cl{H}$-enriched category obtained by
applying $sSet \to \cl{H}$ to each mapping set.

The various meanings of $h\cl{C}$ are compatible with each other, since
$h|\cl{C}| = h\cl{C}$ and $h(Sing \cl{C}) = h\cl{C}$ (Or rather, there
exist canonical isomorphisms).

We say a functor $F: \cl{C \to D}$ of simplicial categories is an
*equivalence* (or weak equivalence) if the induced functor
$h\cl{C} \to h\cl{D}$ is an equivalence of $\cl{H}$-enriched categories.

The unit and counit of the adjunction between $|-|$ and $Sing$ induce
(enriched) functors $$|Sing \cl{C}| \to \cl{C}$$
$$\cl{D} \to Sing|\cl{D}|$$ For any toplogical category $\cl{C}$ or
simplicial category $\cl{D}$. These functors are equivalences of the
relevant type of category

This is an immediate consequence of the corresponding fact for $|-|$ and
$Sing$.

This proposition should be read as establishing an equivalence between
the two theories of simplicial and topological categories, from the
point of view of homotopy theory.
