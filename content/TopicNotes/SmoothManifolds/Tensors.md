Tensors and Tensor fields
-------------------------

An $n$-tensor on a vector space $V$ over a field $k$ is an $n$-linear
map $V^n \to k$.

There is a natural $k$-vector space of $n$-tensors on $V$, denoted
$T^nV$.

The map $V^* \otimes V^* \cdots \otimes V^* \to T^nV$ sending
$\alpha_1 \otimes \alpha_2 \cdots \otimes \alpha_n$ to
$(V_i) \mapsto \prod_i\alpha_iV_i$ is an isomorphism of vector spaces.

Taking the above as an identification, we can define a bilinear map
$T^k \times T^l \to T^{k+l}$, denoted
$\sigma, \tau \mapsto \sigma \tensor \tau$, by defining it on elements
of the form
$(\sigma_1 \tensor \dots \tensor \sigma_k, \tau_1 \dots \tensor \tau_l)$
as $(\sigma_1 \dots \sigma_k \tensor \tau_1 \dots \tensor \tau_l)$.

This classifies a map $T^k \tensor T^l \to T^{k+l}$, which under the
above identification is just the identity.

If $M$ is a smooth manifold of dimension $n$ define the bundle of
(covariant) $k$-tensors on $M$ as the bundle of pairs
$(p\in M, \eta \in T^kT_p(M))$. Give it a smooth structure as as vector
bundle of rank $n^k$ in the usual way by lifting local charts. Define
also the real vector space (and $C^\infty-algebra$) $\cl{T}^k(M)$ of
smooth sections of $T^k$. These are called smooth $k$-tensor fields.
Given $F: M \to N$ smooth, there is an obvious pullback map
$\cl{T}^k(N) \to \cl{T}^k(M)$. This defines a contravariant function
$C^\infty Man \to Vec_\R$.

If $\sigma$ and $\tau$ are smooth tensor fields, so is (pointwise)
$\sigma \tensor \tau$.
