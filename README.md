# Monthly Bills App (Under Development)

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-%23FFCA28.svg?style=for-the-badge&logo=Firebase&logoColor=black)](https://firebase.google.com/)
[![Clean Architecture](https://img.shields.io/badge/Clean%20Architecture-lightgrey?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![go_router](https://img.shields.io/badge/go_router-blueviolet?style=for-the-badge)](https://pub.dev/packages/go_router)
[![Cubit](https://img.shields.io/badge/Cubit-blue?style=for-the-badge)](https://bloclibrary.dev/#/cubit)

## Overview

This is a mobile application designed to help users track their monthly bills effectively. It aims to provide a clear and organized way to manage bills, offering features for logging expenses and generating insightful reports.

**Please note that this application is currently under active development and some features may not be fully implemented or stable.**

## Key Features (Planned & In Progress)

* **Google Login:** Secure and seamless authentication using Google Sign-In.
* **Home Screen:** A dashboard providing a summary of your current financial status.
* **Bills Registration:** Intuitive forms to add new bill with details like date, amount, and description.
* **Reports:** Visual representations of your spending habits, allowing you to understand where your money is going.

## Base Architecture

![image](https://github.com/user-attachments/assets/e6d273b3-fe94-4f8c-b968-6fc3b04813cd)



## Tech Stack

This application is being built using the following technologies and architectural patterns:

* **Flutter:** A UI toolkit by Google for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Firebase:** Google's mobile development platform, being used for:
    * **Authentication:** Secure user authentication via Firebase Authentication, specifically leveraging Google Sign-In.
* **Clean Architecture:** The application's codebase is structured following the principles of Clean Architecture to ensure separation of concerns, testability, and maintainability. This approach organizes the code into distinct layers (Entities, Use Cases, Interface Adapters, and Frameworks & Drivers), making it more robust and adaptable to future changes.
* **go\_router:** A declarative routing package for Flutter that simplifies navigation within the application. It enables type-safe routing, deep linking, and more.
* **Cubit:** A simple and predictable state management library that extends the BLoC pattern. Cubit is being used to manage the application's state in a reactive and efficient manner.
