Bachelor Project {#Proj:BachProj}
================

Currently contains preliminary notes regarding my bachelor project. Not
intended to be the location of the final text.

Meeting with Rune, the first
----------------------------

We seem to have settled down on something with $\infty$-categories. Rune
remarks that the project should probably work towards some sort of
application of the theory. He says I could do something with stable
$\infty$-categories, but for this I should know something about spectra,
which would be another thing to read. Sent me three references on
quasicategories which should be more readable than HTT - so far, they
are.

Notes for second meeting with Rune
----------------------------------

-   Isn't $M \cap W$ just the class of inner anodyne maps (it better be,
    if it's supposed to equal $\prescript{\lift}{}{F}$)

Things that could go in the project (or: Things I might want to read up on)
---------------------------------------------------------------------------

-   Basic $\infty$-category theory

-   Stable $\infty$-categories

-   Brown representability: Under certain structural assumptions,
    presheaves on the homotopy category of $\infty$-categories are
    representable under certain assumptions on the behaviour of
    coproducts and pushouts.

-   Deriving Mayer-Vietoris sequence from homotopy pullback of Kan
    complexes.

-   Construction of $\infty$-category of spectra, comparison with
    classical spectra.

-   Comparison between stable infty-category and cohomology theories.

-   Various classical definitions of spectra.

-   The yoneda lemma for $\infty$-categories.

-   Description of $K$-theory as an invariant of stable
    $\infty$-categories

    -   Description of $K$-theory as an invariant of more classical
        types of categories

    -   Relation of this to $K$-theory of spaces, etc.

    -   Trace map from $K$ to Topological cyclic homology, and the
        definition of this thing.

-   Homological algebra and stable $\infty$-cats, $\cl{D}(A)$ as a
    stable category.

-   $\infty$-operads and $\mathbb{E}_k$-algebras, in particular in
    spectra. Via dendroidal sets vs via maps to $N(\Gamma)$

-   Comparison between homotopy (co)limits in simplicial model
    categories and limits in $\infty$-categories.

Idea 1: Brown representability and $\infty$-cats
------------------------------------------------

If $H: \cl{H}_*\op \to Set_*$ is a functor which takes coproducts to
products and "weak pushouts" to "weak pullbacks", then $H$ is
representable. (Here $\cl{H}_*$ is the homotopy category of *pointed,
connected CW complexes*)

The somewhat odd condition of flipping weak pushouts can also be phrased
as the "Mayer-Vietoris axiom": Given $X = A \cup B$ a CW-pair, and
$a \in H(A), b \in H(B)$ so that their images in $A \cap B$ agree, there
exists an element $x \in H(X)$ pulling back to both $a$ and $b$ (a form
of "gluing").

This implies for instance that cohomology theories are levelwise
represenable as functors into $Set$ - by a purely formal argument their
representing objects must form a spectrum, endowing the sets $[X, A]$
with abelian group structure, which (by a slightly more contingent
argument) must be the original group structure.

However, this theorem is a bit weird. The homotopy category is not a
nice place to live, and (possibly as a consequence) the conditions are
somewhat odd. We're also primarily interested in representing entire
homology theories, not just their levels - it would be nice to have a
theory allowing us to build the entire spectrum at once, maybe
characterizing functors $\cl{S}_*$ to some suitable $\infty$-category of
graded abelian groups that are representable by spectra.

What we really want is some sort of functor $s: Top \to Spc$, which in
some sense forgets only the information that can't be detected by
cohomology, so that mapping sets (spaces?) in $Spc$ naturally give rise
to graded abelian groups, and so that $Spc(s(X), E)$ gives the
cohomology of $X$ in the theory represented by $E$. We could then ask
for conditions under which a functor $Spc \to Ab^\Z$ is "representable"
- ideally ones which recover the classical representability theorems (so
they should primarily concern the behaviour on the image of $i$).

Idea 2: Universality of multiplicative infinite loop space machines
-------------------------------------------------------------------

Suggested by Rune. Following the 2013 paper by Gepner-Groth-Nikolaus -
see below. \[11-01-17: We are moving forward with this idea.\]

Things I should understand:

-   Higher Algebra, chapter 2 on $\infty$-operads.

-   Higher Topos Theory, at least chapters 1-3, possibly more.

    -   The relationship between quasicategories, model categories and
        simplicial categories.

    -   Homotopy (co)limits in each setting.

-   Gepner-Groth-Nikolaus (duh!)

1.  Limits/Colimits in quasicategories

2.  $\infty$-operads

3.  Preadditive, additive and stable quasicategories.

4.  Construction of
    $Mon_\infty(\cl{C}), Grp_\infty(\cl{C}), Sp(\cl{C})$.

5.  Construction of multiplicative structure.

Notes
-----

-   Does \[Segal 74\] ever actually use the "Special"/"Very special"
    terminology? Or was it introduced later in Bousfield-Friedlander?

Sources
-------

lurie - higher topos theory

:   First few chapters gives a technical account of the theory of
    quasicategories. The remainder of the book is about higher topoi,
    which almost certainly won't be in the project. Very techical, dry -
    not a textbook. Also has appendiced covering certain technical
    prerequisites, such as presentable categories.

rezk - quasicats

:   . About quasicategories (duh!). Covers much of the same material as
    Lurie, but much more readable (intended as a textbook). Defines
    certain things differently.

haugseng - inftycat

:   Much like the above.

lurie - higher algebra

:   Covers stable $\infty$-categories, and theory of (symmetric)
    monoidal $\infty$-categories and (colored) $\infty$-operads.
    Develops monoidal structure on *the* stable $\infty$-category (ie of
    spectra) - this is the eponymous Higher Algebra.

gepner+groth+nikolaus - univ mult inf loop

:   Discusses the sequence of functors
    $\cl{C} \to \cl{C}_* \to {\rm Mon}_{E_\infty}(\cl{C}) \to {\rm Grp}_{E_\infty}(\cl{C}) \to {\rm Sp}(\cl{C})$,
    describing them as universal constructions. Primarily concerned with
    *multiplicativity*, i.e. extending symmetric monoidal structures
    from $\cl{C}$ along these constructions. [@GGP2013]

[Projects/Bachelorprojekt/stable-infty-cats.html](Projects/Bachelorprojekt/stable-infty-cats.html)
