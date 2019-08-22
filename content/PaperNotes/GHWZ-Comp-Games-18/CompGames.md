Compositional Game Theory
=========================

Concerning [@GHWZ18]

Define a category of *open games*. The objects are pairs of sets
$(X,S)$, where, roughly speaking $X$ is *covariant* and $S$ is
*contravariant*. A morphism $\cG: (X,S) \to (Y,R)$ consists of the
following data:

1.  A set $\Sigma_\cG$ of *strategies*

2.  A map $P_\cG: \Sigma_\cG \times X \to Y$ called the *play function*.

3.  A map $C_\cG: \Sigma_\cG \times X \times R \to S$ called the
    *coplay* function.

4.  A map $B_\cG: X \times \Map(Y,R) \to \Rel(\Sigma_\cG)$ called the
    *best response* function.

Here $\Rel(\Sigma_\cG)$ denotes the set of endo-relations
$R \subset \Sigma_\cG \times \Sigma_\cG$.

Consider some examples: An open game $(1,1) \to (1,1)$ is simply a set
of strategies and a relation on this set.

An open game $(1,1) \to (Y,R)$ consist of: a set of strategies, a map
assigning to each strategy an "outcome" $y\in Y$, and, given a map from
outcomes to $R$, a relation on the set of strategies.

We think of $R$ as the set of utilities, i.e the part of the outcome
that we care about, and given a "utility function $Y \to R$", the
relation on $\Sigma_\cG$ should be interpreted as "best response" - i.e,
given a function which tells you which outcomes are desirable, which
strategies are optimal responses to strategy $s$? Here $X$ is some sort
of environment which modify the outcomes of each strategy, and hence
also which strategies are optimal. The coplay function passes a utility
value backwards, $S$ being the utility set of a different game, in some
sense.

We adapt an example from the paper: Suppose you want to order an
expensive bottle of wine. You are going to contract a wine specialist to
track down and buy this bottle for you. This can be modelled as a game
$(1,1) \to (Y,R)$

The set $\Sigma_\cG = Y$ consist of the various lists of instructions
you could give the specialist - possible descriptions of your tastes,
their budget, how big a commission to offer them, and so on. The set $R$
consists of the bottles of wine you might get back. The play function is
just the obvious thing $1 \times Y \to Y$. The best-response function
should simply, given an assignment of strategies to wine bottles, pick
out the optimal strategy (it is supposed that there is some total order
on wine bottles).

Describe composition of open games, $\cH \circ \cG$, where
$\cG : (X,S) \to (Y,R), \cH: (Y,R) \to (Z,T)$

1.  The strategy set $\Sigma_{\cH \circ \cG}$ is just the Cartesian
    product $\Sigma_{\cH}\times \Sigma_\cG$

2.  The play function
    $P_{\cH \circ \cG}((\tau,\sigma), x) = P_\cH(\tau, P_\cG(\sigma, x))$

3.  The coplay function
    $C_{\cH \circ \cG}((\tau,\sigma),x,t) = C_\cG(\sigma, x, C_\cH(\tau, P_\cG(\sigma, x),t))$

4.  The best response relation is given by
    $(\tau,\sigma),(\tau',\sigma') \in B_{\cH \circ \cG}(x,k)$ if and
    only if $\tau, \tau' \in B_{\cH}(P_\cG(\sigma,x),k)$ and
    $\sigma,\sigma' \in B_{\cH}(x,k')$, where
    $k'(y) = C_\cH(\tau,y,k(P_\cH(\tau,y)))$

This captures the intutition that: a stategy for the composed game
consists of picking a strategy for each game. To find the outcome $z$
associated to a context $x$, simply play each strategy in turn. Given a
utility $t\in T$, to find the coutility $s\in S$, first play the context
$x \in X$ using $\sigma$ to find the context for $\cH$, then use the
coplay function of $\cH$ to find $r \in R$, then coplay $\cG$ to find
$s$. The best response relation captures the idea that $(\tau',\sigma')$
dominates if $\tau'$ is optimal assuming all players in the first game
play $\sigma$ and all other players in the second game play $\tau'$, and
$\sigma'$ is optimal assuming all players in the second game play $\tau$
and all other players in the first game play $\sigma$.

This is a slightly weird notion of optimality - it says that each of the
two possible switches is optimal, but only independently - the second
switch may not be optimal after the first has been done.

Special open games
------------------

Given a function $X \to Y$, there is an obvious open game
$(X,1) \to (Y,1)$ with singleton strategy set. Similarly, given
$R \to S$, there is an obvious open game $(1,S) \to (1,R)$.

We can give open games a monoidal structure where
$(X,S) \tensor (Y,R) = (X\times Y, S \times R)$. This gives rise to a
very neat string diagram notation - see the paper.

There is an open game $(X,X) \to (1,1)$, with singleton strategy set,
with the identity as the coplay function. This lets us build "loopy"
constructions - but note that there is no trivial-strategy game
$(1,1) \to (X,X)$, so we do not have arrows going the other direction.

There is, however, a game $(1,1) \to (X,X)$ with strategy set $X$, the
obvious coplay function, and where the best response to $x\in X$ given
$f: X \to X$ is $f(x)$. Not sure whether this has interest.

We also mark the special class of games called *utility-maximizing
decisions*. A utility-maximizing decision $\cD: (X,1) \to (Y,\bR)$ is an
open game with

-   $\Sigma_\cD = \Map(X,Y)$

-   $P_\cD(\sigma,x) = \sigma(x)$

-   Coplay is trivial

-   $(\sigma,\sigma') \in B_\cD(x,k)$ iff $\sigma'(x) \in \argmax(k)$

Flashcard ideas
---------------

Definition of open game, including composition. String diagram for
simultaneous-move game?
