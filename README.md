# Tic-Tac-Toe in Swift

[![Build Status](https://travis-ci.org/cmvandrevala/TicTacToe.svg?branch=master)](https://travis-ci.org/cmvandrevala/TicTacToe)

This is my first project as an apprentice at 8th Light. It is a Tic-Tac-Toe app in Swift.

## Development

This project uses CocoaPods to manage its dependencies. Thus, do not open the `TicTacToe.xcodeproj` file bundled with the app. Instead, open the Xcode workspace file: `open TicTacToe.xcworkspace`.

## Testing

In order to run the test suite for the iOS app, open the Xcode workspace, switch to the "TicTacToeiOS" target, and hit `⌘ + U`. In order to run the test suite for the command line app, open the Xcode workspace, switch to the "TicTacToeCommandLine" target, and hit `⌘ + U`. Notice that you do not want to run the "TicTacToeCommandLineTests" workspace directly.

## Running the App

In order to run the app on the iOS simulator or a personal device, open the Xcode workspace, switch to the "TicTacToeiOS" target and hit `⌘ + R`. In order to run the app on the Swift command line, open the Xocde workspace, switch to the "TicTacToeCommandLine" target, and hit `⌘ + R`.

Xcode saves the executable files for a project under the `DerivedData` directory. You can find the location of this directory by opening up Xcode and selecting `Xcode > Preferences > Locations` from the menu. In order to create an executable, run one of the following commands from the root directory of the project folder:

Command Line App: `xcodebuild -workspace TicTacToe.xcworkspace -scheme TicTacToeCommandLine clean build`
iOS App: `xcodebuild -workspace TicTacToe.xcworkspace -scheme TicTacToeiOS clean build`

The executable will be located in `path/to/DerivedData/TicTacToe-<Some-Unique-ID>/Build/Products/Debug/`
