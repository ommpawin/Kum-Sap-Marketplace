# Kum-Sap Marketplace

Flutter Mobile Challenge

Simple Online Shopping Application with 4(+1) Pages.

## Getting Started with Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## FVM Setup

FVM Flutter Version Management A simple CLI to manage Flutter SDK versions.
```bash
$ pub global activate fvm # install FVM to manage Flutter version
$ fvm install 3.3.2
$ fvm use 3.3.2
```

## Build and Run Step
```bash
# Get Package and Build Project
$ fvm flutter clean
$ fvm flutter packages get
$ fvm flutter pub run build_runner build --delete-conflicting-outputs

# Run Project
$ fvm flutter run 
```

## iOS uninstall & reinstall packages

```bash
# Clean Xcode Cache
pod ios/deintegrate && fvm flutter clean && rm -Rf ios/Pods && rm -Rf ios/Podfile.lock && rm -Rf ios/.symlinks && rm -Rf ios/Flutter/Flutter.framework && rm -Rf ios/Flutter/Flutter.podspec && rm -Rf ios/Podfile && rm -Rf build && rm -rf ~/Library/Developer/Xcode/DerivedData
```

## [!!! Important] Error Note

### 1. Error The current Dart SDK version is... Log
```bash
Running "flutter pub get" in kum-sap-marketplace...
The current Dart SDK version is 2.17.1.

Because kumsap_marketplace requires SDK version >=2.18.1 <3.0.0, version solving failed.
pub get failed (1; Because kumsap_marketplace requires SDK version >=2.18.1 <3.0.0, version solving failed.)
Exited (1)
```
### Fix : Change environment -> SDK to ">=2.17.1 <3.0.0" or Clean project cache