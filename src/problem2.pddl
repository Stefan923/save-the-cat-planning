(define (problem free-and-feed-cat-pb)
    (:domain firefighter)
    (:objects
        p1 p2 p3 p4 p5 firefighter ladder tree cat fish pillow
    )
    (:init
        (position p1)
        (position p2)
        (position p3)
        (position p4)
        (position p5)
        (at firefighter p1)
        (on-floor firefighter)
        (at ladder p2)
        (at tree p5)
        (at cat p5)
        (at fish p3)
        (at pillow p4)
    )
    (:goal
        (and (on-floor cat) (cat-is-fed))
    )
)