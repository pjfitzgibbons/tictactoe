Feature: Find Potential Wins
    In order to prepare for Win! and
    oponent's Win!, it is necessary
    to find potential winning rows,
    columns, and diagonals.

Scenario: Row potential
    Given the following grid:
        |X| | |
        |O| | |
        |X|X| |
    Then the potential Win! for X should be:
        |7|8|9|
    Given the following grid:
        |X| |X|
        |O|O| |
        |X|X| |
    Then the potential Win! for X should be:
        |1|2|3|
        |7|8|9|

Scenario: Column potential
    Given the following grid:
        |X| | |
        | |O|O|
        |X| | |
    Then the potential Win! for X should be:
        |1|4|7|
    Given the following grid:
        |X| | |
        | |O|X|
        |X|O|X|
    Then the potential Win! for X should be:
        |1|4|7|
        |3|6|9|

Scenario: Diagonal potential
    Given the following grid:
        |X| | |
        | |X|O|
        | |O| |
    Then the potential Win! for X should be:
        |1|5|9|
    Given the following grid:
        | | |X|
        | | |O|
        |X|O|X|
    Then the potential Win! for X should be:
        |7|5|3|
