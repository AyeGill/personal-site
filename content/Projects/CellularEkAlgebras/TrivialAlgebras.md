---
title: Trivial algebras
tags: Operad, Trivial algebras, $E_k$-homology
---
We can
approach the idea of trivial algebras/$E_k$-homology by trying to define
an intermediate step of *Trivial algebras with distinguished
$0$-morphisms*.

Define $Triv^+$ to be the following category:

1. The objects of $Triv^+$ are pairs $(\braket{n}, Z)$, where
    $Z \subseteq \braket{n}^\circ$. We think of the point in $Z$ as
    being sent to zero, as opposed to the underlying object of the
    algebra.
2. A morphism $f: (\braket{n}, Z) \to (\braket{m}, Z')$ consists of
    - A pointed function $f: \braket{n} \to \braket{m}$

    - A subset $T \subseteq \braket{m}^\circ$ (those coordinates where
        the morphism equals/factors over zero).

    - Such that $Z' \cup f(Z) \subseteq T$

    - Such that for $i\in Z$, $f\inv(\{f(i)\})$ is a singleton (we
        never define operations like $X \tensor 0 \to X$). (This may be
        unnecessary)?

    - And moreover so that, for $i \notin T, i \neq *$, $f\inv(i)$ is
        a singleton. (We only ever define zero operations and
        identities).
3. Given
    $f,T: (\braket{n},Z) \to (\braket{m},Z'), g,S: (\braket{m},Z') \to (\braket{r},Z'')$,
    the composition is $g\circ f, S \cup g(T)$.

There is an obvious forgetful functor $Triv^+ \to Fin_*$. We also define
functors $Triv \to Triv^+$ and $Fin_*^{surj} \to Triv^+$.

The first just sends $\braket{n}$ to $\braket{n},\emptyset$, and $f$ to
$f,\emptyset$.

The latter sends $\braket{n}$ to $\braket{n},\emptyset$, but sends $f$
to $f,S$ where $S$ consists of those points with non-singleton preimage

Then we guess that these are all well-defined, $Triv^+$ is an operad and
these functors are operad maps.

Let $\cl{C}$ be pointed. Then we define
$\widetilde{\Alg_{Triv^+}(\cl{C})} \subseteq \Alg_{Triv^+}(\cl{C})$ to
be the full subcategory of those algebras where
$$(\braket{1},\braket{1}^\circ) \mapsto 0 \in \cl{C}_{\braket{1}} \simeq \cl{C}$$

Then we have the following conjecture: the composition
$$\widetilde{\Alg_{Triv^+}(\cl{C})} \to \Alg_{Triv^+}(\cl{C}) \to \Alg_{Triv}(\cl{C}) \simeq \cl{C}$$
is an equivalence of $\infty$-categories .

$\Triv^+$ is an $\infty$-operad.

Since the map $p: \Triv^+ \to \Fin_*$ is (the nerve of) a $1$-functor,
it is automatically an inner fibration. So we must verify two
conditions:

1. Given $f: \braket{n} \to \braket{m} \in \Fin_*$ inert and
    $A \in \Triv^+_{\braket{n}}$, there exists a $p$-coCartesian lift
    $\tilde{f}: A \to B$.

2. The functor $\Triv^+_{\braket{n}} \to \prod_n \Triv^+_{\braket{1}}$
    is an equivalence.

For 1., let $f$ and $A = (\braket{n},Z)$ be as given. Then we put
$B = (\braket{m}, f(Z))$, and $\tilde{f} = (f, f(Z))$. It's clear that
this defines a lift of $f$. To verify that it is $p$-coCartesian, we use
(the dual of) HTT.2.4.1.10. So we must verify that the diagram of sets

is Cartesian for each $(\braket{l},Z') \in \Triv^+$.

In other words, we must show that giving a map $B \to C$ is equivalent
to giving a map $g:A \to C$ and a factorization $p(g) = h\circ p(f)$.
Let $$g = (g: \braket{n} \to \braket{l}, T \supseteq g(Z) \cup Z')$$ and
assume that $h\circ g = f$. Then the only possible lift
$\tilde{h}: B \to C$ is $$\tilde{h} = (h, T)$$

Now for 2. Let us briefly describe the category $\Triv^+_{\braket{1}}$.
It has two objects, $(\braket{1},\emptyset) =: *$, and
$(\braket{1}, \{1\}) =: 0$. The morphism sets are uniquely described by
the statement that $0$ is a zero object, and $*$ has only $1_*$ and the
zero endomorphism (which we denote also by $0$).

From the above description of the lifts, we see that
$$\tilde{\rho^i}(\braket{n},Z) = \begin{cases}0 & i \in Z\\* & i \notin Z\end{cases}$$
And moreover, that given
$h,T: (\braket{n},Z) \to (\braket{n},Z') \in \Triv^+_{\braket{n}}$,
supposing that $i \notin Z,Z'$, we have
$$\tilde{\rho^i}(h) = \begin{cases} 1_* & i \notin T\\ 0 & i \in T\end{cases}$$
(If $i$ is in $Z$ or $Z'$, the morphism is determined).

One can then show that the functor
$$\Triv^+_{\braket{n}} \to \prod_n \Triv^+_{\braket{1}}$$ is a bijection
on objects and morphism sets.

There is a map of $\infty$-operads $\Triv \to \Triv^+$, determined by
the object $*$. We will generally call this the canonical map (or the
canonical inclusion). Of course there is also an inclusion determined by
$0$, but we disregard this.

The map $\Fin^{surj} \to \Triv^+$ described above is a map of
$\infty$-operads.

This follows from the description of the $p$-coCartesian lifts of inert
maps given above.

Let $\cl{C}^\tensor$ be a symmetric monoidal with $\cl{C}$ pointed. Then
we define
$$\tilde{\Alg}_{\Triv^+}\cl{C} \subseteq \Alg_{\Triv^+}\cl{C}$$ to be
the full subcategory spanned by those $\Triv^+$-algebras $A$ where
$A(0)$ is a zero object.

### Conjecture

The composition
$$\tilde{\Alg}_{\Triv^+}\cl{C} \into \Alg_{\Triv^+}\cl{C} \to \Alg_{\Triv}\cl{C} \simeq \cl{C}$$
is an equivalence of .

Probably easiest to consider
$\tilde{\Alg}_{\Triv^+}\cl{C} \to \Alg_{\Triv}\cl{C}$.

Consequences of the conjecture
----------------------------------------------------

In this subsection, we assume that the above conjecture is true

For each pointed symmetric monoidal category, and each
$1 \leq k \leq \infty$ $\cC$, we let
$\Triv^{E_k}: \cC \to \Alg^{nu}_{E_k}\cC$ be the composite
$$\cC \simeq \tilde{\Alg}_{\Triv^+}\cC \to \CAlg^{nu}\cC \to \Alg_{E_k}^{nu}\cC$$

If $F: \cC \to \cD$ is a symmetric monoidal functor between pointed
symmetric monoidal , and $F(0) = 0$, there's an induced functo
$$F: \Alg_{Triv^+}\cC \to \Alg_{\Triv^+}\cD,$$ which preserves the
subcategories $\tilde{\Alg}_{\Triv^+}\cC, \tilde{\Alg}_{\Triv^+}\cD$.
This implies that the diagram

commutes.

By construction, the underlying object of $\Triv^{E_k} C$ is $C$ itself.
More precisely, the functor $T: \cC \to \tilde{\Alg}_{\Triv^+} \cC$
comes equipped with a natural isomorphism $UT \labelto{\sim} 1_{\cC}$,
if $U(A) = A(\braket{1},\braket{1}^\circ)$ is the "underlying object"
functor. Similarly, the functor
$\tilde{\Alg}_{\Triv^+} \cC \to \Alg^{nu}_{E_k}\cC$ is given by
composing with an operad map, so preserves the underlying object in the
same way. Hence there is a canonical natural isomorphism
$U\Triv^{E_k} \simeq 1_\cC$.

The functor $\Triv^{E_k}$ preserves limits and sifted colimits.

By HA, the functor $U$ detects limits and sifted colimits, i.e a diagram
in $\Alg^{nu}_{E_k}\cC$ is a limit or sifted colimit diagram if and only
if this is true after composing with $U$. Since
$U\Triv^{E_k} \simeq 1_\cC$, this implies the lemma.

$\Triv^{E_k}$ admits a left adjoint.

We denote by $Q^{E_k}$ the left adjoint of $\Triv^{E_k}$. We refer to
$Q^{E_k}$ as the *$E_k$-decomposables functor*.

We will also refer to the composite functor
$$\Alg^{nu}_{E_n}\cC \to \Alg^{nu}_{E_k}\cC \labelto{Q^{E_k}} \cC$$ as
$Q^{E_k}$. Note that this is *not* generally equivalent to $Q^{E_n}$. So
the superscript is really important.

In fact we can replace $E_k$ with any operad in the preceding
discussion. (At least, any single-colored operad).
