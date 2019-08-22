Algebraic Topology - Common Theorems
====================================

Homology
--------

A *reduced homology theory* is a sequence of functors
$\tilde{h}_i : {\rm Top} \to {\rm Ab}$, satisfying

-   *Homotopy invariance*: if $f,g : X \to Y$ are homotopic, then
    $\tilde{h}_i(f) = \tilde{h}_i(g)$, for all $i$.

-   For each CW pair $A \subset X$ (more generally, good inclusion or
    cofibration), there is a map
    $\delta \tilde{h}_n(X/A) \to \tilde{h}_{n-1}(A)$, fitting into a
    long exact sequence like
    $$\dots \to \tilde{h}_n(A) \to \tilde{h}_n(X) \to \tilde{h}_n(X/A) \to \tilde{h}_{n-1}(A) \to \dots$$
    Also, this is natural in maps of pairs.

-   For a wedge sum $X = \vee_\alpha X_\alpha$, with inclusions
    $i_\alpha : X_\alpha \to X$, the induced
    $$\oplus i_\alpha : \oplus \tilde{h}_n(X_\alpha) \to \tilde{h}_n(X)$$
    is an isomorphism for each $n$.

A *Homology theory* is a sequence of functors
$h_i : {\rm Top}^2 \to {\rm Ab}$, satisfying

-   *Homotopy invariance*: if $f,g : (X,A) \to (Y,B)$ are homotopic
    (through such maps), then $h_i(f) = h_i(g)$, for all $i$.

-   There is a natural transformation
    $\delta : h_n \Rightarrow ((X,A) \mapsto h_{n-1}(A,\emptyset))$,
    with components fitting into a long exact sequence like
    $$\dots \to h_n(A) \to h_n(X) \to h_n(X,A) \to h_{n-1}(A) \to \dots$$

-   *Excision* : $h_n(X,A) = h_n(X/A, *)$ for a CW pair $(X,A)$.

-   For a disjoint union $X = \coprod_\alpha X_\alpha$, with inclusions
    $i_\alpha : X_\alpha \to X$, the induced
    $$\oplus i_\alpha : \oplus h_n(X_\alpha) \to h_n(X)$$ is an
    isomorphism for each $n$.

(Reduced) singular homology is a (reduced) homology theory.

For any space $X$ and abelian group $G$, there is a short exact sequence
$$0 \to {\rm Ext}(H_{n-1}(X),G) \to H^n(X;G) \to Hom(H_n(X), G)$$ This
is natural, and split, although the splitting is not natural.

Also, there is a short exact sequence
$$0 \to H_n(X)\otimes G \to H_n(X;G) \to {\rm Tor}(H_{n-1}(X), G)\to 0$$
