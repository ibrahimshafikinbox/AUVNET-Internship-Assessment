# AUVNET Internship Assessment

## 📱 Overview
A streamlined and responsive Flutter-based e-commerce application built using Clean Architecture principles and the BLoC pattern for state management. Developed as part of the AUVNET internship task to demonstrate code quality, architectural design, and modern software engineering practices.

## 🚀 Features
- 🔐 Firebase Authentication
- 📦 Firestore Cloud Database
- ☁️ Firebase Cloud Storage for images/files
 - 🧱 Clean Architecture (Presentation, Domain, Data layers)
- ⚙️ Full BLoC pattern using `flutter_bloc` with immutable states via `copyWith`
- 📲 Responsive UI following AUVNET design

## 🧱 Architecture

**Layers:**
- `Presentation`: UI, BLoC, Events, States
- `Domain`: UseCases, Entities, Abstract Repositories
- `Data`: Models, Datasources (remote/local), Repositories Implementation

**Principles:**
- Separated concerns for scalability and maintainability
- Modular folder structure
- Immutability in state management
 


1. **Clone the repository:**
 git clone https://github.com/yourusername/auvnet-internship-assessment.git
cd auvnet-internship-assessment

>>>>>>>>>>>>>>>>>>>>>>>>>>>
 video Link >>>>>>>>>>>>>>>>>>> https://drive.google.com/file/d/1kWFb9N3BKrPYqKgAuGak2j35xpyH-hPy/view?usp=sharing
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Install dependencies:

 flutter pub get


 >>>>>>>>>>>>>>>>>>>>
Run the app:

 
flutter run
