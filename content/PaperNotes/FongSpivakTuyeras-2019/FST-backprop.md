---
title: Fong-Spivak-Tuyéras - Backprop as Functor
---
This is about the paper named in the title.

I have written out the definition of the paper's $\Learn$, but in a
general category:

Let $\cl{C}$ be a category.

Let $A,B$ be objects of $\cl{C}$. Then a \*learning algorithm\* for maps
$A \to B$ (or just a learning algorithm $A \to B$) consists of the
following data:

\- An \*parameter object\* $P \in \cl{C}$ which parameterizes the maps
we are searching over. - An \*implementation map\* $i: P \times A \to B$
- An \*update map\* $u: P \times A \times B \to P$.

These three pieces are what one would expect to mean by \"learning
algorithm\". However, in order to compose them, we need:

\- A \*request map\* $r: P \times A \times B \to B$.

Given $(P,i,u,r): A \to B$ and $(P',i',u',r'): B \to C$ learnign
algorithms, we define the \*composite learning algorithm\* $A \to C$ as
follows:

\- The parameter object is $P' \times P$. - The implementation map is
the composite $P' \times P \times A \to P' \times B \to C$ of the two
implementation maps. - The update map is given by first applying $i$ to
get $P' \times P \times A \times B \times C$, then using the diagonal to
go to $P' \times P \times A \times B \times B \times C$, then using $u'$
and $r'$ to go to $P' \times P \times A \times B$, and finally using $u$
to go to $P' \times P$.

