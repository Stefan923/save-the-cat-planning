(define (domain firefighter)
    (:requirements :strips :typing)

    (:types
        firefighter animal food hydrant ladder tree pillow bowl - object
        firefighter
        animal
        food
        hydrant
        ladder
        tree
        pillow
        bowl
        position
    )

    (:predicates
        (at ?obj - object ?pos - position)
        (on-floor ?x - (either firefighter animal))
        (on-ladder ?x - firefighter ?y - ladder)
        (has-food ?x - firefighter ?y - food)
        (has-animal ?x - firefighter ?y - animal)
        (has-bowl ?x - firefighter ?y - bowl)
        (has-water ?x - bowl)
        (is-fed ?x - animal)
        (is-hydrated ?x - animal)
    )

    ;; actiunea de depalsare
    (:action GO-TO
        :parameters (?x - (either firefighter animal) ?pos - position ?new-pos - position)
        :precondition (and (at ?x ?pos) (on-floor ?x))
        :effect (and (at ?x ?new-pos) (not (at ?x ?pos)))
    )

    ;; actiunea de catarare
    (:action CLIMB
        :parameters (?x - firefighter ?y - ladder ?pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos) (on-floor ?x))
        :effect (and (on-ladder ?x ?y) (not (on-floor ?x)))
    )

    ;; actiunea de coborare
    (:action DESCEND
        :parameters (?x - firefighter ?y - ladder ?pos - position)
        :precondition (and (on-ladder ?x ?y) (at ?x ?pos) (at ?y ?pos)
            (not (on-floor ?x)))
        :effect (and (not (on-ladder ?x ?y)) (on-floor ?x))
    )

    ;; actiunea de impingere a scarii (pana la copac)
    (:action PUSH-LADDER
        :parameters (?x - firefighter ?y - ladder ?pos - position ?new-pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos)
            (on-floor ?x))
        :effect (and (at ?x ?new-pos) (not (at ?x ?pos))
            (at ?y ?new-pos) (not (at ?y ?pos)))
    )

    ;; actiunea de prindere a pestelui
    (:action CATCH-FOOD
        :parameters (?x - firefighter ?y - food ?pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos))
        :effect (and (has-food ?x ?y) (not (at ?y ?pos)))
    )

    ;; actiunea de ridicare a bolului
    (:action PICK-BOWL
        :parameters (?x - firefighter ?y - bowl ?pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos))
        :effect (and (has-bowl ?x ?y) (not (at ?y ?pos)))
    )

    ;; actiunea de umplere a bolului cu apa
    (:action FILL-BOWL
        :parameters (?x - firefighter ?y - bowl ?z - hydrant ?pos - position)
        :precondition (and (at ?x ?pos) (has-bowl ?x ?y)
            (at ?z ?pos) (on-floor ?x) (not (has-water ?y)))
        :effect (has-water ?y)
    )

    ;; actiunea de salvare a animalului
    (:action SAVE-ANIMAL
        :parameters (?x - firefighter ?y - animal ?z - ladder ?t - tree ?pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos) (at ?z ?pos) (at ?t ?pos)
            (on-ladder ?x ?z) (not (on-floor ?y)))
        :effect (and (has-animal ?x ?y) (not (at ?y ?pos)))
    )

    ;; actiunea de eliberare a animalului
    (:action FREE-ANIMAL
        :parameters (?x - firefighter ?y - animal ?z - pillow ?pos - position)
        :precondition (and (at ?x ?pos) (at ?z ?pos) (on-floor ?x)
            (has-animal ?x ?y))
        :effect (and (on-floor ?y) (at ?y ?pos) (not (has-animal ?x ?y)))
    )

    ;; actiunea de hranire a animalului
    (:action FEED-ANIMAL
        :parameters (?x - firefighter ?y - animal ?z - food ?pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos) (has-food ?x ?z)
            (on-floor ?x) (on-floor ?y))
        :effect (and (is-fed ?y) (not (has-food ?x ?z)))
    )

    ;; actiunea de hidratare a animalului
    (:action GIVE-WATER
        :parameters (?x - firefighter ?y - animal ?z - bowl ?pos - position)
        :precondition (and (at ?x ?pos) (at ?y ?pos) (has-bowl ?x ?z)
            (has-water ?z) (on-floor ?x) (on-floor ?y))
        :effect (and (is-hydrated ?y) (not (has-bowl ?x ?z)) (not (has-water ?z)))
    )
)