(define (domain firefighter)
    (:requirements :strips)

    (:constants
        firefighter ladder fish tree cat bowl hydrant pillow
    )

    (:predicates
        (position ?x)
        (on-floor ?x)
        (at ?m ?x)
        (on-ladder ?x)
        (has-fish)
        (has-cat)
        (has-bowl)
        (has-water)
        (cat-is-fed)
        (cat-is-hydrated)
    )

    ;; actiunea de depalsare
    (:action GO-TO
        :parameters (?x ?y)
        :precondition (and (position ?x) (position ?y) (on-floor firefighter) (at firefighter ?y))
        :effect (and (at firefighter ?x) (not (at firefighter ?y)))
    )

    ;; actiunea de catarare
    (:action CLIMB
        :parameters (?x)
        :precondition (and (position ?x) (at ladder ?x) (at firefighter ?x))
        :effect (and (on-ladder ?x) (not (on-floor firefighter)))
    )

    ;; actiunea de coborare
    (:action DESCEND
        :parameters (?x)
        :precondition (and (position ?x) (at ladder ?x) (at firefighter ?x)
            (on-ladder ?x) (not (on-floor firefighter)))
        :effect (and (not (on-ladder ?x)) (on-floor firefighter))
    )

    ;; actiunea de impingere a scarii (pana la copac)
    (:action PUSH-LADDER
        :parameters (?x ?y)
        :precondition (and (position ?x) (position ?y) (at ladder ?y) (at firefighter ?y)
            (on-floor firefighter))
        :effect (and (at firefighter ?x) (not (at firefighter ?y))
            (at ladder ?x) (not (at ladder ?y)))
    )

    ;; actiunea de prindere a pestelui
    (:action CATCH-FISH
        :parameters (?y)
        :precondition (and (position ?y) (at fish ?y) (at firefighter ?y))
        :effect (and (has-fish) (not (at fish ?y)))
    )

    ;; actiunea de ridicare a bolului
    (:action PICK-BOWL
        :parameters (?y)
        :precondition (and (position ?y) (at bowl ?y) (at firefighter ?y))
        :effect (and (has-bowl) (not (at bowl ?y)))
    )

    ;; actiunea de umplere a bolului cu apa
    (:action FILL-BOWL
        :parameters (?y)
        :precondition (and (position ?y) (has-bowl)
            (at hydrant ?y)
            (at firefighter ?y)
            (on-floor firefighter))
        :effect (has-water)
    )

    ;; actiunea de salvare a pisicii
    (:action SAVE-CAT
        :parameters (?y)
        :precondition (and (position ?y)
            (at tree ?y) (on-ladder ?y) (at cat ?y) (at firefighter ?y))
        :effect (has-cat)
    )

    ;; actiunea de eliberare a pisicii
    (:action FREE-CAT
        :parameters (?y)
        :precondition (and (position ?y) (at pillow ?y)
            (on-floor firefighter) (has-cat) (at firefighter ?y))
        :effect (and (on-floor cat) (not (has-cat)))
    )

    ;; actiunea de hranire a pisicii
    (:action FEED-CAT
        :parameters (?y)
        :precondition (and (position ?y) (has-fish)
            (on-floor cat) (on-floor firefighter) (at cat ?y) (at firefighter ?y))
        :effect (and (cat-is-fed) (not (has-fish)))
    )

    ;; actiunea de hidratare a pisicii
    (:action GIVE-WATER
        :parameters (?y)
        :precondition (and (position ?y) (has-bowl) (has-water)
            (on-floor cat) (on-floor firefighter) (at cat ?y) (at firefighter ?y))
        :effect (and (cat-is-hydrated) (not (has-bowl)) (not (has-water)))
    )
)