For each $A$, the identity learner $A \to A$ is given by
$P = *, i(*,a) = A, u = !, r(p,a,a') = a'$.

Then we get a category $\Learn_\cl{C}$ where the objects are the objects
of $\cl{C}$ and the morphisms are (equivalence classes of) learning
algorithms (or \*learners\*, as Baez-Spivak-Tuyéras calls them).

There's a symmetric monoidal structure just given by taking the product
and running things in parallel. Is this the actual product? Let's think
about this:

Suppose $(P,i,u,r): X \to A$ and $(P',i',u',r'): X \to B$ are learners.
Then we can define $P \times P' \times X \to A \times B$ in an obvious
way. $P \times P' \times X \times A \times B \to P \times P'$ is
likewise pretty obvious. The problem is the request map - we get two
values of $X$ out (one for each learner), and there's no way to
aggregate them. We can try to perform the requests serially, but here
there's no guarantee they will commute, which is an obvious problem.

This actually does seem to be a sort of problem with this approach -
leaners are "linear", you can't learn a map into the product in the
obvious way. On the other hand,

Example V4 on weight tying seems to show off the power of the requests
idea - by decomposing the parameterization and the implementation, one
can make explicit how information flows backwards.

Some scattered thoughts:
------------------------

-   Learning algorithms in this mold somehow place undue weight on
    recent data - if our current $p \in P$ is the result of training on
    $100000$ data, each new datum should only perturb it a little, while
    the first few data should move the current state a lot (if each
    datum is supposed to have the same weight).

-   But on the other hand, this is also a feature of proper Bayesian
    updating, so probably not an error.

-   We should allow \*continuous learning\*, constructing a \*path\*
    through the parameter space given a path through $A \times B$.

-   This whole thing should be part of a more complicated story
    involving information theory, statistics/probability, and dynamics.

-   There's a symmetry between $A$, the input, and $P$, the parameter
    space, in the definition of learner. As noted in the paper, one
    could package update and request into a single map
    $A \times P \times B \to A \times P$. (The assymetry comes in in the
    composition, as it obviously has to).

-   However, the symmetry between parameters and inputs does seem to
    come back in the example on weight tying, where the parameter is
    "factored out" as an input.

-   Everything should be probabilistic

Idea for Bayesian learner:

Given a finite set $X$, let $P(X)$ be the set of probability
distributions on $X$. Let $X \times \R^n \to \R^m$ be a map. Fix an
$m\times m$ covariance matrix $\Sigma$. Then given
$p \in P(X), a \in \R^n, b\in \R^m$, we can form $p' \in P(X)$ by the
rule $$p'(x) = p(x)P(I_x=b)/P(I=b)$$ where for each $x\in X$, $I_x$ is a
normally distributed stochastic variable with mean $i(x,b)$ and variance
$\Sigma$, and $I = \sum_{x\in X}I_x / \#X$ is the average.

By using a weighted average as implementation, this gives a learner
$\R^n \to \R^m$.

Of course, the noise here is kind of artificial, so this isn't great as
a "platonic ideal" of learning algorithms.

The request $r(p,a,b)$ should generate a new hypothesis about the true
value of $A$, given that $a$ was measured, $b$ was the measured outcome,
and $p$ is our hypothesis about the map.

The implementation should not depend on an arbitrary aggregation on the
codomain - you should really be maintaining and updating a probability
distribution on the parameterization space.

A baby example of request
-------------------------

We write out how the request map enables decomposition in a very simple
example, along the lines of example V4.

Suppose we have a learner parameterized by $P$, $F: A \to B$. Then we
can split it up into a "dumb" learner $d: P \times A \to B$ (i.e
parameterized by $*$), which is just fixed at $i$, and a "constant"
learner $c: * \to P$ parameterized by $P$, where $i(p,*) = p$ (it just
learns a constant).

Now the request function for our dumb learner is just given by the
request/update function of the original learner (and it has trivial
update map), whereas the update function for our constant learner is
given by overriding the current parameter.

Then we can form the composite $d \circ (c \times 1_A)$. We claim this
is $F$. The parameter space is $P \times * \times *$, and the
implementation is clearly the same. The request/update of this composite
is given by taking $(p,a,b)$, using the identity on $a$ and reading off
the $p\in P$ to get $(p,p,a,b)$, then using the request of $d$ on
$(p,a,b)$ to obtain a new $(p',a')$. This is precisely the
request/update of $F$.

[todo]: # Draw some diagrams here?

Gradient descent and backpropagation
------------------------------------

We describe the gradient descent algorithm in this framework.
Pre-reading, I wanted to describe how these ideas recover a "classical"
picture of backpropagation, but I don't know/remember if this appears in
the paper.

The category *Para* has objects Euclidean spaces $\R^n$, and morphisms
differentiable parameterized maps $\R^p \times \R^n \to \R^m$.

Let $\epsilon > 0$ be given, and let $e:\R^2 \to \R$ be a differentiable
function so that $\frac{\partial e}{\partial x}(x_0,-)$ is a bijection,
for each $x_0 \in \R$. ($e$ is our *error* function). Then we can define
$L_{\epsilon,e}: Para \to \Learn$, a functor sending
$I: P \times A \to B$ to the learner $(P,I,U_I,r_I)$, with
$$U_I(p,a,b) := p - \epsilon \nabla_pE_I(p,a,b)$$
$$r_I(p,a,b) := f_a(\nabla_aE_I(p,a,b))$$ where
$E_I(p,a,b) := \sum_j e(I_j(p,a),b_j)$, and $f_a$ applies the inverse to
$\frac{\partial e}{\partial x}(a,-)$ component-wise.

Observe that $E_I: P \times A \times B \to \R$. The symbols
$\nabla_p, \nabla_a$ denote taking the gradient with respect to either
the fist or the second (set of) variables, holding the rest fixed.

$U_I$ asks: For each coordinate, how quickly does altering $p_j$ change
the error? Step that much (times $\epsilon$) along this coordinate.
$r_I$ asks: For each coordinate, how quickly does altering $a_j$ change
the error? Find $a'_j$ so that this is exactly
$\frac{\partial e}{\partial x}(a_j,a'_j)$

Observe that $r_I$ is very reasonable: in each coordinate, we find
exactly the coordinate so that, if $a'_j$ had "been correct" (in the
sense that $I(p,a') = b$), then the "gradient of error" between $a_j$
and $a'_j$ accounts for all of the total "gradient of error".

The above construction is a faithful, injective-on-objects, strong
monoidal functor.

The essential idea which leads to backpropagation is that functoriality
of this construction means in particular that the update functions
compose. In other words, if $I,J$ are parameterized functions, then
$U_{I * J}$, i.e the update associated to the parameterized composite of
$I$ and $J$, is equal to $U_I * U_J$, i.e the composite according to the
structure of $\Learn$. Interestingly, the LHS does not depend on the
definition of $r_I$. So we have to pick the way updates pass back very
specifically in order to make our construction functorial. On the other
hand, $\epsilon$ does not appear in the request function.

It seems that the update functions determine the request function in
some sense, but we have a family of update functions with the same
request function.

Weight tying
------------

Weight tying is a concept in machine learning, where two bits of the
network share their weights. In other words, we use some parameter
multiple places in the parameterized function, and update it based on
both of their performance. The paper contains a pictorial description of
how this is elegantly displayed using the symmetric monoidal structure,
and the idea of pulling out parameters discussed above. Here we also use
the *bimonoid* structure which objects in the image of $L_{\epsilon,e}$
carry. In brief, given a loss function, there is a canonical way of
learning a (parameter-free) map $\R^n \to \R^n \times \R^n$. For
quadratic error, the request is given by $(x,(y,z)) \mapsto y+z-x$.
(There is also a multiplication an so on, the details are in the paper).
This structure is necessary to duplicate the outputs of a cell, the way
we want to.

Flashcard ideas
---------------

Define learning algorithms. Describe how to separate parameter and
implementation (V4).
