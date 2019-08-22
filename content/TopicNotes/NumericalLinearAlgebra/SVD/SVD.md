Singular Value Decomposition
============================

This is taken from [@NumLinAlg].

The singular value decomposition
`\index{Singular Value Decomposition}`{=latex} (SVD) is the matrix
factorization $$A=U\Sigma V^*
\label{eq:NLA:SVD}$$ where $$\begin{array}{ll}
U\in\BBC^{m\times m}& \text{is unitary,}\\
V\in\BBC^{m\times n}& \text{is unitary,}\\
\Sigma\in\BBR^{m\times n} &\text{is diagonal.}
\end{array}$$

### Algorithm

This algorithm was chosen for simplicity. It is not as efficient as
Golub-Kahan Bidiagonalization, but it is dead simple to implement after
the Hessenberg Factorization and QR Factorization have been implemented.
This will actually solve for the eigenvalues of a symmetric matrix, but
I am exploiting the fact that the SVD of symmetric positive definite
matrix is $U\Sigma U^*$, and that all symmetric matrices can be factored
into $X\Lambda X^{*}$ with $\Lambda$ being a diagonal matrix with
positive entries and $X$ being unitary.

$\mu$, the shift, and $\varepsilon$, iteration error.

$[\Sigma,Q_H]=$HessenbergFactorization$(A)$ $M=\mu I$, $V=I$
$\displaystyle \gamma_0=\sum_{i=1}^{m-1} \Sigma_{i,i+1}^2$
$[Q,R]=$QR-Factorization$(\Sigma-M)$ $\Sigma=RQ+M$
$\displaystyle \gamma_1=\sum_{i=1}^{m-1} \Sigma_{i,i+1}^2$ $V=VQ$
$Error=|\gamma_1-\gamma_0|$ $\gamma_1\rightarrow \gamma_0$

May recover the true SVD by taking the SVD of $A^* A$, then
$U=A*V*\Sigma^{1/2}$

### Theorems and Results

Every matrix $A\in\BBC^{m\times n}$ has a singular value decomposition
of the form $$A=U\Sigma V^*
\label{eq:NLA:SVD1}$$ $$\begin{array}{ll}
U\in\BBC^{m\times m}& \text{is unitary,}\\
V\in\BBC^{m\times n}& \text{is unitary,}\\
\Sigma\in\BBR^{m\times n} &\text{is diagonal.}
\end{array}$$ Furthermore, the singular values $\{\sigma_j\}$ are
uniquely determined, and, if $A$ is square and the $\sigma_j$ are
distinct, the left and right singular vectors $\{u_j\}$ and $\{v_j\}$
are uniquely determined up to complex signs (i.e., complex scalar
factors of absolute value 1).

To prove existence of the SVD, we isolate the direction of the largest
action of $A$, and then proceed by induction on the dimension of $A$.

Set $\sigma_1=||A||_2$. By a compactness argument, there must be vectors
$v_1\in\BBC^n$ and $u_1\in\BBC^m$ with $||v_1||=\|u_1\|=1$ and
$Av_1=\sigma u_1$. Consider any extensions of $v_1$ to an orthonormal
basis $\{v_j\}$ of $\BBC^n$ and of $u_1$ to an orthonormal basis
$\{u_j\}$ of $\BBC^m$, and let $U_1$ and $V_1$ denote the unitary
matrices with columns $u_j$ and $v_j$, resp. Then we have
$$U_1^*AV_1=S=\begin{bmatrix}
\sigma_1 & w^*\\
0 & B
\end{bmatrix},$$ where 0 is a column vector of dimension $m-1$, $w^*$ is
a row vector of dimension $n-1$, and $B$ has dimensions
$(m-1)\times (n-1)$. Furthermore, $$\left\|\begin{bmatrix}
\sigma_1 & w^*\\
0 & B
\end{bmatrix}\begin{bmatrix}
\sigma_1\\
w
\end{bmatrix}\right\|_2 \geq \sigma_1^2+w^*w=(\sigma_1^2+w^*w)^{1/2}\left\|\begin{bmatrix}
\sigma_1\\
w
\end{bmatrix}\right\|_2,$$ implying
$||S||_2\geq (\sigma_1^2+w^*w)^{1/2}.$ Since $U_1$ and $V_1$ are
unitary, we know that $||S||_2=||A||_2=\sigma_1$, so this implies $w=0$.

If $n=1$ or $m=1$, we are done. Otherwise, the submatrix $B$ describes
the action of $A$ on the subspace orthogonal to $v_1$. By the induction
hypothesis, $B$ has an SVD of $B=U_2\Sigma_2 V_2^*.$ Now it is easily
verified that $$A=U_1\begin{bmatrix}
1 & 0 \\ 0 & U_2
\end{bmatrix}\begin{bmatrix}
\sigma_1 & 0 \\ 0 & \Sigma_2
\end{bmatrix}\begin{bmatrix}
1 & 0 \\ 0 & V_2
\end{bmatrix}V_1^*$$ is an SVD of $A$, completing the proof of
existence.

For the uniqueness claim, the geometric justification is
straightforward: if the semiaxis lengths of a hyperellipse are distinct,
then the semiaxes themselves are determined by the geometry, up to
signs. Algebraically, we can argue as follows. First we note that
$\sigma_1$ is uniquely determined by the condition that it is equal to
$\|A\|_2$, as follows from
[\[eq:NLA:SVD\]](#eq:NLA:SVD){reference-type="eqref"
reference="eq:NLA:SVD"}. Now suppose that in addition to $v_1$, there is
another linearly independent vector $w$ with $\|w\|_2=1$ and
$\|Aw\|_2=\sigma_1$. Define a unit vector $v_2$, orthogonal to $v_1$, as
a linear combination of $v_1$ and $w$,
$$v_2=\frac{w-(v_1^*w)v_1}{\|w-(v_1^*w)v_1\|_2}.$$ Since
$\|A\|_2=\sigma_1$, $\|Av_2\|_2\leq\sigma_1$; but this must be an
equality, for otherwise, since $w=v_1c+v_2s$ for some constants $c$ and
$s$ with $|c|^2+|s|^2=1$, we would have $||Aw||_2<\sigma_1$. This vector
$v_2$ is a second right singular vector of $A$ corresponding to the
singular value $\sigma_1$; it will lead to the appearance of a vector
$y$ (equal to the last $n-1$ components of $V_1^*v_2$) with $||y||_2=1$
and $\|By\|_2=\sigma_1$. We conclude that, if the singular vector $v_1$
is not unique, then the corresponding singular value $\sigma_1$ is not
simple. To complete the uniqueness proof we note that, as indicated
above, once $\sigma_1$, $v_1$, and $u_1$ are determined, the remainder
of the SVD is determined by the action of $A$ on the space orthogonal to
$v_1$. Since $v_1$ is unique up to sign, this orthogonal space is
uniquely defined, and the uniqueness of the remaining singular values
and vectors now follows by induction.
