---
title: Cellular $E_k$ Algebras
---
Overview / Intro
----------------

Following a preprint of Galatius, Kupers and Randall-Williams, [@GKRW].

A typical object of study could the symmetric groups
$\{\Sigma_n\}_{n \in \N}$. These are naturally related to each other. A
classical thing to study is the inclusions
$\Sigma_n \into \Sigma_{n+1}$. For instance, one may be interested in
proving that this map induces a map on group (co)homology for $n$
sufficiently big. Another important example is the *mapping class
groups*, $\Gamma_{g,1}$, the group of diffemorphisms of a genus $g$
surface with connected boundary relative to the boundary, up to
homotopy. Here the stabilization is accomplished by gluing an extra hole
to the boundary.

In both cases, the group in question arises as an automorphism group in
a certain category - and what's interesting in this case, the
stabilization maps come from a symmetric-monoidal structure on this
category. The idea is to try to understand this $E_n$-groupoid, in order
to study the relation between the mapping spaces.

In this project, I will try to rephrase the ideas of the paper in
$\infty$-categorical language.

An important diagram:

![](/images/208655c125111edfef82829170438dd0223f4779.svg)

Søren: "Målet er at forstå hvordan et givet objekt $R \in Alg_n(C)$ kan
løftes hele vejen til højre, altså hvordan det gives en filtrering
således at den associerede graduerede er fri, og helst så lille som
muligt."

### Strategy

We suppose we are given some $E_k$-groupoid $G$, equipped with a
monoidal functor $r : G \to \N_0$ (the rank). We furthermore assume that
$r\inv(0) = \{\mathbb{1}\}$ (in other words, all rank zero objects are
isomorphic), and furthermore that $G_\mathbb{1}$ is trivial.

We also suppose that there is precisely one rank $1$ object, $\sigma$
(up to equivalence, but whatever).

Note first that $r$ induces an adjunction
$$\adjunction{r_*}{\sSet^{G}}{\sSet^{\N_0}}{r^*}$$ (for formal reasons),
where $r_*$ is left Kan extension.

This can be upgraded to an adjunction
$$\adjunction{r_*}{\Alg_{E_k}(\sSet^G)}{\Alg_{E_k}(\sSet^{\N_0})}{r^*}$$

There is some question here about unital vs non-unital algebras.

Now we consider $\ast_{\geq 0}$ in $\Alg_{E_k}(\sSet^G)$, with
underlying object
$$\ast_{\geq 0}(x) = \begin{cases} \emptyset & r(x) = 0 \\ \ast & \text{otherwise}\end{cases}$$
(Note that this is a non-unital algebra). Pushing this forward with
$r_*$, we obtain $r_*(\ast_{\geq 0}) = R \in \Alg_{E_k}(\sSet^{\N_0})$,
with underlying object $R(0) \simeq \emptyset$,
$R(n) \simeq \coprod_{x \in \pi_0(G), r(x) = n} BG_n$. (There is some
question here about derived vs strict Kan extensions).

We construct from this $\bar{R}_k$, which is weakly equivalent to the
unitalization of $R_k$ (we have passed to the category of simplicial
$k$-modules along the free functor.) The underlying object of this is
weakly equivalent to $\mathbb{1} \coprod R_k$, which is precisely
$r_*(\ast)$, suggesting that this whole business with non-unital-ness
may be unnecessary in the $\infty$-categorical setting.

Out of $\bar{R}_k \in \Alg_{E_k^+}(\sSet^{\N_0})$, we cook up a module
$\bar{R}_k/\sigma$. It transspires that
$$H_{n,d}(\bar{R}_k/\sigma) \simeq H_d(G_{\sigma^n}, G_{\sigma^{n-1}; k})$$
bringing us back to the relative homology.

### Attempt for `\icats`{=latex}

Let the following input be given:

1.  A (small) $E_k$-space $G$ (which may need to be a groupoid)

2.  With an $E_k$-map $r: G \to (\N_0, +, 0)$.

3.  Such that $r(x)= 0 \Rightarrow x \simeq \mathbb{1}_G$, and
    $r(x) = 1 \Leftrightarrow x \simeq \sigma$ for $\sigma \in G$, and
    moreover $G_\mathbb{1}$ is contractible. (We may as well suppose
    that each preimage $r\inv(n)$ is connected, but this is actually a
    consequence of the assumptions).

4.  A commutative ring $k$.

Then we do the following:

We have an adjunction $$\adjunction{r_*}{\S^{G}}{\S^{\N_0}}{r^*}$$ by
formal nonsense, (the categories are presentable, for instance).

This upgrades to an adjunction
$$\adjunction{r_*}{\Alg_{E_k}(\S^G)}{\Alg_{E_k}(\S^{\N_0})}{r^*}$$
`\todo{why}`{=latex}

Now we consider the terminal object $\ast \in S^G$. This admits a
canonical algebra structure`\todo{why}`{=latex}, and we define
$R \in \Alg_{E_k}(\S^{\N_0})$ to be $r_*(\ast)$.

Now we first observe that $\Sigma^\infty : \S \to \Sp$ and
$- \tensor Hk: \Sp \to D(k)$ induce symmetric monoidal functors
$$\Sigma^\infty: \S^C \to \Sp^C$$ $$- \tensor Hk: \Sp^C \to D(k)^C$$ for
any
$C$`\todo{why - also, figure out if D(k) is the right thing}`{=latex},
since $H_k$ is an $E_\infty$-algebra, and hence we can define
$R_k \in D(k)^{\N_0}$ to be the image of $R$ under this composition.

