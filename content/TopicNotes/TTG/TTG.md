Tensor-Triangulated Geometry
============================

The basic idea is to study "Tensor-triangulated" categories, i.e
symmetric monoidal triangulated categories where $\tensor$ is exact.
This is done by means of the *spectrum*, which is a locally ringed space
derived from the category in this way:

1.  The points are *thick prime $\tensor$-ideals*.

2.  For each $a \in \cl{C}$, the set $supp(a) := \{P \mid a \notin P\}$
    is closed, and this is a basis of closed sets.

This space, $Spc(\cl{C})$, can be characterized as the *universal
support datum*, in the following sense:

Let $\cl{C}$ be tensor-triangulated. Then a *support datum* for $\cl{C}$
consists of a topological space $X$, and an assigment from the objects
of $\cl{C}$ to closed subsets of $X$, which we denote
$a \mapsto supp(a)$, satisfying:

(a) $supp 0 = \emptyset, supp \mathbb{1} = X$.

(b) $supp (A \oplus B) = supp(A) \cup supp(B)$.

(c) $supp (\Sigma A) = supp(A)$.

(d) Whenever $A \to B \to C$ is a triangle,
    $supp C \subset supp A \cup supp B$.

(e) $supp(A \tensor B) = supp A \cap supp B$.

Any essentially small tensor-triangulated category has a final support
datum, denoted $Spc(\cl{C})$, which is precisely what we defined above.

We should view a tensor-triangulated category as the shadow of a
symmetric monoidal stable , with $\tensor$ exact in both variables (i.e.
preserving finite limits and colimits).

We might attempt to characterize the lattice of open sets of
$Spc(\cl{C})$, rather than the space itself. There is a basis of such
open sets given by $U(a) = Spc(\cl{C}) \setminus supp(a)$ for each
object $a$. We may want to consider the lattice of thick
$\tensor$-ideals? Answer: These correspond to *Thomason* subsets, open
subsets in the *dual* topology (see [@BalmerTTG]).

These ideas lead to a sheaf of stable on the spectrum, where
$\cl{C}_{Spc} = \cl{C}$. Possibly we should view various constructions
as geometric in this setting - e.g. recollement in chromatic homotopy
theory.

A recollement of a stable $\cl{C}$ is determined by the reflexive
subcategory $\cl{C}_1 \subset \cl{C}$, since $\cl{C}_0$ is precisely the
collection of objects with $L_1(X) = \ast$. In this case, we want to
view $\cl{C}_1$ and $\cl{C}_0$ as being given by complementary subsets
of $Spc(\cl{C})$, where $\cl{C}_0$ corresponds to the closed subset,
$\cl{C}_1$ to the open.

Then probably $Z = supp(L_0 \mathbf{1})$, since

$$supp(L_0X) = supp(L_0 (X \tensor \mathbf{1})) =supp(L_0 X \tensor L_= \mathbf{1}) = supp(L_0 X) \cap supp(L_0 \mathbf{1})$$
