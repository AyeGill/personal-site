---
title: Categorical Logic and higher generalizations {#Proj:Proj02}
---
Overview
--------

In [@BSS], Barthel-Schlank-Stapleton develop a notion of *ultraproducts*
for arbitrary `\icats `{=latex}with products and filtered colimits, and
exhibit certain equivalences of ultraproducts of `\icats `{=latex}which
are important in chromatic homotopy theory.

One motivation for why this is interesting, is the ultraproduct theorem
of Łoś:

Let $\Sigma$ be a signature (in the sense of model theory), and
$(A_i)_{i\in I}$ a collection of nonempty $\Sigma$-models for some
(infinite) index set $I$. Let $\cl{F}$ be an ultrafilter on $I$. Then
the ultraproduct $\prod_i^\cl{F} A_i$ admits a canonical
$\Sigma$-structure, and, for any first-order formula in the language of
$\Sigma$, $\phi(x_1, \dots x_n)$, a tuple
$x_1, \dots x_n \in \prod_i^\cl{F} A_i$ satisfies $\phi$ if and only if
the collection of $i \in I$ so that $x_1^{(i)}, \dots x_n^{(i)} \in A_i$
satisfies $\phi$ is in the filter $\cl{F}$.

The set of tuples so that $x_1^{(i)}, \dots x_n^{(i)} \in A_i$ satisfies
$\phi$ almost everywhere can again be identified with the ultraproduct
of the subsets $X_i \subset A_i$ satisfying $\phi$. This could also be
phrased as the statement "ultraproducts commute with taking defineable
sets".

In the setting of categorical logic, this statement can be derived from
the following:

Let $\cl{F}$ be an ultrafilter, and consider the functor
$\catname{Set}^I \to \catname{Set}$ of ultraproduct with respect to
$\cl{F}$. This functor is a *pretopos morphism*, i.e it preserves
initial and terminal objects, pullbacks, disjoint sums, and quotients by
internal equivalence relations.

In fact, this version of the statement admits a generalization to
$\infty$-categories:

Let $\cl{F}$ be an ultrafilter, and consider the functor
$\cl{S}^I \to \cl{S}$ of ultraproduct with respect to $\cl{F}$. This
functor is a *pretopos morphism*, i.e it preserves finite limits, finite
coproducts and effective epimorphisms.

However, it is not obvious how to generalize the machinery of
categorical logic to this setting in such a way as to make this theorem
useful. For instance, we may wish to make a statement of this form:

Suppose $\cl{C}_i$ is a collection of $\infty$-categories, $\cl{F}$ an
ultrafilter on $I$, and $\prod^\cl{F}_i \cl{C}_i$ their ultraproduct.
Then let $f_i : S \to \cl{C}_i$ be a collection of diagrams, where
$S = \Delta^1 \times \Delta^1$. These represent a class
$[(f_i)] \in \prod^\cl{F}_i \cl{C}_i$. Then $[(f_i)]$ is a pullback
diagram if and only if $\{i \mid \text{$f_i$ a pullback diagram}\}$ is
in $\cl{F}$.

But (following how this works in traditional categorical logic) this
would require us to identify

1.  Some pretopos $\cl{P}$ so that pretopos morphisms
    $\cl{P} \to \cl{S}$ can be identified with `\icats`{=latex}.

2.  Some morphism $C \to S$ in $\cl{P}$ so that, for each
    `\icat `{=latex}$F: \cl{C} \to \cl{S}$, $F(C) \to F(S)$ is the
    inclusion of "the space of pullback diagrams" in "the space of
    square diagrams".

It is not clear how to build such a theory - indeed, if
$\Fun^{\mathrm{pretopos}}(\cl{P},\cl{S}) \simeq \Cat_\infty$, then it is
not hard to see that step 2 is impossible. Building such a theory is one
of the goals of this project.

### Problems / to do / remarks

To begin with

1.  Figure out if $\Cat_\infty^{lex}$ is compactly generated. \[Seems
    this is true\]

2.  Remark: In fact, this is not even necessary in order to prove that
    pullbacks are stable under isomorphisms, since it's not at all
    difficult to show that the walking pullback and the walking square
    are compact.

3.  Remark: There is a certain analogy between reconstructing the
    "syntactic category" of a finite limit theory precisely as those
    functors that preserve limits and filtered colimits (which is
    precisely those corepresented by compact objects), and
    reconstructing the syntactic category of a first-order theory as the
    functors preserving ultraproducts.

Later:

1.  Figure out how to add (finite) limits without requiring that they
    exist (just to the morphisms).

2.  Figure out how to extract these categories from a syntactical
    description (and work with them at that level).

3.  Booleanization?

References: Joyal-Tierney, BSS, Rezk (a model for the homotopy theory
of\...)
