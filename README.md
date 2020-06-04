# ruby_tic_tac_toe

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

> This game is a virtual representation of the classic Tic-Tac-Toe game.

> All public class methods are tested with RSpec.

![Tic tac toe game](https://lemmoscripts.com/wp/wp-content/uploads/2018/09/tic-tac-toe-capture-2.gif)

<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/praz99/ruby_tic_tac_toe">
  </a>

  <br />
  <a href="https://github.com/praz99/ruby_tic_tac_toe"><strong>Explore the docs »</strong></a>
  <br />
  <br />
  <a href="https://github.com/praz99/ruby_tic_tac_toe/issues">Report Bug</a>
  ·
  <a href="https://github.com/praz99/ruby_tic_tac_toe/issues">Request Feature</a>
</p>

<!-- TABLE OF CONTENTS -->

<!-- ABOUT THE PROJECT -->
## Rules For Tic-Tac-Toe

1. The game is played on a grid that is 3 by 3 squares.
2. It is a game of two players that use X and O to mark moves in empty squares.
3. The first player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.
4. The game is over when all 9 squares are full. If no player has 3 marks in a row, the game ends in a tie.
5. Below is a virtual implementation where marks can be placed by selecting from numbers 1 to 9 when prompted.

| (1) | (2) | (3) |
-------------------
| (4) | (5) | (6) |
-------------------
| (7) | (8) | (9) |
-------------------

6. A winning position would like the image below at the end. As soon as someone gets three of their marks in a row, the game ends.


|  O  |  X  |  O  | 
-------------------
|  X  |  X  |  X  |  --- *Player 'X' wins with this row!*
-------------------
|  O  |  O  |  O  |
-------------------

For a detailed explanation, please have a look at this [guide](https://www.wikihow.com/Play-Tic-Tac-Toe).

## Getting Started
### Prerequisites
    Ruby installed on local machine
    Text editor (preferably: VSCode, Atom, Sublime)

### Starting the game
1. If you have installed `Ruby` on your machine:
    Clone the project into your local machine using `git clone` command or download the zip file.
    Go into the project directory using `cd directory name` command.
    Open your terminal and type `bin/main.rb` command.
    Enter players' names, select the letters which players play with.
    On the displayed board choose the cells by numbers between 1 and 9 to mark your selected letter ('X' or 'O').
2. If you have not installed `Ruby`, please, install `Ruby` and repeat step 1. 
3. Run ```rspec``` in the terminal of your root directory to run the described tests or run ```rspec --format doc``` to see a more detailed description of the written tests.

## Installation
Contributions, issues and feature requests are welcome! Start by:
* Forking the project
* Cloning the project to your local machine
* `cd` into the project directory
* Run `git checkout -b your-branch-name`
* Make your contributions
* Push your branch up to your forked repository
* Open a Pull Request with a detailed description to the development branch of the original project for a review

### Built With
This project was built using these technologies.
* Ruby
* RSpec
* Visual Studio Code

<!-- CONTACT -->
## Contributors

👤 **Prajwal Thapa** 
    
- LinkedIn: [Prazwalthapa](www.linkedin.com/in/prazwal-thapa/) 
- GitHub: [@praz99](https://github.com/praz99)
- E-mail: t.prazwal@gmail.com

👤 **Glory David** 
    
- LinkedIn: [Glorydavid](https://www.linkedin/in/glory-david/) 
- GitHub: [@glowreeyah](https://github.com/glowreeyah)
- E-mail: glodave99@gmail.com
- Twitter: [@gloweeeyah](https://twitter.com/gloweeeyah)

👤 **Marylene Sawyer**
- Github: [@Bluette1](https://github.com/Bluette1)
- Twitter: [@MaryleneSawyer](https://twitter.com/MaryleneSawyer)
- Linkedin: [Marylene Sawyer](https://www.linkedin.com/in/marylene-sawyer-b4ba1295/)

## Show your support

Give a ⭐️ if you like this project!

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* The Odin Project
* [Microverse](https://www.microverse.org/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/praz99/ruby_tic_tac_toe.svg?style=flat-square
[contributors-url]: https://github.com/praz99/ruby_tic_tac_toe/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/praz99/ruby_tic_tac_toe.svg?style=flat-square
[forks-url]: https://github.com/praz99/ruby_tic_tac_toe/network/members
[stars-shield]: https://img.shields.io/github/stars/praz99/ruby_tic_tac_toe.svg?style=flat-square
[stars-url]: https://github.com/praz99/ruby_tic_tac_toe/stargazers
[issues-shield]: https://img.shields.io/github/issues/praz99/ruby_tic_tac_toe.svg?style=flat-square
[issues-url]: https://github.com/praz99/ruby_tic_tac_toe/issues
