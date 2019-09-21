---
title: Open Agents
date: 2019-09-05
tags: AI, Questions
---

This is about a variation on Hedges' *open games*.

::: Definition :::
An *open agent* $\cG: (X,S) \to (Y,R)$ consists of

- A set $\Sigma_\cG$ of *strategies*
- An *implementation* map $i_\cG: \Sigma_\cG \times X \to Y$
- A *consequence* map $c_\cG: \Sigma_\cG \times X \times R \to S$
- And an *update* map $u_\cG: \Sigma_\cG \times X \times (Y \to R) \to \Sigma_\cG$

Given agents $\cG: (X,S) \to (Y,R), \cH (Y,R) \to (Z,T)$, their composite $\cG ; \cH$ is defined to have: [^semicolon]

[^semicolon]: I use $;$ throughout to denote flipped composition, i.e $f;g(x) = g(f(x))$.

- Strategy set $\Sigma_{\cG;\cH} := \Sigma_\cG \times \Sigma_\cH$
- Implementation map $i_{\cG;\cH} := i_\cG ; i_\cH$
- Consequence map $c_{\cG;\cH}(\sigma_g,\sigma_h,x,t) = c_\cG(\sigma_g,x,c_\cH(\sigma_h,i_\cG(\sigma_g,x),t))$
- Update map $u_{\cG;\cH}(\sigma_g,\sigma_h,x,k: Z \to T) = (u_\cG(\sigma_g,x,k'),u_\cH(\sigma_h,i_\cG(\sigma_g,x),k)_{\cG;\cH})$, where $k': Y \to R$
  is given by $k'(y) = c_\cH(\sigma_h,y,k(i_\cH(\sigma_h,y)))$

:::

Compare also Fong-Spivak-Tuyeras' "learners".

We think of such a thing as an agent which

- Makes observations from $X$ and takes decisions from $Y$
- Also produces consequences for other agents, from the set $S$.
- Given an observation and a function from action to "utilities", knows how to update its internal state.

So this is like an agent which is missing a utility function, and knowledge about how its actions affect it.[^vl]

[vl]: Connection to value *learning*?

A "proper" agent already has a way to update on information - an *open* agent needs to have some information filled in before it can do this.

It seems that agents of this type are doing *reinforcement learning* - they are responding at each step to a reward signal (in fact they are allowed as much information as they want about how outputs become rewards, so they could do something more sophisticated if desired).

Contrast this with more general supervised learning, where we can show an agent a lot of data at one time, and have it analyze it all at once, rather than having each input come one at a time.

This is also mainly the sense in which it makes sense to "plug agents into a game" - if we have a diagram corresponding to some situation, and fill in a box with a generic neural network, we'll get a learner which gradually changes its strategy to increase the reward signal.

## Compositional Generalization Bounds

Let a supervised learning algorithm $X \to Y$ be given, i.e a map $F: (X\times Y)^N \times X \to Y$ for all $N$.
Let us also suppose we have a loss function $L: Y\times Y \to Y$.

::: Definition :::

Given a dataset $D = ((x_i,y_i))$, the *empirical loss* is the average $\frac{1}{N}\sum_i L(F_D(x_i),y_i)$.
Given a probability distribution $P$ on $X\times Y$, we can also ask for the expected loss, i.e
$\bE_{P(x,y)}(L(F_D(x),y))$.

The *generalization error* is $\bE_{P(x,y)}(L(F_D(x),y)) - \frac{1}{N}\sum_i L(F_D(x_i),y_i)$. In other words, how badly have we failed at estimating the strength of our algorithm.

Finally, we can consider the *expected generalization error*, which is

$\bE_{P^{N+1}((x,y),(x_1,y_1), \dots, (x_n,y_n))}(L(F_D(x),y) - \frac{1}{N}\sum_i L(F_D(x_i),y_i))$.

I.e, if we pull the samples in $D$ from $p$, run our algorithm, then try it out on another sample, how much worse is it than it looked?

:::

It's worth noting at least one huge limitation of this approach to judging the usefulness of our algorithm: if whatever process decides which samples $(x,y)$ we will use it on in the future can depend on the state of our algorithm, the generalization bounds don't work (they assume all samples come from the same distribution).
Hence we can't use this to rule out *adversarial examples*: tailor-made points where our model fails. We can only say that they are rare "in nature".

But in general, it is hoped that we can bound the generalization error in terms of $N$, but *independent* of $P$.
In other words, if the background distribution is one where our algorithm sucks, maybe we will at least realize it sucks.[^calibration]

[^calibration]: We can sort of compare this to the discrimination/calibration distinction in forecasting. Here we are purely talking about something like calibration, which says that our algorithm won't make us overconfident. Of course, that provides no measure of how much actual *information* we get (i.e discrimination). So these bounds are more usefully thought of as a measure of overfitting, not general algorithm quality.

Given a learner in the sense of [@FST] $X \to Y$.
If $X,Y$ are metric spaces, we can say that loss is squared distance.
Then we can ask for the generalization error as a function of $N$.

If we try to make this functorial, is seems we will at most be able to get an inequality $Err(f;g) \leq Err(f) \star Err(g)$ for some operation $\star$.
Do we need preorder or order-enriched categories? A lax functor?

We can think of some sort of category of *probablistic relations*.

A normal relation, of the type coming from Spivak's work, is something like "if the input is $x$, then the output must be one of $y,z,w$".
We can picture this as being *built* out of primitive things like "if the input has property $P$, then the output will have property $Q$ AND if the input satisfies ...",
"the output is never further than $\epsilon$ from $f(\text{input})$"...
In other words, a Boolean Algebra-enriched category of relations. Then a machine goes to the maximal relation it satisfies.

Generalization bounds would be one type of probabilistic relations - augmented with a dependence on the number of training samples $N$.
Then we have statements like "The *expected distance* from the output to $y$ is never more than $\epsilon(N) + \dots$, for any distribution on $(\text{input},y)$.

A relation between $X$ and $Y$ is a monic span $R \into X \times Y$.
A stochastic map $R \to X \times Y$ is a probability distribution on $X \times Y$ parameterized by some space $R$.

Could try to generate a boolean algebra of "statements that can be true of learners $X \to Y$" - 
i.e given by generators and relations.

A relation between $Prob(X \times Y)$ and $Learn(X,Y)$?
We have a map $E: Prob(X \times Y) \times Learn(X,Y) \times \bN \to \bR_+$, called *expected generalization error*.
We could also think of a map $Rel(X \times Y) \times Hom(X,Y) \to \{0,1\}$, which just tests if a function satisfies a relation.
We can think of the relation underlying a function as the strongest relation satisfied by the function.

Then, in this view, we replace $\bB = \{0,1\}$ with $(\bN \to \bR_+)$ - instead of truth values, we have "$N$-dependent errors".
Here is maybe makes sense to quotient by the equivalence relation $\{a_n\} \sim \{b_n\}$ if $\lim a_n/b_n = 1$ (or, if zero error is possible, $a_n, b_n$ both eventually zero).

A generalization bound is something weird in this analogy - it's saying that, up to that error value, our function satisfies *all* relations.

A relation is not really a statement about a function.. it is a statement about pairs of values?
What I want to do is something like Spivak's thing.
But here it's more like the input is the whole distribution, and the output is..?

In Spivak's model, we have a subset of (statement about) possible input/output pairs, telling us what behavior of the model is possible.
The interesting part is that this is not really a subset, but a *subobject*, which encapsulates the dynamics - it contains statements like "if the input has been $x_0$ for the last five time steps, the output must be $y_0$".
We want to find some setting that allows our statements about the input/output behavior to incorporate *probabilistic* information ("the probability of $P$ is at most $\epsilon$"), and information about the *training* ("Assuming at least $N$ training samples, $P$ is true").

(Discrete) interval presheaves have a set of states, a set of possible transitions, a set of possible "paths of length $2$", and so on.
(If a "path of length $n$" is uniquely determined as a sequence of $n$ transtions, it is an interval *sheaf*).

In our case, we could say that there was a set of possible measurements of each size $N$, $\{X_N\}_{N\in\bN}$.
This would be a presheaf on the category of finite sets - a sheaf is one where $X_N = X_1^N$.

Maybe something: Our map $(X\times Y)^N \times X \to Y$ defines a relation on $X^{N+1} \times Y^{N+1}$.
In the analogy above, this is a subsheaf which is not a sheaf.

Can't ask "does this set of measurements and test, element in $X^{N+1} \times Y^{N+1}$, satisfy the generalization bound"?
But you can ask for the error. And you can ask for the subset with low error.

- "Prediction error $\leq \epsilon$ for AlgX" is a relation on (subset of) $X^{N+1} \times Y^{N+1}$ - it says "if we train AlgX on the first $N$ points, input $X_{N+1}$, the output is at most $\epsilon$ from $Y_{N+1}$.
- "Generalization error $\leq \epsilon$ for AlgX" is similarly a subset of $X^{N+1} \times Y^{N+1}$

A function $f: X \to Y$ satisfies a relation $R: X \leftrightarrow Y$ if $f(x) R y$ for all $X$ - this is $f \leq R$, not $f \in R$.
A learning algorithm is the function in this case. It has an associated "statistical relation", and we say it satisfies a different "statistical relation" if it implies it. 

Statistics - dynamics : "Statistical contracts" - "input/ouput relations in interval sheaves" : "dynamical open games (as above)" - "Bayesian/statistical/learning games".

## Compositional Convergence

We have stuff like the Perceptron Convergence Theorem, which says that if you have a classification problem which *can* be solved by a perceptron (is linearly separable), and you provide enough samples, eventually the perceptron converges to a solution.
There are probably similar results for deeper neural networks, although I can't state them offhand (although I've heard, I think, that any continuous function can be approximated by a deep/big enough neural network).

Now this makes sense in the setting of Fong/Spivak/Tuyeras learners.
Given $L: X \to Y$, metrics on $X$ and $Y$ (so that we have a metric on $Y^X$), and a class of functions $\cF \subseteq Y^X$,
we can ask whether, given some function $f \in \cF$ and a probability distribution $D(x)$ on $X$,
the stochastic process $p \mapsto_{x \sim D} U_L(x,f(x))$ on the parameter space $L_P$ converges, in the sense that for any $\epsilon, \delta$, we can find $N$ big enough so that, after $N$ generations, the probability that $d(I_p(x),f(x))$ is greater than $\epsilon$ is less than $\delta$, either for all $x$ or for $X$ distributed on $D$ (more fair).
Obviously one could list a number of different, maybe equivalent, convergence notions that would make sense here.

Now the question would be: does this compose. If $L$ is universal for $\cF$ and $L'$ is universal for $\cF'$, is $L;L'$ universal for $\{f;f' \mid f\in \cF, f'\in \cF'\}$.

