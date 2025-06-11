# Monthly Bills App (Under Development)

## Overview

This is a mobile application designed to help users track their monthly bills effectively. It aims to provide a clear and organized way to manage bills, offering features for logging expenses and generating insightful reports.

**Please note that this application is currently under active development and some features may not be fully implemented or stable.**

## Key Features (Planned & In Progress)

* **Google Login:** Secure and seamless authentication using Google Sign-In.
* **Home Screen:** A dashboard providing a summary of your current financial status.
* **Bills Registration:** Intuitive forms to add new bill with details like date, amount, and description.
* **Reports:** Visual representations of your spending habits, allowing you to understand where your money is going.

## Base Architecture

![image](https://github.com/user-attachments/assets/b3335d0f-c4ce-4773-8d9c-7c4c01b7c881)

![image](https://github.com/user-attachments/assets/a940eaea-3aa2-4e50-9e02-9111a1f4f5de)





---

## ✨ Features

- 🔐 **Google Sign-In** with Firebase Auth
- 🌐 **Multi-language support** with `easy_localization`
- 🗺️ **Declarative navigation** using `go_router`
- 📀 **Offline-first data persistence** with Isar
- 🧠 **State management** with `flutter_bloc` and `get_it`
- 🖼️ **Animated UI** with Lottie and SVGs
- 📱 **Responsive design** using `flutter_screenutil`
- 💡 **Clean architecture** and result-oriented programming with `result_dart`

---

## 📦 Dependencies

### 🔧 Core

| Package                     | Description                                   |
| --------------------------- | --------------------------------------------- |
| `firebase_core`             | Core Firebase SDK integration                 |
| `firebase_auth`             | Firebase Authentication                       |
| `google_sign_in`            | Google sign-in for Firebase Auth              |
| `isar`, `isar_flutter_libs` | Local NoSQL database for fast persistence     |
| `path_provider`             | Get commonly used locations on the filesystem |

### 🌐 Routing & State Management

| Package                | Description                               |
| ---------------------- | ----------------------------------------- |
| `go_router`            | Declarative routing solution              |
| `bloc`, `flutter_bloc` | State management using BLoC pattern       |
| `get_it`               | Dependency injection container            |
| `equatable`            | Simplifies value comparisons in Dart      |
| `result_dart`          | Result type for functional error handling |

### 🌍 Internationalization

| Package                    | Description                                 |
| -------------------------- | ------------------------------------------- |
| `easy_localization`        | Load and switch between locales easily      |
| `easy_localization_loader` | YAML/CSV file loader for easy_localization |

### 🎨 UI & Assets

| Package                | Description                              |
| ---------------------- | ---------------------------------------- |
| `flutter_svg`          | Render SVG images                        |
| `lottie`               | Load and play Lottie animations          |
| `cached_network_image` | Caching for network images               |
| `google_fonts`         | Access Google Fonts in your Flutter app  |
| `flutter_screenutil`   | Screen size adaptation for responsive UI |

---

