Line Integrals
--------------

A curve segment in a smooth manifold is a map $\gamma: [a,b] \to M$. It
is a smooth curve segment if it admits a smooth extension to an open set
containing $[a,b]$. A piecewise smooth curve segment has the obvious
definition.

If $M$ is a connected smooth manifold, any two points can be joined by a
piecewise smooth curve segment.

If $\omega$ is a smooth covector field on $[a,b]$, it has the form
$f(t)dt$ for some smooth function $f(t)$. We then define
$\int_{[a,b]}\omega = \int_a^b f(t)dt$

If $\omega$ is a smooth covector field on $M$, and $\gamma: [a,b] \to M$
is a smooth curve segment, we define
$$\int_gamma \omega = \int_[a,b]\gamma^* \omega$$

Extend this definition to piecewise smooth curve segments in the natural
way.

Suppose $\gamma:[a,b] \to M$ is a piecewise smooth curve segment, and
$\omega, \omega_1, \omega_2 \in \cl{T}^*(M)$

(a) $\int_\gamma(c_1\omega_1 + c_2\omega_2) = c_1\int_\gamma \omega_1 + c_2 \int_\gamma \omega_2$

(b) If $\gamma$ is constant, $\int_\gamma \omega = 0$.

(c) If $a < c < b$, then
    $\int_{\gamma|_{[a,c]}}\omega + \int_{\gamma|_{[c,b]}} \omega = \int_\gamma\omega$

(d) $$\int_\gamma\omega = \int_a^b \omega_{\gamma(t)}(\gamma'(t))dt$$
    where the right-hand integral is a normal Riemann integral,
    $\omega_p$ is the covector at the point $p$, and $\gamma'(t)$ is the
    tangent of $\gamma$ at time $t$

The last equation would also serve as a definition of the line integral.

$\int_\gamma df = f(\gamma(b)) - f(\gamma(a))$

This is an immediate consequence of (d) above and the fundamental
theorem of calculus.
