Feature: Win Detection
    In order to determine end-game of Tic Tac Toe,
    the system must be able to detect Win, Tie, and In-Play
    status of the Grid.
    Wins should be detected on a non-full grid.

Scenario: Win Diagonals
    Given the following grid:
        |X| | |
        |O|X|O|
        | |O|X|
    Then X should Win
    Given the following grid:
        | | |O|
        |X|O|X|
        |O|O| |
    Then O should Win

Scenario: Win Across
    Given the following grid:
        |X|X|X|
        |O| |O|
        | |O| |
    Then X should Win
    Given the following grid:
        | | | |
        |X| |X|
        |O|O|O|
    Then O should Win

Scenario: Win Down
    Given the following grid:
        |X| |O|
        |X| |O|
        |X|O| |
    Then X should Win
    Given the following grid:
        |O| |O|
        | |X|O|
        |X|X|O|
    Then O should Win

Scenario: In-Play
    Given the following grid:
        |X| |O|
        | |X|O|
        |X|O| |
    Then the game is In-Play
    Given the following grid:
        |O| |O|
        | |X| |
        |X| |O|
    Then the game is In-Play

Scenario: Tie
    Given the following grid:
        |O|X|O|
        |O|X|O|
        |X|O|X|
    Then the game is a Tie
    Given the following grid:
        |O|X|O|
        |O|X|X|
        |X|O|O|
    Then the game is a Tie



