---
title: $\infty$-Operads
---
See [@LuHiAlg].

An $\infty$-operad is a functor of $p: \cl{C}^\tensor \to N(Fin_*)$ with
the following properties:

1.  For any *inert* map $f: \braket{m} \to \braket{n}$ in $N(Fin_*)$,
    and any object $X \in \cl{C}^\tensor_{\braket{m}}$, $f$ admits a
    $p$-coCartesian lift $\tilde{f}: X \to Y$. This implies that $f$
    induces a functor
    $f_!: \cl{C}^\tensor_{\braket{m}} \to \cl{C}^\tensor{\braket{n}}$.

2.  Let $f: \braket{m} \to \braket{n}$ be a map in $Fin_*$, and let
    $C,C'$ be objects lying over $\braket{m},\braket{n}$. Then let
    $\Map^f_{\cl{O}^\tensor}(C,C')$ be the connected component of
    $\Map_{\cl{O}^\tensor}(C,C')$ lying over $f$ (Note that)
    $\Map_{N(Fin_*)}(\braket{m},\braket{n})$ is discrete, so this makes
    sense.

    Now choose $p$-coCartesian lifts $C' \to C_i'$ lying over
    $\rho^i : \braket{n} \to \braket{1}$. Then
    $$\Map^f_{\cl{O}^\tensor}(C,C') \to \prod_{1\leq i \leq n} \Map_{\cl{O}^\tensor}^{\rho^i \circ f}(C,C_i')$$
    is a homotopy equivalence.

3.  For any finite collection of objects
    $C_1, \dots C_n \in \cl{O}^\tensor_{\braket{1}}$, there exists an
    object $C \in \cl{O}^\tensor_{\braket{n}}$ and a collection of
    $p$-coCartesian lifts $C \to C_i$ of $\rho^i$.

In fact, if $\cl{O}^\tensor \to N(Fin_*)$ is an $\infty$-operad, the
induced functor
$\cl{O}^\tensor_{\braket{n}} \to ()\cl{O}^\tensor_{\braket{1}})^n$ is an
equivalence for each $n$. We usually write
$\cl{O} = \cl{O}^\tensor_{\braket{1}}$ and refer to this as the
underlying of the $\infty$-operad.

When comparing this definition to more classical notions of operad, one
should keep in mind that this corresponds roughly to a *colored operad
in simplicial sets*. In other words, there is a collection of objects
(or colors), and for each collection of colors $X_1, \dots, X_n, Y$, a
simplicial set $Mul(\{X_1, \dots X_n\}, Y)$ of operations. (Although for
an $\infty$-operad, this space is only given up to homotopy
equivalence\...).

A *symmetric monoidal* is an $\infty$-operad
$p: \cl{C}^\tensor \to N(Fin_*)$, for which $p$ is a coCartesian
fibration. We may rephrase the conditions on $p$ as:

1.  $p$ is a coCartesian fibration.

2.  The functor
    $\cl{C}^\tensor_{\braket{n}} \to (\cl{C}^\tensor_{\braket{1}})^n$
    induced by the $\rho^i$ is an equivalence for each $n$.

A map of $\infty$-operads $\cl{O}^\tensor \to \cl{O}'^\tensor$ is a
functor $\cl{O}^\tensor \to \cl{O}'^\tensor$ satisfying two conditions:

1.  The diagram

    commutes.

2.  The functor $f$ carries inert maps to inert maps.

We denote by $Alg_{\cl{O}}(\cl{O}')$ the full subcategory of
$\Fun_{N(Fin_*)}(\cl{O}^\tensor, \cl{O}'\tensor)$ spanned by the maps of
$\infty$-operads.

Note that, in general, it is not good to ask that a diagram like the
above commutes strictly - one should ask for a natural isomorphism
rendering it commutative, and make this part of the data. However, since
$Fin_*$ is a $1$-category, and one can show that an $\infty$-operad
$p: \cl{O}^\tensor \to N(Fin_*)$ admits to natural isomorphisms, this
makes no difference.

If $\cl{O}'$ is a symmetric monoidal , we recover a higher version of
the familiar idea of an algebra over an operad in a symmetric monoidal
category.

Let $\cl{O}^\tensor$ be an operad, and let
$\cl{C}^\tensor \to \cl{O}^\tensor$ be a coCartesian fibration. Then it
is called a coCartesian fibration of operads if it satisfies the
following equivalent conditions:

1.  The composite $\cl{C}^\tensor \to N(Fin_*)$ exhibits
    $\cl{C}^\tensor$ as an $\infty$-operad.

2.  For every object
    $T= T_1 \oplus \cdots \oplus T_n \in \cl{O}^\tensor_{\braket{n}}$,
    the inert maps $T \to T_i$ induce an equivalence of categories
    $\cl{C}^\tensor_T \to \prod \cl{C}^\tensor_{T_i}$

In this case, we also refer to $\cl{C}^\tensor$ as a $\cl{O}$-monoidal
category.

If $\cl{O} = N(Fin_*)$, we recover the notion of symmetric monoidal .

Suppose $\cl{C}^\tensor \to \cl{O}^\tensor$ is a fibration of
$\infty$-operads, and $\cl{O}'^\tensor \to \cl{O}^\tensor$ is any map of
$\infty$-operads. Then we may consider the functor category
$\Fun_{\cl{O}^\tensor}(\cl{O}'^\tensor, \cl{C}^\tensor)$. The full
subcategory spanned by those functors which are maps of operads is
called $\Alg_{\cl{O}'/\cl{O}}(\cl{C})$. If $\cl{O}' = \cl{O}$ and the
map is the identity, we write
$\Alg_{\cl{O}/\cl{O}}(\cl{C}) = \Alg_{/\cl{O}}(\cl{C})$

If $\cl{O}^\tensor = N(Fin_*)$, we recover the previous notion of
$\Alg_{\cl{O}'}(\cl{C})$ (but specialized to the case of symmetric
monoidal ).

Since $\cl{C}^\tensor \to \cl{O}^\tensor \to N(Fin_*)$ is also an
$\infty$-operad, we may write $\Alg_{\cl{O}'}(\cl{C})$ and compare this
to $\Alg_{\cl{O}/\cl{O}'}(\cl{C})$. This is always meaningful, but it
does not in general make sense to think of the objects of this category
as algebras in a monoidal category $\cl{C}$.
