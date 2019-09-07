---
title: A compositional framework for reaction networks
---
We encounter two types of "process networks"

A *reaction network* consists of:

1.  A finite set $S$ of *species*,

2.  A finite set $T$ of *transitions*,

3.  Two functions $s,t: T \to \bN^S$, called *source* and *target*.

The basic example is that the elements of $S$ are different compounds
appearing in some chemical system under analysis, the $T$ are the
reactions which may take place, each of which consumes a certain number
of molecules of each type, and produces a certain number of molecules of
each type.

A *Petri net* consists of:

1.  A finite set $S$, which we now call *places*.

2.  A finite set $T$, which we still call transitions.

3.  Functions $m,n: S \times T \to \bN$.

The equivalencee between these things is obvious: a petri net is just an
uncurried reaction network. However, we usually draw Petri nets slightly
differently, using diagrams like this:

![A petri net](/images/petrinet1.png)

We say that a reaction network $(S,T,s,t)$ or a Petri net $(S,T,n,m)$ is
a network (or net)*on $S$*.

Now we need to figure out the open versions of these, to compose them.

Given $X,Y$ finite sets, an *open reaction network from $X$ to $Y$* is a
cospan of finite sets

together with a reaction network $R$ on $S$. We say $X$ is the set of
inputs and $Y$ is the set of outputs, and may write $R: X \to Y$.

Defining the composition is a bit more complicated, because we need to
figure out how to glue reaction networks together in a systematic way.
We need to turn this:

![](/images/petrinetcomposition.png)

Into this:

![](/images/petrinetcomposed.png)

Doing this sort of thing systematically was worked out by Fong (see
references in paper). The general idea, as far as I can tell, is that we
have a functor $F: \Fin \to \Set$ (in this case, $F(S)$ is the set of
reaction networks on $S$).

Then when composing two "decorated cospans", we first form the pushout
of sets:

![](/images/847a92130bf031ba2e8d8e07c2aff249b0d83cf2.svg)

This is the cospan underlying the composite. Now we need to build an
element in $F(S +_Y S')$. To do so, we use the fact that $F$ is a
functor, and furthermore lax symmetric monoidal from $(\Fin, +)$ to
$(\Set, \times)$, and go
$$F(S) \times F(S') \to F(S + S') \to F(S +_Y S')$$ Here the last
morphism is just $F$ applied to the canonical map from coproduct to
pushout, and the first is the laxative.

To form a category, we need to quotient by the natural equivalence
relation, and show associativity. From Fong's machinery, we also get a
symmetric monoidal structure on this category, coming from the coproduct
of the underlying stuff.

We can equip each transition in a reaction network with a rate
$r \in (0,\infty)$. We can do all the above for reaction networks with
rates as well.

Then we get a dynamical system from a reaction network like so:

Given a reaction network with rates, $(S,T,s,t,r)$, we get a *rate
equation*, which is a differential equation with solutions
$c: \bR \to \bR^S$. (We think of the $s$-component of $c(t)$ as the
*concentration of species $s$ at time $t$*). The rate equation is:
$$\frac{dc(t)}{dt} = \sum_{\tau in T}r(\tau)(t(\tau) - s(\tau))c(t)^{s(\tau)}$$

You are supposed to read $c(t)^{s(\tau)}$ as the product
$\prod_{\sigma \in S}c_\sigma(t)^{s(\tau)(\sigma)}$. Moreover, this
weird linear combination of species $t(\tau) - s(\tau)$ is supposed to
mean that, for each term in the sum, you add $r(\tau)c(t)^{s(\tau)}$
times $t(\tau)(\sigma)$ to the $\sigma$-component of the derivative, and
the other way for $s$. (This makes sense when you think of $t(\tau)$ as
a function $S \to \bN \into \bR$).

Now the paper defines 1) a category of *open dynamical systems*, defined
along the lines of the above, 2), the category of *semi-algebraic
relations*, where the objects are $\bR^n$ and the morphisms are
relations given by polynomials and inequalities, and 3), two functors
$$RxNet \to Dynam \to SemiAlgRel,$$ called respectively *black-boxing
and gray-boxing.*

The first one does what was described above in an "open" way, taking an
open reaction network to the corresponding open dynamics. Black-boxing
takes a set $X$ to $\bR^X \oplus \bR^X$, and an open dynamical system to
the relation on $\bR^X \oplus \bR^X \oplus \bR^Y \oplus \bR^Y$
consisting of tuples $$(I,i_*(c), O, o_*(c))$$ where $I,O$ are an iflow
and an outflow on the in and out nodes which make $c$ (which is a state
of the entire system) into a steady-state, and $i_*(c), o_*(c)$ denotes
the states on the in/out nodes in $c$.

The "magic" here is that this is compositional, i.e when you compose
dynamic systems, this relation is all you need if you want to figure out
the steady-state behaviour of composite systems.
