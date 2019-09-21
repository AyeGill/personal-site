---
title: Alignment Research Overview
tags: AI safety, ML, AI
---

Questions, musings, glossary, strategies.

## Experiments

Some from [Evan Hubinger](https://www.alignmentforum.org/posts/uSdPa9nrSgmXCtdKN/concrete-experiments-in-inner-alignment).

- Train an RL agent with access to reward as part of the observation. When testing, change this observed reward. Will it continue to optimize the original reward, or will it switch to optimizing the new observed reward.
    - I like the term "pleasure" or "utility" for "observed reward"
- Train an RL agent equipped with a way of boosting reward in future episodes. See to what degree it takes advantage of it.
- Experiments in iterated amplification - AlphaZero can be seen as a version of this, but I would like to see a more complicated test case which could probe the issue of value drift (i.e, to achieve its policy the coordinator $H$ implements some complicated computation involving the agents, and this computation fails to be aligned with $H$s goals).
- An experiment in AI forecasters - especially thinking about how long-term forecasting performance is predicted by short-to-mid-term forecasting performance.

## [The reward engineering problem](https://www.alignmentforum.org/s/EmDuGeRw749sD3GKd/p/4nZRzoGTqg8xy5rr8)

Training an RL agent $A$ to make "good decisions", given another agent $H$ which is both smarter than $A$, and already makes good decisions.
There are several approaches and difficulties in this.

## [Capability amplification](https://www.alignmentforum.org/s/EmDuGeRw749sD3GKd/p/t3AJW5jP3sk36aGoC)

Given a policy $A$, we can try to *amplify* it to a "better" policy, $A^*$.
For instance, $A^*$ could be defined to be "Whatever Paul Christiano would answer, after using a day to think about the question, being able to query $A$ in one second, as many times as needed".

The key aspects or questions of capability amplification are

- We want our amplification method to *preserve goals* - that is, if $A$ is a "good" system, $A^*$ should also be a good system. So we can start with an aligned, but feeble agent (maybe even the nil policy that does nothing? Or just an ordinary human given one second to decide), and create powerful aligned agents by iterating it.
- We want it to produce "sufficiently good" policies. Paul Christiano defines this in terms of *reachability* - $C$ is reachable from $A$ if we can get a policy at least as good as $C$ by repeatedly amplifying $A$. We want all policies, are a large class of policies, to be reachable from a similarly large class of "simple" policies (ideally, any policy is reachable from any policy). An *obstruction* is a partition of the space of policies into two parts, one not reachable from the other.

Combine this with a good solution to the reward engineering problem to find a series of increasingly capable, aligned agents.

## [Learning with catastrophies](https://www.alignmentforum.org/s/EmDuGeRw749sD3GKd/p/qALeGJ9nPcs9eC9Af)

Certain events which can be caused by an agent are so bad that we never want them to happen.
If we're doing online learning(i.e, if the agent is not learning in simulation, if actions taken while learning matters), penalizing these events severely doesn't cut it, because the agent still has to do them once to figure out that it's bad.
On approach is to run the agent on "every possible environment", and add the environments where a catastrophe happens to the training data (with severe reward penalties attached).
The obvious problem is that this is completely untractable.
A way around this it to train a different system to search the space of environments for cases where catastrophies will happen.
This is a form of "adversarial training".

- One way to beef up the "adversary", the overseer, is to look for non-specific environment conditions where it can prove the agent leads to catastrophy - i.e, it can say "If conditions $P,Q,R$ hold and if value $A$ is at least value $B$, a catastrophy will happen", without bothering to look for an environment that actually satisfies these conditions
    (but subject to some coherence conditions). Paul Christiano calls this approach, of making the adversary's task easier than actually finding a counterexample, "relaxation". 
    - There is a discussion [here](https://ai-alignment.com/training-robust-corrigibility-ce0e0a3b9b4d), which links to [this](https://arxiv.org/pdf/1811.01057.pdf) paper.
      The idea discussed is to let the adversary specify, not an actual distribution over inputs, but certain properties of a distribution over inputs - for instance, they specify each expectation $E(pq)$, where $p,q$ are input variables or activations from the agent's neural network. This data is required to satisfy some basic coherence axioms - but not enough to pin down the actual distribution, or even to guarantee that it comes from one. So the adversary's task is much easier.
    - More discussion [here](https://www.alignmentforum.org/posts/9Dy5YRaoCxH9zuJqa/relaxed-adversarial-training-for-inner-alignment#fnref-eyysQh6vXGgP4qoEL-1) (Evan Hubinger), which also links the previous paper.

## Other questions

- What is a good definition of "statistical relation" which we can ask a learning algorithm to satisfy, like we can ask a dynamical system to satisfy an "interval relation" between input/output? Should allow us to formulate a "functorial generalization bound"
  - Dynamical behavior of a learning system / behavior in probability dichotomy.
- What is a good way of making "plug [RL agent] into [Game-theoretic context] precise using the language of compositional game theory, and what can we say about converging to equilibrium
- Should we think about "compositional Markov Decision Problems" instead?
- Categorical [abstraction](https://www.alignmentforum.org/posts/hLFD6qSN9MmQxKjG5/embedded-agency-via-abstraction)?
  - See also [here](/content/PaperNotes/AlignmentForum.md) for more of my thoughts on this.

## Background reading

Big lists/bibliographies:
- [CHAI Bibliography](https://humancompatible.ai/bibliography) 

- [openAI: Key papers in Deep RL](https://spinningup.openai.com/en/latest/spinningup/keypapers.html)

Others, or selected from the above:

- [ ] Bishop: Pattern Recognition and MLx