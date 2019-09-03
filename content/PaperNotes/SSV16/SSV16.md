---
title: Dynamical Systems and Sheaves
date: 2019-08-27
tags: toposes, sheaves, dynamics, category theory, operads, wiring diagrams
---

On [@SSV16].

## Wiring diagrams and operads.

Here is a figure from the paper:

![Wiring diagram](/images/SSV16-wiringdiag.png)

We can imagine labelling the boxes with the names of certain systems.
This diagram then tells us how to connect the inputs of one system with the output of another, and which outputs/inputs should be outputs of the entire system.

We can imagine interpreting this diagram, for instance, in a monoidal category (since the wires do not cross: there is an ordering on the inputs which is not violated), subject to the requirement that certain objects be dualizable (since certain arrows are reversed).

The perspective of the paper is somewhat different: we can interpret this diagram as an operation in a certain *operad of wiring diagrams*.
We can compose these operations by pasting wiring diagrams inside each other.
The *colors* of this operad are the various possible input/output signatures of a box.
If we augment the operad by labeling each arrow with an object of $\cC$, a monoidal, fully dualizable category gives rise to an algebra, where the color corresponding to input $X_1, \dots X_n$ and output $Y_1, \dots Y_m$ is sent to the set of functions $X_1 \tensor \cdots \tensor X_m \to Y_1 \tensor \cdots \tensor Y_m$, and the wiring diagrams act in exactly the expected way.[^1]

[^1]: This perspective is also developed in [@FS18HypergraphCats], for *hypergraph categories*

Note that "wiring diagram algebras" are almost categories, since the wiring diagram with two boxes in sequence gives a composition.
However, the models considered in the paper lack identities - the reason for this is that there is no identity open dynamical system.
Hence the extra generality of the wiring diagram approach seems to be really necessary.

::: Definition :::

Given a category $\cC$, we let $\mathbf{TFS}_\cC$ denote the category of *$\cC$-typed finite sets*, i.e finite sets equipped with a map to $\mathrm{ob} \cC$.
(note that this does not involve the category structure of $\cC$)

Note that this category has finite coproducts. Moreover, any functor $\cC \to \cD$ induces a functor
$\mathbf{TFS}_\cC \to \mathbf{TFS}_\cD$ by composing with the action of the functor on objects.
Equipping $\mathbf{TFS}_\cC$ with the coCartesian monoidal structure, we construct a functor
$\mathbf{TFS}_{(-)}: \mathbf{Cat} \to \mathbf{SMC}$, from the category of categories to the category of symmetric monoidal categories and strong symmetric monoidal functors.

Suppose $\cC$ has finite products. Given $(X,\tau) \in \mathbf{TFS}_\cC$, we can form the product
$\prod_{x\in X} \tau(x) =: \hat{X}$.

This construction gives a functor $\hat{(-)}: \mathbf{TFS}_\cC \to \cC$.
:::

In fact, more is true: if we let $\mathbf{FPCat}$ denote the category of categories with finite products and functors that preserve them, we obtain a "pseudonatural transformation":

```tikzcd
& \mathbf{Cat} \ar[rd, bend left=30] & \\
\mathbf{FPCat} \ar[rr, draw=none, bend left=60, ""{name=U,above}] \ar[rr, bend right=60, ""{name=D, below}], \ar[ru, bend left=30]& & \mathbf{SMC}\ar[from=U, to=D, "\hat{(-)}", shorten <=10pt,shorten >=10pt, Rightarrow]
```

By "pseudonatural transformation", we mean that the functors we are looking at are 2-functors between 2-categories. It seems to me that they are not automatically strict - the functor $\mathbf{FPCat} \to \mathbf{SMC}$ seems to rely on a choice of products, which smells like the sort of thing that makes things non-strict.
But my thinking on this area is a bit imprecise.
Anyways, the point is that given a finite product-preserving functor $\cC \to \cD$, the square

```tikzcd
\mathbf{TFS}_{\cC} \ar[r, "\hat{(-)}"] \ar[d, "f \circ -"] & \cC \ar[d] \\
\mathbf{TFS}_{\cD} \ar[r, "\hat{(-)}"] & \cD
```

commutes only up to natural isomorphism.

::: Definition :::
A $\cC$-labeled box consists of a pair $X = (X^{in}, X^{out}) \in \mathbf{TFS}_\cC \times \mathbf{TFS}_\cC$.
:::

We picture this box as a diagram like so:

![A labeled box](/images/SSV16-box.png)

