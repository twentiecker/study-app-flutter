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
- Add rules for users in Firestore Database to read and write
- Generate SHA-1 and SHA-256 for android app with "gradlew" in android folder and then paste them
  into "Project Settings" of firebase
- Modify "google-service.json" in app folder of android with the latest one which is got from "
  Project Settings"
- Run command "flutter clean" in root folder
- FOR iOS ONLY!!! add this script below into "info.plist" file and then don't forget to run command "flutter clean"

```
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>**INSERT HERE YOUR RESERVED_CLIENT_ID FROM GoogleService-Info.plist**</string>
        </array>
    </dict>
</array>
```
- Add internet permission in AndroidManifest.xml. It's located in android/app/src/main

## Just in Case

- I change main function to "Future with async" to accommodate firebase initialization