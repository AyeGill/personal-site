---
title: Alignment Forum Short Notes
tags: AI, Questions
---

Here I list some thoughts on (or just summaries of) posts from the [AI Alignment Forum](https://www.alignmentforum.org/).

## [Embedded Agency via Abstraction](https://www.alignmentforum.org/posts/hLFD6qSN9MmQxKjG5/embedded-agency-via-abstraction).

"Abstraction" is about throwing away information in such a way that we can still make reliable predictions. We could say it is about making maps that are smaller than the territory. Several good examples are listed:

- We have a gas containing some number of particles. We *abstract* this into a blob on our map called "a gas", and just record a key few numbers. We can still make a lot of useful predictions from this map.
- We have a collection of wires and transistors. We draw a blob on our map labelled "NAND", and throw away a whole bunch of information about how it's implemented.

And more good examples.

The key questions posed, that a good "theory of abstraction" should answer:

- Characterize which maps work on which territories
- Which query classes admit compressed maps on which territories
- Which map-making processes produce reliable maps?
- How do we translate a query from map-representation to query-representation? How do we translate between different map-representations?

Some more of my own thoughts:

Using the language of statistical mechanics, we think of abstraction as a map from microstates to macrostates.

- The higher the number of particles in the system, the "better" the abstraction. I interpret this essentially as a law of large numbers: abstractions work "in probability"[^particleadd].
- Here being a "good" abstraction means that questions about *macrostates* can be usefully answered using only data from the macrostate. I.e, we can usefully predict the net force on a surface exerted by a gas using only the macrovariables pressure, temperature etc. We *can't* expect to predict the position of a particle - this is information that we have discarded.
- Taking a macrostate in general seems to involve an expectation operation, working on a distribution on microstates - or maybe taking the expected value of a random variable should be thought of as abstraction?
- The particles $\to$ gas law model also seems to involve some averaging over time. Or maybe this is just averaging over *initial position*, since we have *forgotten* the initial position. This relates back to the throwing away *specific* information ideas.
    - Removing information about position $\to$ averaging over trajectory (placing at random point in trajectory). Ergodic theorem? .. Shouldn't it just involve exactly that, forgetting the position?
- Question: What are the "probabilistic" parts here, and what are the "deterministic" parts?
- How does *diagonalization* break things, i.e if the macrostate is forced to be *part* of the microstate, how do things change, and how can this approach cope with a setup which "forces" the macrostate to contradict itself?
- Composing nonabstracted/abstracted components in analogy with composing discrete/nondiscrete systems?

[^particleadd]: This also uses the fact that the macro-properties in question are "additive in particles", i.e the pressure (net force) exerted by a number of particles is the sum of the force exerted by each particle.

## [Bayesian Probability is for things that are Space-like separated from you](https://www.alignmentforum.org/posts/FvcyMMaJKhYibtFDD/bayesian-probability-is-for-things-that-are-space-like)

In brief, we can partition the world into

- Things that affect us, but we can't affect them (our past)
- Things that don't interact with us (our present)
- Things that we affect (our future).

The point of this post is that it's only clear that we should use Bayesian probability for things in the middle cluster.
The usual coherence arguments for Bayesian probability assume that the probability that something will happen is independent of our belief that it will happen.
