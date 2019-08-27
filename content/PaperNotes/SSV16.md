---
title: Dynamical Systems and Sheaves
date: 2019-08-27
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

Note that "wiring diagram algebras" are also categories, since there is a given wiring diagram with two boxes next to each other (giving composition), and a wiring diagram which is just a wire, giving identities. It may be possible to prove some sort of coherence theorem stating that they are equivalent.


