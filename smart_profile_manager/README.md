# Smart Profile Manager

## App Overview
Smart Profile Manager is a Flutter application that allows users to view, edit, and persist their profile information using SharedPreferences for local storage. The app includes a splash screen, home screen, profile screen, and edit profile screen. It supports light/dark mode toggle using Provider and includes Hero animations for the profile picture.

## Instructions to Run the Project
1. Ensure you have Flutter installed (version >=3.0.0).
2. Clone the project repository or unzip the provided folder.
3. Navigate to the project directory and run `flutter pub get` to install dependencies.
4. Run the app using `flutter run` on a connected device or emulator.

## Known Issues or Limitations
- The app uses `SharedPreferences` for persistence, which is suitable for small data but not for complex data structures.
- Image picking functionality requires proper permissions on the device (handled by the `image_picker` package).

## Additional Features
- **Dark/Light Mode**: Implemented using the Provider package for seamless theme switching.
- **Hero Animations**: Added for the profile picture when navigating to the edit profile screen.
- **Clean UI/UX**: Follows Material Design guidelines with proper form validation and user feedback.

## Notes
- Ensure the device/emulator has gallery access for image picking.
