# Junaid Akram – Flutter Portfolio App

A professional **Personal Portfolio App** built with **Flutter + Riverpod**.

This app showcases my experience as a Mobile Application Developer with 3+ years of Flutter experience, including production apps for e-commerce and social platforms.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Riverpod](https://img.shields.io/badge/State%20Management-Riverpod-purple)
![Material 3](https://img.shields.io/badge/UI-Material%203-green)

## About Me

**Junaid Akram**  
Mobile Application Developer  
Faisalabad, Pakistan

- Email: devjunaidakr@gmail.com
- GitHub: [whoami-jj](https://github.com/whoami-jj)
- Portfolio: [www.junaid-portfolio.dev](https://www.junaid-portfolio.dev)

## Features

- Beautiful Material 3 design with Light & Dark mode
- Smooth animations
- Bottom navigation with 5 sections:
  - **Home** – Hero, bio, social links
  - **Projects** – Featured production apps + personal projects
  - **Skills** – Progress bars by category (Flutter, Firebase, State Management, etc.)
  - **Experience** – Work history + Education timeline
  - **Contact** – Easy ways to reach me
- Persistent theme preference
- Clean architecture + Riverpod

## Getting Started

```bash
flutter create . --project-name flutter_portfolio_app
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── router/
│   └── theme/
├── features/
│   ├── home/
│   ├── projects/
│   ├── skills/
│   ├── experience/
│   └── contact/
├── providers/
└── shared/
    ├── models/
    └── widgets/
```

## Tech Stack

- Flutter 3.x
- Riverpod 2.x
- go_router
- google_fonts
- flutter_animate
- font_awesome_flutter
- url_launcher
- shared_preferences

## Build APK

```bash
flutter build apk --release
```

## License

MIT