First, we need to think about "compatibility" - it's clear that we need to make the metrics part of the objects in the $Learn$ category, but this is probably not a big issue.
More interestingly, we should think about the probability distributions on $X$ - where do they come from? When formulating the property for $L$, we also put a distribution on $Y$ - does this just disappear? That seems weird. Or are we assuming it holds for any distribution? Seems possible if we also get to assume that the later inputs are drawn from the same distribution.

Do we ask that it holds for all $p\in P$, or "with high probability" given some distribution on $P$? The latter seems more reasonable (also a question of: can $N$ depend on $p$?).

The second question is - what about the request maps?
It seems clear that if the request function of $L'$ is shit, $L$ has no chance of learning anything useful, so chances of learning $f;f'$ are grim.
So we need to add some condition to the request map if we want to have any hope of getting a notion closed under composition.

Some bad ideas:

- Start with $x\in X$. Update $x$ by sampling $p\in P$, setting $x \mapsto $r(x,f(x),p)$
- Ask that $I_p(x)$ converges to $f(x)$ for all $p$

Clearly stupid. Find a picture that is classified correctly by any weights? Stupid.

- Fix $p\in P$, start with $x_0$ and do $x_{n+1} = r(x_n,f(x_n),p)$
- Ask that, $I_p(x_N)$ converges to $f(x_0)$

This is at least somewhat reasonable, and consistent with what request is "supposed" to do - produce input which, at the current parameterization, matches the current output.
Unclear if it works for us, though?