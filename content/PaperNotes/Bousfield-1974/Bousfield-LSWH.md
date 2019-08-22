Bousfield - Localization of spaces with respect to homology
===========================================================

This is [@BouLocSpc]. I originally wrote this in the journal on
2017-11-08, so it's duplicated there.

Localization via local objects
------------------------------

If $\cl{C}$ is a category, and $W$ a class of morphisms, an object
$x\in \cl{C}$ is $W$-local if each $\phi:a\to b \in W$ induces a
bijection $\cl{C}(b,x) \to \cl{C}(a,x)$

If $x \to \tilde{x}$ is a morphism in $W$ to a $W$-local object, we call
it a $W$-localization of $x$

-   If $\phi: x \to y$ is in $W$ and $x,y$ are $W$-local, then it's an
    isomorphism.

-   If $x \to \tilde{x}$ is a $W$-localization, and $x \to y$ is a
    morphism with $y$ $W$-local, then there's a unique map
    $\tilde{x} \to y$ making the obvious triangle commute.

-   If $x \to \tilde{x}$ is a $W$-localization, and $x \to y$ is in $W$,
    then there's a unique map $y \to \tilde{x}$ making the obvious
    triangle commute.

```{=html}
<!-- -->
```
-   $\phi^* : \cl{C}(y,x) \to \cl{C}(x,x)$ is a bijection, so there's a
    map $\psi$ pulling back to the identity. Hence $\psi \phi = 1$. Note
    than $\phi \psi : \cl{C}(y,y)$ goes to $\phi$ under
    $\phi^* : \cl{C}(y,y) \to \cl{C}(x,y)$. So does $1$, so by
    bijectivity, $\phi \psi = 1$, finishing the proof.

-   $y$ is $W$-local, so the map $\cl{C}(\tilde{x},y) \to \cl{C}(x,y)$
    is a bijection, which is precisely what we want to prove.

-   $\tilde{x}$ is $W$-local, so the map
    $\cl{C}(y,\tilde{x}) \to \cl{C}(x,\tilde{x})$ is a bijection, which
    again is precisely the statement.

If each object in $x$ admits a $W$-localization, it can be carried out
functorially, i.e there exists a functor $E$ and natural transformation
$1 \to E$ so that $x \to Ex$ is a $W$-localization of $x$.

Moreover, $E$ is unique with this property up to natural isomorphism.

First, just choose any system of $W$-localizations for each object:
$\eta_x: x \to Ex$. For $f: x \to y$, define $Ef: Ex \to Ey$ to be the
unique diagram making this square commute:

A unique map with this property exists by the previous proposition. For
uniqueness, just let $E', \eta'$ be another pair like this, and take the
unique map $Ex \to E'x$ given by the map $x \to E'x$. Using the
proposition, this is seen to be natural, and an inverse can be found by
the unique map $E'x$ to $Ex$.

If $\cl{C}_W$ is the full subcategory of $W$-local objects, then in the
situation of the previous proposition,
$i: \cl{C}_W \hookrightarrow \cl{C}$ admits a left adjoint $E$, and the
unit $\eta: 1 \to iE = E$ is a $W$-localization.

We choose the left adjoint to be the functor $E$ described in the
previous proposition, which does have image contained in $\cl{C}_W$. To
describe the counit map $Ei \to 1$, we remark that if $x$ is $W$-local,
the identity induces a map $Ex \to x$. Checking the triangle identities
is now just an exercise in diagram-chasing.

In this situation, the functor $E$ factors through the homotopy category
$\cl{C}[W\inv]$. One can show that the functor
$\cl{C}[W\inv] \to \cl{C}_W$ is an equivalence. (compose the inclusion
and the localization to construct an inverse). This provides a nice
description of the category $\cl{C}[W\inv]$

Localization at $h_*$
---------------------

(Here we work with simplicial sets rather than spaces, though of course
it doesn't matter).

Given a (reduced?) homology theory $h_*$, satisfying the limit axiom, we
say that a map $x \to y$ is

-   An $h_*$-equivalence if $h_*(x) \to h_*(y)$ is an isomorphism.

-   An $h_*$-cofibration if it's a levelwise injection (i.e a "normal"
    cofibration of simplicial sets)

-   An $h_*$-fibration if it has the RLP wrt those maps that are
    $h_*$-cofibrations and $h_*$-equivalences

This equips the category of simplicial sets with the structure of a
closed model category

The main difficulties of this proof are showing that the "$h_*$-trivial
$h_*$-fibrations" are precisely the trivial kan fibrations, and the
construction of factorizations of the form $pi$, where $i$ is an
$h_*$-trivial cofibration, and $p$ an $h_*$-fibration.

Clearly trivial kan fibrations are $h_*$-equivalences, and since all
monomorphisms lift against them, they're certainly also
$h_*$-fibrations. To see that any $h_*$-trivial $h_*$-fibration is a
trivial kan fibration, let $X \to Y$ be such a map and $A \to B$ a
monomorphim. Factor $X \to Y$ as a cofibration followed by a trivial kan
fibration. We get this diagram:

Hence there's a dashed arrow. Now consider this diagram:

Since $X \to Z$ is an $h$-equivalence (by $2-3$) and a cofibration, it
lifts against $X \to Y$, producing a retract $r: Z \to X$ Now define
$B \to X$ as the obvious composite. Using commutativity of the above
diagram, we see that this is indeed a lift.

