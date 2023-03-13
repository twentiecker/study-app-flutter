# Learning App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

## Adjustment

- Using Firebase CLI to configure flutter application with firebase database
- minSdkVersion 21 for compatibility issue in Cloud Firestore (required sdk 19) at
  android/app/build.gradle
- Flutter 3.7.7 • channel stable • https://github.com/flutter/flutter.git
  Framework • revision 2ad6cd72c0 (4 days ago) • 2023-03-08 09:41:59 -0800 Engine • revision
  1837b5be5f Tools • Dart 2.19.4 • DevTools 2.20.1

## Just in Case
- I change main function to "Future with async" to accommodate firebase initialization
- I add homeRoute function at "introduction_screen" and then set it in "onTap" properties
- Initialization of "FirebaseStorageService" happen before "QuestionPaperController" which is not same like the master one