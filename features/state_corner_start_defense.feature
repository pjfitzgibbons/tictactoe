Feature: State Machine Defense of Corner Start
    In order to ensure Win or Tie by computer,
    the State Machine must respond to
    X (Computer) start in Corner square

Scenario: Move 3 counter diagonal
    Given a blank grid
    When X moves to square 3
    And O (computer) takes turn
    Then the grid should match:
        | | |X|
        | |O| |
        | | | |
    When X moves to square 7
    And O (computer) takes turn
    Then the grid should match:
        | |?|X|
        |?|O|?|
        |X|?| |