To construct factorizations, we can simply use the small object argument
of Quillen (as formulated in [@RezkQuasi; @12.10], noting that the class
of $h_*$-trivial cofibrations is saturated. Of course we also need to
find a suitable class of generating trivial cofibrations. To do this,
let $c$ be an infinite cardinal at least equal the cardinality of
$h_*(\ast)$. If $A$ is a simplicial set, let $\# A$ be the number of
non-degenerate simplices in $A$. Then if $\# A \leq c$,
$h_*(A,B) \leq c$. We first need this fact: if $(K,L)$ is a simplicial
pair with $h_*(K,L) = 0$, then there's a subcomplex $A \subset K$ with
$A \not\subset L$, such that $h_*(A, A \cap L) = 0$, and $\# A \leq c$.

Given this, we show that any map which lifts against the $h_*$-trivial
cofibrations $A \hookrightarrow B$ with $\# B \leq c$ is an
$h_*$-fibration. Given a general $h_*$-trivial cofibration $L \to K$, we
can choose $A$ as in the above and create a lift for $A \cup L$. Since
$A \subsetneq A \cup L$, this means any partial lift can be extended. By
Zorn's Lemma, this implies the existence of a lift for all of $K$.
Bousfield carries this argument out in [@BouLocSpc].

Given $(K,L)$ a simplicial pair with $h_*(K,L) = 0$, we must construct
the desired $A$. We construct a sequence $A_n$ in the following way:
$A_1$ is just any subset $A_1 \subset K$ with at most $c$ nondegenerate
simplices, and not contained in $L$. Then given $A_n$, for each element
$x \in h_*(A_n, A_n \cap L)$ choose a finite complex $F_x \subset K$ so
that $i^*(x) \in h_*(A_n \cup F_x, A_n \cup F_x \cap L)$. Since
$h_*(K,L) = 0$, and $(K,L)$ is the colimit of subcomplexes of the form
$(A_n \cup F_x, A_n \cup F_x \cap L)$ with $F_x$ finite, and $h_*$ is
assumed to satisfy the limit axiom, this is possible. Let
$A_{n+1} = A_n \bigcup_{x \in h_*(A_n,A_n\cap L)} F_x$. Let
$A = \cup A_n$. Note that
$h_*(A_n, A_n\cap L) \to h_*(A_{n+1}, A_{n+1} \cap L)$ is zero, since
for each $x$ it factors through a map sending $x$ to $0$. Again by the
limit axiom, the limit of this sequential system is $h_*(A,A \cap L)$ -
clearly, it is $0$.

The $h_*$-fibrant objects are precisely the $h_*$-local ones.

An object $A$ is $h_*$-local if and only if each $h_*$-equivalence
$X \to Y$ induces a *surjection* $\cl{H}(Y,A) \to \cl{H}(X,A)$.

If $A$ is $h_*$-local, let $X \to Y$ be an $h_*$-trivial cofibration.
Then for each map $X \to A$ we must produce an extension $Y \to A$, but
the existence of such is precisely the surjectivity guaranteed by
previous lemma. On the other hand, if $A$ is $h_*$-fibrant, and $X\to Y$
is an $h_*$-equivalence, and $X \to A$ is any map, we can factor
$X \to Y$ as an $h_*$-equivalence cofibration followed by a trivial
fibration, which admits a section.

Now the map $X \to Z$ lifts against $A \to \ast$, giving the dashed
arrow. So we can define a lift $Y \to A$ by composing the section with
that lift. Since the section is an honest-to-god inverse in the homotopy
category, the relevant triangle commutes.

There's a functor $C_h: sSet \to sSet$ and natural transformation
$\eta: 1 \to C_h$, so that $\eta_X \to C_hX$ is an $h_*$-localiztion for
any $X \in sSet$.

The above lemma relies on the existence of a *calculus of left
fractions* for the $h_*$-equivalences in $\cl{H}$.

$h_*$-localization for nilpotent spaces
---------------------------------------

The main results of Bousfield's paper, apart from the above existence
results for $h_*$-localizations, are certain descriptions of these
localizations. We restrict to $H(-;R)$-localization (or just
$R$-localization) for rings $R = \Z[J\inv]$ or
$R = \osum_{p_i}\Z/(p_i)$. Then Bousfield proves the following two
results:

If $X$ is connected and nilpotent, and $X\to X_A$ is the
$A$-localization of $X$, we have the following results:

-   If $A = \Z[J\inv]$, we have
    $\pi_n(X_A) = \Z[J\inv] \tensor \pi_n(X)$[^1], and
    $\tilde{H}_*(X_A;\Z) = \tilde{H}_*(X;\Z) \tensor \Z[J\inv]$

-   If $A = \Z_p$, there's a short exact sequence:

    which furthermore splits

-   If $A = \osum_{p_i} \Z/(p_i)$, $X_A = \prod_{p_i} X_{\Z/(p_i)}$

The proof of this is mostly by reference to previous work by Bousfield
and Kan.

For *any* connected space $X$, $X$ is $A$-local if and only if $\pi_n$
is an $HR$-local group for each $n$, and $\pi_n$ is an $HZ$-local
$\pi_1$-module for each $n\geq 2$.

$HR$ is the class of maps that induce an isomorphism on $H_1(-,R)$, and
an epimorphism on $H_2(-,R)$ (this is group cohomology). $HZ$ is the
class of maps so that $H_i(\pi_1; A) \to H_i(\pi_1, B)$ is an
isomorphism for $i = 0$, surjective for $i=1$. Yes, this latter
condition is a bit weird - if $\pi_1$ acts trivially,
$H_0(\pi_1, A) = A$, so $HZ$ is only isomorphisms, so everything is
$HZ$-local.

[^1]: here $\pi_1(X) \tensor \Z[J\inv]$ denotes some weird algebraic
    construction
