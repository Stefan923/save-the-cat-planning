(define (problem free-cat-pb)
       (:domain firefighter)
       (:objects
              p1 p2 p3 p4 firefighter tree ladder cat pillow
       )
       (:init
              (position p1)
              (position p2)
              (position p3)
              (position p4)
              (at firefighter p1)
              (on-floor firefighter)
              (at ladder p2)
              (at tree p3)
              (at cat p3)
              (at pillow p4)
       )
       (:goal
              (and (on-floor cat))
       )
)