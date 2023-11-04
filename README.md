# RickandMorty

## Overview
- The app greets the user with a splash screen featuring a logo and text. If the user is opening the app for the first time, it displays "Welcome!" Otherwise, it says "Hello."
- The main page features a horizontal list of locations and a vertical list of characters created using UICollectionViewCompositionalLayout. When a location is selected, it displays the characters in that location. Selecting a character takes the user to the character detail page.
- The character detail page includes the character's name in the header, followed by their photo and details. I used a UIStackView to handle the extensive details.

## Used Architectures and Patterns
- MVVM Architectural Pattern with Delegation
- Dependency Injection
- Generic Network Layer
- Builder Pattern
- Programmatic UI with SnapKit
- UICollectionViewCompositionalLayout

## Third-Party Libraries
- Snapkit
- SDWebImage

## Screenshots
### Splash Screen
<img src="https://user-images.githubusercontent.com/83546571/230061689-357f9db7-bcfe-4e2c-b711-90eedceb71f7.png" width="294" height="620" />

### Home Screen
<img src="https://user-images.githubusercontent.com/83546571/228595116-43b71f86-81cf-465e-935a-f205ecc291b6.png" width="294" height="620" />

### Detail Screen
<img src="https://user-images.githubusercontent.com/83546571/229820265-f2542dc4-cf86-404f-855a-1c96a205b6a3.png" width="294" height="620" />
