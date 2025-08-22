# Connect Four - TDD Implementation

A command-line implementation of the classic Connect Four game built using Test-Driven Development (TDD) principles with RSpec.

## 🎮 Game Overview

Connect Four is a two-player connection game where players take turns dropping colored discs into a vertically suspended grid. The objective is to be the first to form a horizontal, vertical, or diagonal line of four of one's own discs.

## ✨ Features

- Classic 6x7 Connect Four gameplay
- Unicode symbols for visual appeal (🔴 🟡 ⚪)
- Win detection for horizontal, vertical, and diagonal lines
- Full game validation (column limits, full board detection)
- Clean, object-oriented design
- Comprehensive test suite with RSpec

## 🛠️ Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd connect_four
```

2. Install dependencies:
```bash
bundle install
```

## 🧪 Testing

This project was built using Test-Driven Development. Run the test suite with:

```bash
rspec spec/
```

Or run tests with detailed output:
```bash
rspec spec/ --format documentation
```

## 🎯 How to Play

1. Start the game:
```bash
ruby bin/connect_four
```

2. Players take turns entering column numbers (0-6)
3. The first player to connect four pieces horizontally, vertically, or diagonally wins
4. If the board fills completely without a winner, the game ends in a draw

## 📁 Project Structure

```
connect_four/
├── lib/
│   ├── connect_four.rb   # Main game entry point
│   ├── game.rb           # Game logic and flow control
│   ├── board.rb          # Board state and win detection
│   └── player.rb         # Player information
├── spec/
│   ├── spec_helper.rb    # RSpec configuration
│   ├── game_spec.rb      # Game tests
│   ├── board_spec.rb     # Board tests
│   └── player_spec.rb    # Player tests
├── bin/
│   └── connect_four      # Executable script
└── Gemfile               # Dependencies
```

## 🧠 TDD Approach

This project was developed using the Red-Green-Refactor cycle:

1. **Red**: Write a failing test for desired functionality
2. **Green**: Implement minimal code to pass the test
3. **Refactor**: Improve code quality while maintaining passing tests

Key testing principles applied:
- Isolated unit tests for each component
- Behavior-driven development (BDD) style specifications
- Mocking and stubbing for test isolation
- Edge case coverage for robust implementation

## 🎨 Design Patterns

- **Model-View-Controller**: Separation of game logic (models), display (view), and flow control (controller)
- **Single Responsibility**: Each class has a clear, focused purpose
- **Dependency Injection**: Easy testing through injected dependencies

## 🔧 Technical Details

- **Ruby Version**: Compatible with Ruby 2.5+
- **Testing Framework**: RSpec 3.0+
- **Unicode Support**: Uses emoji for game pieces (works in most modern terminals)

## 🚀 Future Enhancements

Potential extensions for this project:
- AI opponent with minimax algorithm
- Different board sizes
- Network multiplayer support
- GUI interface
- Game history and statistics

## 📝 Learning Objectives

This project demonstrates:
- Test-Driven Development practices
- RSpec testing framework proficiency
- Object-oriented design principles
- Game logic implementation
- Clean code architecture

## 👥 Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Implement code to pass tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.