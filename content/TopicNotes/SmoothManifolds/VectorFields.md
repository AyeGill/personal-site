Vector Fields
-------------

A *vector field* of a smooth manifold $M$ is a section of the tangent
bundle. It is smooth if the section is smooth.

If $Y$ is a vector field we typically write $Y_p$ rather than $Y(p)$, so
that we can write $Y_p(f)$ rather than $Y(p)(f)$.

The set of smooth vector fields on $M$ is denoted $\cl{T}(M)$. It's an
$\R$-vector space in an obvious way. Moreover, it's actually a module
over $C^\infty(M)$ - merely put $(fY)_p = f(p)Y_p$.

If $F: M \to N$ is smooth, and $Y\in \cl{T}N, X \in \cl{T}M$, we say
that $Y$ and $X$ are $F$-related if $Y_{F(p)} = F_*(X_p)$. Note that
there is not necessarily any vector field on $N$ $F$-related to $X$, and
it may not be unique.

However, if $F$ is a diffeomorphism, this does define a $1$-to-$1$
correspodence between $\cl{T}M$ and $\cl{T}N$ (as we would expect).
