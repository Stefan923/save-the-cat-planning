(define (problem free-and-feed-cat-pb)
    (:domain firefighter)
    
    (:objects
        p1 p2 p3 p4 p5 - position
        Dan - firefighter
        ladder-1 - ladder
        arbor - tree
        cat - animal
        fish - food
        pillow-1 - pillow
    )

    (:init
        (at Dan p1)
        (on-floor Dan)
        (at ladder-1 p2)
        (at arbor p5)
        (at cat p5)
        (at fish p3)
        (at pillow-1 p4)
    )

    (:goal
        (and (on-floor cat) (is-fed cat))
    )
)