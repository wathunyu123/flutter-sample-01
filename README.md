# Flutter-Sample-01 Project

## Author Information
- Name: Wathunyu Phetpaya
- Degree: Master of Engineering in Computer Engineering

## Environment
Framework | Version | Channel | Tool | DevTool
--- | --- | --- | --- |---
Flutter | 3.19.3 | Stable | Dart 3.3.1 | 2.31.1

## Dependencies
No | Name | Version
--- | --- | ---
1 | cupertino_icons | 1.0.6
2 | bloc | 8.1.2
3 | flutter_bloc | 8.1.3
4 | go_router | 13.1.0
5 | flutter_svg | 2.0.9
6 | auto_size_text | 3.0.0
7 | equatable | 2.0.5
8 | dio | 5.4.0
9 | flutter_sliding_box | 1.1.5
10 | icons_launcher | 2.1.7
11 | metaballs | 1.5.0
12 | package_info_plus | 5.0.1
13 | fl_chart | 0.66.2
14 | collection | 1.18.0
15 | lottie | 3.1.0

## Execute
### Flutter
- Clean Project `flutter clean`
- Download Dependencies `flutter pub get`
### iOS
- How to install brew in the official documentation `https://docs.brew.sh/Installation`
- Install Pod `brew install cocoapods`
- Update Cocoapod for iOS `pod install --repo-update`
- Build `flutter build ios`
### Android
- Install Android Studio in `https://developer.android.com`
- Build for `.aab` file, `flutter build appbundle --target-platform android-arm,android-arm64`
- Build for `.apk` file, `flutter build apk --target-platform android-arm,android-arm64 --split-per-abi`

## Icon
- Create icon `dart run icons_launcher:create`
