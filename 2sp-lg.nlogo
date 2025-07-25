globals [
  erasing
]

patches-own [
  state           ;; 0 for dead, 1 for species 1's cell, 2 for species 2's cell
  live-neighbors  ;; counts how many neighboring cells are alive
  species1-neighbors ;; counts how many neighboring cells belong to species 1
  species2-neighbors ;; counts how many neighboring cells belong to species 2
]

to setup-blank
  ca
  ask patches [ cell-death ]
  reset-ticks
end

to setup-random
  ca
  ask patches [
    ifelse random-float 100.0 < initial-density [
      ifelse random 2 = 0 [
        set state 1
        set pcolor col-species1
      ] [
        set state 2
        set pcolor col-species2
      ]
    ] [
      cell-death
    ]
  ]
  reset-ticks
end

to cell-birth
  ;; For simplicity, let's assume cell birth always creates a player 1 cell
  set state 1
  set pcolor col-species1
end

to cell-death
  set state 0
  set pcolor bgcolor
end

to go
  ask patches [
    set live-neighbors count neighbors with [state != 0]
    set species1-neighbors count neighbors with [state = 1]
    set species2-neighbors count neighbors with [state = 2]
  ]
  ask patches [
    if state = 0 [
      ;; Birth rule: If there are exactly three cells of a common color adjacent to a dead cell, it is born.
      if species1-neighbors = 3 [
        set state 1
        set pcolor col-species1
      ]
      if species2-neighbors = 3 [
        set state 2
        set pcolor col-species2
      ]
    ]
    if state = 1 [
      ;; Survival rule: Survive if there are two or three cells of the same color adjacent to the living cell.
      if species1-neighbors != 2 and species1-neighbors != 3 [
        cell-death
      ]
      ;; Defeat Rule: Defeat and death if there are 3 or more cells of different colors adjacent to the living cell.
      if species2-neighbors >= 3 [
        cell-death
      ]
      ;; Overcrowding rule: if there are 4 or more cells of the same color adjacent to a living cell, it dies due to overcrowding
      if species1-neighbors >= 4 [
        cell-death
      ]
    ]
    if state = 2 [
      ;; Survival rule
      if species2-neighbors != 2 and species2-neighbors != 3 [
        cell-death
      ]
      ;; Defeat Rule
      if species1-neighbors >= 3 [
        cell-death
      ]
      ;; Overcrowding rule
      if species2-neighbors >= 4 [
        cell-death
      ]
    ]
  ]
  tick
end

to draw-cells
  ifelse mouse-down? [
    if erasing = 0 [
      set erasing [state != 0] of patch mouse-xcor mouse-ycor
    ]
    ask patch mouse-xcor mouse-ycor [
      ifelse erasing [
        cell-death
      ] [
        cell-birth
      ]
    ]
    display
  ] [
    set erasing 0
  ]
end
