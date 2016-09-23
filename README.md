# Tic-Tac-Toe in Swift

[![Build Status](https://travis-ci.org/cmvandrevala/TTTSwift.svg?branch=master)](https://travis-ci.org/cmvandrevala/TTTSwift)

This is my first project as an apprentice at 8th Light. It is a Tic-Tac-Toe app in Swift.

## Development

This project uses CocoaPods to manage its dependencies. Thus, do not open the `TTTSwift.xcodeproj` file bundled with the app. Instead, open the Xcode workspace file: `open TTTSwift.xcworkspace`.

## Testing

In order to run the test suite, open the Xcode workspace, switch to the "TTTSwift" target, and hit `⌘ + U`.

## Running the App

In order to run the app on the iOS simulator or a personal device, open the Xcode workspace, switch to the "TTTSwift" target and hit `⌘ + R`.

Xcode saves the executable files for a project under the `DerivedData` directory. You can find the location of this directory by opening up Xcode and selecting `Xcode > Preferences > Locations` from the menu. In order to create an executable, run the following command from the root directory of the project folder:

`xcodebuild -workspace TTTSwift.xcworkspace -scheme TTTSwiftCommandLine clean build`

The executable will be located in `path/to/DerivedData/TTTSwift-<Some-Unique-ID>/Build/Products/Debug/`
