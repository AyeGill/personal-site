---
title: Open Agents
date: 2019-09-05
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