Now the $\sigma$ from the input defines a class in
$H_0(G_\mathbb{1},k) = \pi_0(R_k(1))$`\todo{why}`{=latex}, and hence a
map $S^0 \to \Omega^\infty R_k(1)$. This can be thought of as a map
$\Sigma^\infty S^{1,0} \to R_k$, where $S^{i,j}$ is a graded space with
a single copy of $S^j$ in degree $i$.
`\todo{there's something to check here about interaction between grading and $\Sigma/\Omega$ being trivial.}`{=latex}
This defines a map
$$S^{1,0} \tensor R_k \to R_k \tensor R_k \labelto{\mu} R_k$$ where
$\mu$ is the multiplication, and now we can define $R_k/\sigma$ to be
the cofiber of this map. This will imply
$$H_{n,d}(R_k/\sigma) (= H_d(R_k/\sigma(n))) = H_d(G_{\sigma^n}, G_{\sigma^{n-1}}; k)$$
The first equality is just by definition. To see
$H_d(R_k/\sigma(n)) = H_d(G_{\sigma^n},G_{\sigma^{-1}};k)$, note that,
since colimits in $D(k)^{\N_0}$ are computed pointwise, the lhs is the
homology of the homotopy cofiber of the map
$$(S^{1,0} \tensor R_k)(n) \to R_k(n)$$ Observe that this can be
identified with the map $$F_k(G_{n-1} \to G_{n})$$ where the map is
tensoring with $\sigma$ and $F_k$ is free $k$-module functor as above.
But the homology (really the homotopy groups) of this cofiber is
precisely the relative homology in question
`\todo{maybe one can change the order here?}`{=latex}

Of course, this leaves out the problem of actually saying something
about $R_k/\sigma$. This seems to be where the $E_k$-homology stuff
comes in. This is the content of Thm 18.2. The point is that we can
build a "vanishing line" in this relative homology out of one in the
$E_k$-homology of $\R$ (which is the case-specific input one needs to
produce). This seems like a worthy goal for the project.

### How to transfer up vanishing lines

Not understood yet. This involves a theorem (18.2) which moves a
vanishing line in the $E_k$-homology of $R$ into a vanishing line for
the relative group homology of $G_n$.

Step one: build a CW-approximation $Z \labelto{\sim} R$, where $Z$ is
build by attaching only cells in bidegree $(n,d)$ with $d \geq n-1$, and
a single cell corresponding to $\sigma$ in degree $1,0$ - here we use
the assunptions on $E_k$-homology.

Step two: Consider the skeletal filtration $sk(Z)$ as an algebra in
$\Z_{\geq}$ graded objects. Construct also $sk(Z)_{\sigma}$. The fact
that $\colim sk(Z)_{\sigma} = Z/\sigma = R/\sigma$ gives a spectral
sequence computing the homology of $R/\sigma$. The entries of this
spectral sequence are the homology groups of the associated graded. One
can show that $gr(sk(Z)/\sigma) = gr(sk(Z))/\sigma$, and clearly
$gr(sk(Z))$ is free on a wedge of spheres.

This reduces us to showing the same vanishing line for such things. By
viewing $gr(sk(Z))$ as a colimit of finite subobjects, we can assume
it's free on a finite wedge of spheres.

Step three: By a fairly simple universal coefficients argument, it
suffices to consider $k = \Z$.

Step four: By a similar argument, it suffices to consider $k = \Z/(p)$
for all primes $p$, since for any f.g. abelian group, if it *doesn't*
vanish, there's some prime where $\Z/(p) \tensor A$ also doesn't vanish.

Step five is just to use a result of Cohen on the $\Z/(p)$-homology of
free $E_k$-algebras.

### Buzzwords

1.  Monads, operads, homology or homotopy of them.

2.  Derived (in)decomposables - use to bound number of cells.

3.  Filtered algebras, graded algebras.

4.  Cell attachment of $E_k$ algebras

5.  Decomposables takes cell structure in $\Alg_T(\cl{C})$ to cell
    structure in $\cl{C}_\ast$

6.  Homology preserves homotopy colimits for trivial reasons.

Things for project/questions:

1.  $\infty$-monads, $\infty$-operads. In this setting: indecomposables,
    homology, algebras, change-of-monad. Filtered and graded algebras.

2.  Does the theorem apply in an essential way to graded monoidal
    *groupoids*, or could one consider a general space?

3.  Is the assumption that $\sigma$ is given by an element in degree $1$
    necessary, or could one cook up vanishing theorems for
    $H(G_{n+k}, G_n)$?

Indecomposables
---------------

Assume $\cl{C}$ has at least a terminal object $\ast$ Recall the
*basepoint monad*, $+$, which corresponds to the monadic adjunction
$$\adjunction{F_+}{\cl{C}}{\cl{C}_\ast}{U_+}$$ With
$\cl{C}_\ast = \cl{C}_{/\ast}$, $F_+(X) = \ast \into X \coprod \ast$,
and $U_+$ the obvious forgetful functor.

An *augmentation* on a monad $T$ is a map of monads $T \to +$.

The change-of-monads adjunction corresponding to this is the
*indecomposables* functor $Q^T : \Alg_T(\cl{C}) \to \cl{C}_\ast$

The maps of monads $$\Id \to T \to +$$ induce adjunctions
$$\adjunction{F^T}{\cl{C}}{\Alg_T(\cl{C})}{U^T}$$
$$\adjunction{Q^T}{\Alg_T(\cl{C})}{\cl{C}_\ast}{Z^T}$$

This gives a reflexive coequalizer

$$+T(X)\overset{\to}{\underset{\to}{\from}}+X \to Q^T(X)$$

Where the two maps are given, respectively, by the composite
$+T(X) \to ++X \to X$, and the multiplication of $T$ applied away from
the basepoint.
