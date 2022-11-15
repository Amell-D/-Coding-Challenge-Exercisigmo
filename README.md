# -Coding-Challenge-Exercisigmo

## How to run it
- Clone the project or download it (then unzip it)
- Double-click on "Exercisigmo.xcodeproj"
- Wait untill Swift Package Manager downloads packages (just one: Kingfisher)
- Run it!

## Tech Stack 
- SwiftUI
- UIKit
- Combine
- Kingfisher

Minimum iOS: 14.0

## Architecture
- Following SOLID, DRY and KISS principles I choose basic Clean Architecture as proposed by "Uncle Bob"
- Folders: Feature, Common, Network
- Every feature consists of three layers: Presentation, Domain, Data
- In Presentation layer MVVM is used.
