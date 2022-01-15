(define (problem save-fed-and-give-water-to-the-cat-pb)
    (:domain firefighter)

    (:objects
        p1 p2 p3 p4 p5 p6 p7 p8 p9 - position
        Dan - firefighter
        ladder-1 - ladder
        arbor - tree
        cat - animal
        dog - animal
        fish - food
        bowl-1 - bowl
        bowl-2 - bowl
        pillow-1 - pillow
        hydrant-1 - hydrant
    )

    (:init
        (at Dan p1)
        (on-floor Dan)
        (at ladder-1 p2)
        (at arbor p5)
        (at cat p5)
        (at fish p3)
        (at pillow-1 p4)
        (at hydrant-1 p6)
        (at bowl-1 p7)
        (at dog p8)
        (on-floor dog)
        (at bowl-2 p9)
    )

    (:goal
        (and (on-floor cat) (is-fed cat) (is-hydrated cat) (is-hydrated dog))
    )
)