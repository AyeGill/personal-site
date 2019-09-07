---
title: Alignment Forum Short Notes
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

## [Bayesian Probability is for things that are Space-like separated from you](https://www.alignmentforum.org/posts/FvcyMMaJKhYibtFDD/bayesian-probability-is-for-things-that-are-space-like)

In brief, we can partition the world into

- Things that affect us, but we can't affect them (our past)
- Things that don't interact with us (our present)
- Things that we affect (our future).

The point of this post is that it's only clear that we should use Bayesian probability for things in the middle cluster.
The usual coherence arguments for Bayesian probability assume that the probability that something will happen is independent of our belief that it will happen.
