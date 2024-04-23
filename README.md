# counter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


- ### Bundle String

    - run `flutter pub run intl_utils:generate` to generate bundle string for language.

    
- ### Floor and Env. Generator 

    `flutter packages pub run build_runner build`

    `flutter packages pub run build_runner build --delete-conflicting-outputs`


- ### Build command

    - Android

        - dev `flutter build apk -t lib/main_dev.dart --flavor=dev`

        - prod `flutter build apk -t lib/main.dart --flavor=prod`

   - appbundle

        - dev `flutter build appbundle --target-platform android-arm,android-arm64,android-x64 -t lib/main_dev.dart --flavor=dev --dart-define=app.flavor=dev`
       
        - prod `flutter build appbundle --target-platform android-arm,android-arm64,android-x64 -t lib/main.dart --flavor=prod`

    - iOS

        - dev `flutter build ios -t lib/main_dev.dart --flavor=dev --dart-define=app.flavor=dev`

        - prod `flutter build ios -t lib/main.dart --flavor=prod`