$X^{in} = (a_1, \dots a_m)$ is a set of *input ports*, $X^{out} = (b_1 \dots b_n)$ is a set of output ports.
Each port is labeled with an object of $\cC$, which we think of as characterizing the permitted values along that wire.

::: Definition :::
A morphism $\phi: X \to Y$ consists of two maps:

- $\phi^{in}: X^{in} \to X^{out} + Y^{in}$
- $\phi^{out}: Y^{out} \to X^{out}$
:::
We think of this morphism as a specified way of wiring up $X$ inside $Y$.
For instance:

![A morphism of boxes](/images/SSV16-morphism.png)

Here we allow "loopy" or "tracelike" behaviour, wiring $X$'s outputs to its inputs.
Note that we do not have "identities" - we are not allowed to wire the outputs of $Y$ directly to the inputs.
(But of course we do have an identity *morphism* $X \to X$.)
Note also that the maps are maps *in $\mathbf{TFS}_\cC$*, so they must preserve the labeling - an input port can only be mapped to an output port of the same "type".

Disjoint union of inputs and outputs gives this a symmetric monoidal structure, so that we have

::: Definition :::
The symmetric monoidal category $\cW_\cC$ is defined to have objects the $\cC$-labeled boxes, morphisms the morphisms described above, and symmetric monoidal structure given by disjoint union. We write this symmetric monoidal structure as $(\cW_\cC, \oplus,0)$.

:::

A functor $\cC \to \cD$ gives a strong symmetric monoidal functor $\cW_\cC \to \cW_\cD$, by applying $F$ to the labels.
This gives a functor $\cW_{(-)} : \mathbf{Cat} \to \mathbf{SMC}$.

## An enhanced perspective

Let us diverge from the paper a bit, and give a definition which takes into account the categorical structure of $\cC$, not merely the set of objects.

We replace $\mathbf{TFS}_\cC$ with the following category:

