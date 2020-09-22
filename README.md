# README

This is a simple Minesweeper solver. It takes a JSON provided from https://mine-sweeper-generator.herokuapp.com/solver and posts both the problem and the solution to a Heroku deployed API on https://minesweeper-boogaloo.herokuapp.com/.

An example of a problem/solution array pair:

`  problem = [['+', '-', '-', '-', '-', '-', '+'],
             ['|', '*', '*', '*', '*', '*', '|'],
             ['|', '*', ' ', '*', '*', ' ', '|'],
             ['|', ' ', ' ', ' ', '*', ' ', '|'],
             ['|', '*', ' ', '*', '*', '*', '|'],
             ['|', '*', '*', '*', ' ', ' ', '|'],
             ['+', '-', '-', '-', '-', '-', '+']]
             
  solution = [['+', '-', '-', '-', '-', '-', '+'],
              ['|', '*', '*', '*', '*', '*', '|'],
              ['|', '*', '5', '*', '*', '4', '|'],
              ['|', '2', '4', '5', '*', '4', '|'],
              ['|', '*', '5', '*', '*', '*', '|'],
              ['|', '*', '*', '*', '4', '2', '|'],
              ['+', '-', '-', '-', '-', '-', '+']]
`
