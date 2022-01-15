(define (problem free-cat-pb)
       (:domain firefighter)

       (:objects
              p1 p2 p3 p4 - position
              Dan - firefighter
              arbor - tree
              cat - animal
              ladder-1 - ladder
              pillow-1 - pillow
              bowl-1 - bowl
              hydrant-1 - hydrant
              fish - food
       )

       (:init
              (at Dan p1)
              (on-floor Dan)
              (at ladder-1 p2)
              (at arbor p3)
              (at cat p3)
              (at pillow-1 p4)
       )
       
       (:goal
              (and (on-floor cat))
       )
)