- An object of $\mathbf{FS}_{/\cC}$ is a finite set $X$ and a functor $\tau: X \to \cC$, viewing $X$ as a discrete category.[^equiv]
- A morphism $(\tau: X \to \cC) \to (\tau': Y \to \cC)$ consists of a functor (function) $f: X \to Y$ and a natural transformation $\alpha: \tau \to \tau' f$.

Concretely, a morphism from $(x_1, \dots x_m)$ to $(y_1, \dots y_n)$ is a function $X \to Y$ and, for each $x_i$, a map $\tau(x_i) \to \tau'(f(x_i))$.
So instead of requiring that types line up, we require a specified way of going from one type to another.

Note that we can also form $\mathbf{FS}_{/\cC^{op}}$ - this has the same objects different morphisms - the maps i $\cC$ need to go the other direction.
Note that this distinction did not exist for $\mathbf{TFS}_\cC$.

In any case, we may form our $\tilde{\cW}_\cC$ in the same way as before, only requiring morphisms $X^{in} \to Y^{in} + X^{out}$ and $Y^{out} \to X^{out}$ in $\mathbf{FS}_{/\cC^{op}}$. This corresponds to a wiring diagram where each wire is labeled with a morphism from $\cC$, so that types line up.
(The $op$ in this definition is necessary to make the arrows go the expected way, from the input of $Y$ to the input of $X$, and the output of $X$ to the output of $Y$.

## Further on $\cW_\cC$

::: Definition :::
A $\cW_\cC$-algebra is a lax symmetric monoidal functor $A: \cW_\cC \to (\mathbf{Cat}, \times)$.
:::

Given a box $X$, we call the objects of $A(X)$ the *inhabitants* of the box. They are "the systems that fit in the box".

Given a morphism $F: X_1 \oplus \cdots \oplus X_n \to Y$ in $\cW_\cC$, we get a functor
$A(X_1) \times \cdots \times A(X_n) \to A(X_1 \oplus \cdots \oplus X_n) \to A(Y)$, using the lax structure and the functor, which tells us how to combine inhabitants of the smaller boxes, using the wiring diagram, to get an inhabitant of the larger box.

Note that if $\cC$ has products, we can apply $\hat{(-)}$ from before, collapsing the input/outputs of a box to single objects.
We call this thing $\hat{X} = (\hat{X^{in}, \hat{X^{out}}}) \in \cC \times \cC$.

Using the contravariance of $\hat{(-)}$, we can turn a morphism $\phi: X \to Y$ into
\[\hat{\phi^{in}}: \hat{Y^{in}} \times \hat{X^{out}} \to \hat{X^{in}\]
\[\hat{\phi^{out}}: \hat{X^{out}} \to \hat{Y^{out}}\]

We can assemble this type of data into a category $\overline{\cW_\cC}$, where objects are pairs in $\cC \times \cC$,
and morphisms have this form.
$\hat{(-)}$ gives a natural functor $\cW_\cC \to \overline{\cW_\cC}$.
Some natural examples of $\cW_\cC$ algebras arise by composition with this functor.
This perspective says: a box is given by just one input and output type.
To wire boxes together, I want a map from the output of the inner box(es) to the output of the outer box, and a map from the output of the inner box and the input of the outer box, to the input of the inner box.

Note that this $\overline{\cW_\cC}$ really does include the arrows of $\cC$.
In that sense, it is closer to my $\cW_\cC'$, which is a sort of intermediate step.

Also note that in a sense the wiring diagrams of $\overline{\cW_\cC}$ are more general than those of $\cW_\cC$,
since they include arbitrary morphisms in $\cC$. On the other hand, it seems some structure relating to how products fit together has been lost.
What I want to say is that this is "the right direction". If you can provide a semantics for this larger class of less-rich wiring diagrams, then you can also provide a semantics for the smaller, richer class (by ignoring the semantics you defined for diagrams outside the class, and forgetting the structure you didn't use).

Here the authors note that there is a resemblance between the morphisms of $\overline{\cW_\cC}$ and compositional game theory/lenses.

I remark that for $\cC$ with limits, we have a $\cW_\cC$-algebra of *spans*, not of cospans.
Unsure how this relates to Fong's work -- although of course you can get back by dualizing $\cC$, and since the output is sort of direction-insensitive anyways...

## Dynamical systems

::: Definition :::

Let $A,B$ be sets. A *discrete dynamical system* with input set $A$, output set $B$, consists of

- A state set $X$
- An *update* function $f^{upd}: A \times X \to X$
- A *readout* function $f^{rd}: X \to B$

Let $A,B$ be Euclidean spaces. A *continuous dynamical system* with input $A$, output $B$, consists of

- A Euclidean state space $X$
- A smooth *dynamics* function $f^{dyn}: A \times X \to TX$[^inv]
- A smooth *readout* function $f^{rd}: X \to B$.

[^inv]: Our dynamical systems are time-invariant.

Here a Euclidean space is $\bR^n$ for some $n$,
and these functions are supposed to be smooth.
Moreover we must have $f^{dyn}(a,x) = (x,v)$ for some $v$ - the dynamics function gives a tangent vector at the current position.
The dynamics function is just an ODE parameterized by $A$.
:::

Now we see why there are no identity dynamical systems - the input affects the dynamics, but not (directly) the output.
It seems this may be worth comparing this to the "dynamics" of a learning agent.

Both these cases give rise to $\overline{\cW_\cC}$-algebras, for $\cC = \mathbf{Set}$ and $\cC = \mathbf{Euc}$[^euc] respectively, and hence to $\cW_\mathbf{Set}$ and $\cW_\mathbf{Euc}$-algebras.

[^euc]: $\mathbf{Euc}$ is the category of euclidean spaces and smooth maps.

::: Proposition :::

For each $\epsilon > 0$, we have an algebra map

```tikzcd
\cW_\mathbf{Euc} \ar[dd] \ar[rd, ""{name=U}] & \\
  & \mathbf{Cat} \\
\cW_\mathbf{Set} \ar[ru, ""{name=D}] \ar[from=U, to=D, Rightarrow, shorten <= 10pt, shorten >= 10pt, "\alpha_\epsilon"] &
```

where the vertical functor is induced from the underlying set functor $\mathbf{Euc} \to \mathbf{Set}$.

$\alpha_\epsilon$ is given on a dynamical system by Euler's method with step size $\epsilon$.

:::

This is actually a strong statement: it says if you have a dynamical system built by wiring together a bunch of smaller ones, you can discretize each of the small ones and wire them together, and it will give you the correct discretization of the big one.

## Interval sheaves

::: Definition :::

$Int$ is the category with

- Objects nonnegative real numbers $a$
- Morphisms $a \to b$ nonnegative real numbers $t$ such that $a + t \leq b$. We write this morphism $Tr_t$

Note that $Int$ is (isomorphic to) the skeleton of the category with objects closed intervals $[a,a']$, and morphisms linear isometries, i.e translations which map $[a,a']$ into $[b,b']$.
(We may take, for instance, the intervals of the form $[0,a]$).

$Int_N$ is the category with

- Objects natural numbers $n$
- Morphisms $m \to n$ natural numbers $t$ with $m + t \leq n, written $Tr_t$

We equip $Int$ with the Grothendieck topology generated by the coverings $\{Tr_0: p \to l, Tr_p (l-p) \to l\}$ (corresponding to the cover by the subintervals $[0,p], [p,l]$.
(This generates exactly the notion of covering you expect. )

We equip $Int_N$ with the similar topology.

We refer to the sheaves on $Int$ as *continuous interval sheaves*, and the topos of them as $\widetilde{Int}$,
similarly the topos $\widetilde{Int_N}$ of discrete interval sheaves.
:::

Note that a discrete interval sheaf $A$ can be identified with a directed graph(a quiver):

- The vertices are $A(0)$ (the possible behaviours at a point in time - "the states")
- The edges are $A(1)$ (the possible behaviours during a step - "the dynamics")[^dynlang]
- The two inclusion $Tr_0,Tr_1: 0 \to 1$ give the source/target maps.

[^dynlang]: My use of dynamics language suggests an analogy, but it is imperfect - there is no guarantee that each vertex has exactly one edge leaving it, as would be true in a dynamic system.

This gives an equivalence of categories.

## Machines

Let us work for now with $Int$, noting that we could have worked the discrete case as well.

::: Definition :::
Let $A,B$ be continuous interval sheaves. A *continuous machine* with input $A$ and output $B$ is a span

```tikzcd
& S \ar[rd] \ar[ld] &\\
A& & B
```

in $\widetilde{Int}$.
:::


We think of $S$ as associating to an interval $[a,b]$ the set of possible behaviour during that interval, including the received input and the produced output (which must be of the correct type for that time interval, specified by $A$ and $B$).

Now the composition is just composition of spans, i.e pullback.
So given $A \from S \to B$ and $B \from S' \to C$, their composition has behavious $S \times_B S'$.
In other words, those behaviours of the two individual machines where the input of the second matches the output of the first!

I want to see if I can guess, roughly, the "Open dynamical system $\to$ machine" translation, before reading that section of the paper.
My guess is this:

Given a euclidean space $A$, the associated interval sheaf associates to an interval the set of smooth maps $[0,t] \to A$.
Given an open dynamical system with input $A$, output $B$ and state space $M$, we construct an interval sheas $S$, where
$S([0,t])$ is the set of maps $a,m: [0,t] \to A \times M, such that $m'(t) = f^{dyn}(a(t),m(t))$ - i.e, the set of paths through input/output/state space so that the path in state space obeys the dynamics.
This has maps to the interval sheaves associated to $A$ and $B$, namely $(a,m) \mapsto a$ and $(a,m) \mapsto f^{rd}m$.

I was almost right.
First, there is a subtlety in associating interval sheaves to manifolds: you cannot glue smooth maps along closed sets.
So you need to consider the set $\{(\epsilon, f) \mid \epsilon > 0, f: (-\epsilon, t+\epsilon) : A\}$.

## Synchronicity

::: Proposition :::

The obvious inclusion $Int_N \to Int$ preserves covering families.

This induces a functor $\Delta_i: \widetilde{Int} \to \widetilde{Int_N}$.
By formal nonsense, $\Delta_i$ admits a left adjoint, $\Sigma_i$

:::

$\Sigma_i$ does not preserve the terminal object, so this adjunction fails to be a geometric morphism.


::: Propositon :::

For $X \in \widetilde{Int_N}$, there is an isomorphism

$\Sigma_iX(\ell) \cong \bigcup_{r \in [0,1)} X(\ceil{\ell + r})$

:::

We think of this as adding a *phase* to the behaviour of $X$.
A "behaviour" of $\Sigma_iX$ on $[0,\ell]$ consists of a phase $r \in [0,1)$, and a behaviour of $X$ on $[0,\ceil{\ell + r}]$ - i.e a sequence of that length in the graph corresponding to $X$.

We can imagine the adjunction by thinking about a "universal clock", ticking once per unit of time (at $t=0, 1, 2 \dots$).
A "state" of $\Sigma_iX$, i.e an element in $\Sigma_iX(0)$ consists of the time $r$, measuring "how much time has passed since the last tick"?
And, if $r>0$, an edge in $X$ (which we think of as a graph), denoting the transition which "is" taking place during this tick of the clock.

In general, a behaviour on $[0,t]$ tells you the phase of the clock (what was the time at $t=0$), and for each interval of "clock time" intersected by $[0,t]$ a transition.
The clock marks the points where you "are standing on a vertex" - when the clock is not at an integer, you are "standing on an edge", which you need to specify.

::: Proposition :::

The adjunction $\Sigma_i \lvert \Delta_i$ factors through a geometric morphism

$\Sigma_i' : \widetilde{Int_N} \xrightleftharpoons \widetilde{Int}_{/Sync} : \Delta_i'$

Here $Sync = \Sigma_i(*)$.

Moreover, the left adjoint $\Sigma_i'$ is fully faithful.

:::

We observe that $Sync(t) = [0,1)$, with translation functors given by adding and reducing modulo $1$.
We think of the map $A \to Sync$ as assigning a clock phase in the above sense to each behaviour of $A$.
We call these sheaves over $Sync$ *Synchronous sheaves*.

The point is that these gives a common framework for comparing continuous and discrete behavior - $\widetilde{Int}$ has the obvious functor
$X \mapsto X \times Sync$ into $\widetilde{Int}_{/Sync}$.


## Determinism and totality

We want to define two notions of regularity of machines

- A machine is *deterministic* if, given an input section("behavior") on $[0,\ell]$ , and an initial state germ ("state") compatible with it, there is at most one extension of this state to a section on $[0,\ell]$ (the behavior is determined by the input).
- It is total if there is at least one (the machine always runs).

It turns out these definitions are slightly bad, for the following reason:
consider the interval sheaf $C = \Hom(-,\{0,1\})$ of functions into the set $\{0,1\}$ (no requirements).
And consider the identity machine $C \from C \to C$. Clearly it is deterministic and total.

If we wire the output and input of this machine together, we get a machine $1 \from C \to 1$.
However, this machine is not deterministic (although it is total) - intuitively, given an initial state, the state is allowed to jump between $0$ and one at any time.

This seems to be why the identity dynamical systems can't work out.

The solution is to require that the behaviour of a machine determines the output, not just at that time, but a small time into the future - $\epsilon$-intertiality is the term for this.

It is worth noting that these properties do not in general hold for machines coming from continuous dynamical systems - since such systems can experience continuous-time blowup and nondeterminism.

## Discrete Conduche Fibrations

There is a construction equivalent to interval sheaves, called *discrete Conduche fibrations*.
We think of an interval sheaf as a category, where each behaviour is a morphism, the objects are behaviours of length zero, and composition is given by gluing.
This category comes equipped with a "length" functor into $(\bR_{\geq 0},+,0)$ or $(\bN_0, +, 0)$ viewed as one-object categories.

::: Definition :::
Given a category $\cC$, we let $\cC_0,\cC_1,\cC_2$ be the sets of objects, morphisms, and composable pairs, respectively.

These have the obvious structure maps between them - we single out $\circ: \cC_2 \to \cC_1$ as the map sending a composable pair to the composite.

A functor $\cC \to \cD$ is a *discrete Conduche fibration* if the diagram[^F]

```tikzcd
\cC_2 \ar[d,"F"] \ar["\circ"] & \cC_1\ar[d, "F"]\\
\cD_2 \ar[r, "\circ"] & \cD_1
```

is Cartesian (i.e. a pullback).
:::


[^F]: Here the arrows labeled "F" are just the maps induced by the functor.

In other words, given a map $f: x \to y$ in $\cC$, and a factorization $a \circ b = F(f)$, there is a unique pullback of this factorization to a factorization of $F$.

We see that the above-described categories corresponding to interval sheaves have this property: given a behavior of length $\ell$, and a partition $\ell = a + b$, we have a unique splitting of our behavior into a behavior of length $a$ and one of length $b$.
Moreover, this is all we need.

This is all developed in higher generality in a paper by Lavwere.

It seems that the idea being captured by the discrete Conduche fibrations is the idea that behaviours can be *split up*, decomposed - and the base category tells you how this can be done.

This is of course very closely related to how a site/topos is about *gluing*.

SSV: "Categories emphasize composition, and adding the Conduché condition enforces that
morphisms can be factorized. Conversely, presheaves emphasize restriction, and adding
the sheaf condition enforces that sections can be glued."

## To do

- More about the various functors.
- More about total and deterministic machines.
- Wiring diagram semantics for machines
  

### Flashcards
- Definitions of the wiring diagram operad.
- Definitions of machine (a very general machine is just a span in a topos.. is this an idea?), total, deterministic
- What does it mean that (Euler's method is a $\cW_\cC$-algebra homomorphism?) (That you can do Euler's method to small open systems, compose them, and get the right result)