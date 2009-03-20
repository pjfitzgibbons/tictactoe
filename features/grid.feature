Feature: Grid
    Tic Tac Toe must display a 3 x 3 grid
    to the end user with X and O
    in locations played.

Scenario: Blank Grid
    Given a blank grid
    Then the grid should display
        """
          |   |  
        ---------
          |   |  
        ---------
          |   |  
        """

Scenario: Grid all X's
    Given the following grid:
        |X|X|X|
        |X|X|X|
        |X|X|X|
    Then the grid should display
        """
        X | X | X
        ---------
        X | X | X
        ---------
        X | X | X
        """

Scenario: Grid partial
    Given the following grid:
        |X|O| |
        | |X|O|
        |O| |X|
    Then the grid should display
        """
        X | O |  
        ---------
          | X | O
        ---------
        O |   | X
        """
