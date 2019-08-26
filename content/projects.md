---
title: Projects
date: 2019-08-26
---
A list of some projects/topics I'm thinking about, or have previously spent a lot of time thinking about. Please feel free to contact me with any thoughts on these, references to existing work, your own work, etc.

## Assorted

- [Some notes from my Bachelor thesis](Projects/Bachelorprojekt/Bachelorprojekt.html)
- Develop analysis in the setting of pyknotic/condensed sets.
    - The ambition here is that a lot of things could be done internally.
    - Can we say, for instance, in a nice way, what a (Radon?) measure on a pyknotic set is?
- Develop probability theory from the complexity-theoretical viewpoint.
    - It should be possible to use a similar formal language to talk about uncertainty coming from limited computational resources, to the language we use for talking about uncertainty coming from lack of information (i.e normal probability theory).
- Learn more about previous approaches to categorical probability
    - Kurtz' theorem describes how a discrete Markov process is approximated by an ODE as $N \to \infty$ (this is a type of central limit theorem). Can we find a "categorical" CLT which recovers this?
- Studying machine learning using categorical methods.
    - The connection to game theory, sketched out in the final section of [From open learners to open games](https://arxiv.org/abs/1902.08666), seems very exciting.
        - More generally, the diagramattic language developed in these notes might be a useful way of thinking about different ML architectures.
        - What is a *bayesian open game*?
    - I am also reading [Compositional deep learning](https://arxiv.org/abs/1907.08292)
    - AlphaGo Zero can be conceptualized as learning a "fixpoint" of Monte Carlo Tree Search. Can this be cast as a trace-type construction in a suitable monoidal category?
    - Could one prove some sort of functorial generalization bound?
- I would like to write a book or set of notes in the vein of [Concrete Mathematics](https://openlibrary.org/works/OL3951639W/Concrete_mathematics), but covering more abstract methods, i.e category theory, topology, algebra, etc. (so, "Abstract Mathematics"). What I want to take from CM, then, is the expository style, focusing more on methods and problems than on definitions and theorems, and so on.

## Categorical Logic

Develop a good substitution for first-order logic in the setting of higher categories.

- Let $X_{CRingSp}$ be the classifying $\infty$-pretopos for connective $E_\infty$ ring spectra, and let $X_{CRing}$ be the classifying $\infty$-pretopos for commutative rings. Then $\pi_0$ determines a map $X_{CRing} \to X_{CRingSp}$. What can we say about this map? Can we find some good description of, say, the cofiber?
- [Categorical Logic](Projects/CategoricalLogic/CategoricalLogic.html)
- [Complete Segal Spaces](Projects/CategoricalLogic/LexSeg.html)
- [Compactly Generated Categories](Projects/CategoricalLogic/CompactlyGenerated.html)
- [Applications](Projects/CategoricalLogic/Applications.html)

## Cellular $E_k$-Algebras

- [Main dump of notes](Projects/CellularEkAlgebras/CellularEkAlgebras.html)
- [Notes on construction of trivial algebras](Projects/CellularEkAlgebras/TrivialAlgebras.html)
