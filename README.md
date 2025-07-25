## Language and Environment
NetLogo 6.4.0

## Rules
- Birth: If there are exactly three cells of the same color adjacent to a dead cell, the next generation of the same color will be born.
- Survival: If there are two or three cells of the same color adjacent to a living cell, it will survive in the next generation with the same color.
- Overcrowding: If there is only one or fewer cells of the same color adjacent to a living cell, it will die due to overcrowding.
- Defeat: If a living cell is adjacent to three or more cells of a different color, it is defeated and dies.
- Overcrowding: If a living cell is adjacent to four or more cells of the same color, it dies due to overcrowding.

## Operation
initial state

<img width="1200"  alt="image" src="https://github.com/user-attachments/assets/d890adff-a37c-4eaa-9ea7-018e32fd38f5" />

  
With “setup-random,” two types of organisms are randomly placed, and the cells are set to a living state.

<img width="1247"  alt="image" src="https://github.com/user-attachments/assets/2b757f7b-5dd4-4356-99b0-4440fc0551a8" />


Continue advancing the cell state with `go-forever`.

<img width="1200" alt="image" src="https://github.com/user-attachments/assets/dd9c3c8d-707d-417c-8be0-4a0b2ef0ba79" />


`count species`: Shows the survival rates of each of the two species.


<img width="400"  alt="image" src="https://github.com/user-attachments/assets/ddca591d-1bed-42af-aab9-b99f774142ac" />

`initial density`: Set the initial value for the percentage of live cells in the entire cell.

<img width="600"  alt="image" src="https://github.com/user-attachments/assets/d80dd896-184f-47a9-adb9-d8007ce53427" />


`col-species`,`bgcolor`: Sets the color (background) of live and dead cells.

<img width="370" alt="image" src="https://github.com/user-attachments/assets/68198f64-9be7-44fe-b9d4-d52e0c5d01f8" />


`set-blank`:Set all cells to dead state.

`go once`: Advance the cell state by one generation.

<img width="400" alt="image" src="https://github.com/user-attachments/assets/4408c992-e037-4701-a0cc-2f086bd251e5" />
