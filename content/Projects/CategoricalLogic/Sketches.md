Sketches
========

\[Recall the definition of quiver, diagrams in a quiver, cones,
cocones\]

A *sketch* consists of the following data:

(a) A quiver $Q$

(b) A collection of diagrams in $Q$, $C$

(c) A collection of cones in $Q$, $L$.

(d) A collection of cocones in $Q$, $C$.

A *representation* of a sketch in a category $\cl{C}$ is a diagram
$d: Q \to \cl{C}$ so that each diagram in $C$ is mapped to a commutative
diagram, each cone in $L$ is mapped to a limit diagram, and each cocone
in $C$ is mapped to a colimit diagram.

Let $R$ be the sketch defined as follows:

The underlying quiver has three objects, $\ast, A, A^2, A^3$. It has the
maps \... required to encode the structure of a commutative ring on $A$,
and the fact that $A^2$ and $A^3$ are the products of $A$, and $\ast$ is
terminal.

Then a representation of $R$ in $\cl{C}$ is a commutative ring object in
$\cl{C}$.
