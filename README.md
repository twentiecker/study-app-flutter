# Aplikasi Mobile Latihan Soal Berbasis Gamifikasi: Edu2Play

Aplikasi ini dibuat dalam rangka memenuhi tugas besar kuliah Desain Aplikasi Interaksi.

## Instalasi

### Clone Kode Aplikasi

```
git clone https://github.com/twentiecker/study-app-flutter.git
```

### Instalasi Dependency

Jalankan command di bawah ini pada terminal di root folder

```
flutter pub get
```

### Build Aplikasi

Jalankan command di bawah ini pada terminal di root folder

```
flutter build apk
```

File release apk akan berada pada folder <code>build\app\outputs\flutter-apk</code>

## Penyesuaian Kode

- Set <code>minSdkVersion 21</code> for compatibility issue in Cloud Firestore (required sdk 19) at <code>android/app/build.gradle</code>
- Modify classpath <code>'com.android.tools.build:gradle:7.3.1'</code> at <code>android/build.gradle</code>
- Add internet permission <code><uses-permission android:name="android.permission.INTERNET"/></code> in AndroidManifest.xml. It's located in android/app/src/main
- Modify rules in Firestore Database to read and write (collection name)
- Generate SHA-1 and SHA-256 for android app with <code>.\gradlew signingReport</code> in android folder and then paste them into "Project Settings" of firebase
- Run command <code>flutter clean</code> in root folder to get fresh code
- Modify "google-service.json" in <code>android/app</code> with the latest one which is got from "Project Settings"
- FOR iOS ONLY!!! add this script below into "info.plist" file at <code>ios/Runner</code> and then don't forget to run command <code>flutter clean</code>

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

## Dokumentasi Flutter

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.
