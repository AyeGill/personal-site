Complete Segal spaces
=====================

We let $I$ be the simplicial set $N(0 \labelto{\sim}1)$.

A *Segal Space* is a bisimplicial set $X : \Delta\op \to \catname{sSet}$
so that, for each $n$, the map
$$X[n] \to X[1] \times_{X[0]} \cdots \times_{X[0]} X[1]$$ induced by the
$n$'th spine inclusion is a homotopy equivalence. A *Segal space* is
*complete* if the map
$$X[0] \simeq [\Delta\op,\catname{sSet}](\ast, X) \to [\Delta\op,\catname{sSet}](I, X)$$
is an equivalence.

A bisimplicial set extends uniquely to a limit-preserving functor
$\catname{sSet}\op \to \catname{sSet}$ In this situation, the two
conditions above are that the spine inclusions and the map $I \to \ast$
are both inverted by $X$.

It should be noted somewhere that, when we include simplicial sets in
bisimplicial sets, it is always as a functor
$\Delta\op \to \catname{sSet}$ taking value in discrete sets, not as a
constant functor.

Consider the category $[\Delta\op,\catname{sSet}]$ in any of the three
standard model structures, i.e projective, injective and Reedy. The
*Model structure for complete Segal spaces* is the Bousfield
localization of this model structure at the collection of maps given by
the spine inclusions and $I \to \ast$.

The model structure for complete Segal spaces admits an
$\catname{sSet}_\mathrm{Quillen}$-enrichment, and given this, the
underlying is equivalent to $\Cat_\infty$

It will later be important to understand exactly how this equivalence
works.

Using the standard translation results between model categories and
$\infty$-categories, we obtain the following:

Consider the full subcategory of $\Fun(N(\Delta\op),\cl{S})$ spanned by
those functors $X$ so that the maps induced by the spine inclusions and
the map $I \to \ast$ are equivalences. This is equivalent to
$\Cat_\infty$.

Let $\catname{cSeg}^R$ be the category defined as follows: take the
formal completion of $\Delta\op$ under limits (as an ),
$\Fun(\Delta\op, \cl{S})\op$. Then, localize this category with respect
to the (duals of the) spine inclusions and $I \to \ast$. This category
is by definition $\catname{cSeg}^R$. By the (dual of) the theory of
Bousfield localizations for presentable , we have equivalences
$$\Fun^R(\catname{cSeg}^R, \cl{S}) \labelto{\sim} \Fun^R_{cSeg}(\Fun(\Delta\op, \cl{S})\op, \cl{S}) \labelto{\sim} \Fun_{cSeg}(\Delta\op, \cl{S}) \simeq \Cat_\infty$$
where the $cSeg$ subscript in both cases denotes the full subcategory
spanned by the functors satisfying the conditions of a complete Segal
space.

Let $\catname{cSeg}^{lex}$ be the subcategory of $\catname{cSeg}^R$
spanned by the finite limits of corepresentables (or rather, their
images in the localization). Then we would like
$$\Fun^{lex}(\catname{cSeg}^{lex},\cl{S}) \simeq \Fun^R(\catname{cSeg}^R,\cl{S}) \simeq \Cat_\infty$$

Alternative approach: define $\catname{cSeg}^{lex}$ in terms of its
universal property (maybe impossible, unclear what it means to invert
$I \to \ast$ in a category with only finite limits) (since this is all
we care about anyway). Makes it unclear how to add in terminal objects
and such.

The category $\catname{CSS} \subseteq \Fun(\Delta\op, \cl{S})$ is stable
under filtered colimits.

Let $D: I \to \Fun(\Delta\op, \cl{S})$ be a filtered diagram. It's clear
that $\colim D(i)$ satisfies the Segal condition, since colimits are
calculated limitwise and filtered colimits commute with finite limits in
$\cl{S}$ So let us consider the completeness. We have for each $i$ a map
$$s : D(i)_0 \labelto{\sim} D(i)_{hoeq} \into D(i)_1$$ It suffices to
verify that $(\colim D(i))_{hoeq}  = \colim (D(i)_{hoeq})$. Both can be
expressed as connected components of $\colim D(i)_1$, so it suffices to
check on this level. Note that $\pi_0$ commutes with connected
components.

$\colim \pi_0(D(i)_1)$ consists of the collection of all homtopy classes
of maps in some $D(i)$, quotient an equivalence relation.
$\colim \pi_0(D(i)_{hoeq})$ consists of those equivalence classes of
maps which contain a homotopy equivalence - in other words, those maps
which become homotopy equivalences on some level of the diagram. On the
other hand, suppose a map in $(\colim D(i))_1$ is a homotopy
equivalence. Then there must be some level where it and its inverse
become inverses - so it appears in $\colim \pi_0(D(i)_{hoeq})$. Hence
the two sets agree, finishing the proof.
