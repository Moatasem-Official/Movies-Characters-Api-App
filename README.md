# Film Character App with BLoC & API

A Flutter application that displays film characters with their details and quotes, using BLoC architecture and fetching data from public APIs.

## Features

- List of film characters with images and names.
- Search functionality to find characters easily.
- Detailed view for each character, including famous quotes.
- Modern, responsive UI for all screen sizes.
- State management using BLoC and flutter_bloc.
- Error handling and loading indicators for a smooth experience.

## Tech Stack

- **Flutter**: UI development
- **BLoC (flutter_bloc)**: State management
- **Dio**: Networking and API requests
- **Shared Preferences**: Local data storage
- **Animated Text Kit**: Animated text effects

## Getting Started

1. Make sure you have [Flutter](https://docs.flutter.dev/get-started/install) installed.
2. Install dependencies:
   ```sh
   flutter pub get
   
3. Run the app:
    flutter run

Project Structure

lib/
  business_logic/: BLoC, Cubit, and state management
  data/: Models, repositories, and web services
  presentation/: Screens and widgets
  constants/: App-wide constants
  app_router.dart: Navigation and routing


Screenshots
  Add screenshots here to showcase the app UI.

Contributing
  Contributions and suggestions are welcome! Please open an Issue or Pull Request.

License
  This project is for educational purposes and not intended for commercial use.