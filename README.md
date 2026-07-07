# Hogwarts Characters Explorer

A small Flutter app for Harry Potter fans. You can search for characters and
see their details on a separate screen.

Demo:

<img width="400" height="901" alt="harry" src="https://github.com/user-attachments/assets/eae241a2-bffe-440d-b1a6-44f49e014c6a" />

## What it does

- Type a character's name in the search bar
- Press "Discover" and it takes you straight to a details page with their
  photo and info (house, species, patronus, etc.)
- Shows a loading state while fetching and an error message if the
  character isn't found or something goes wrong

## Built with

- Flutter / Dart
- Cubit 
- Dio
- HP-API (a free public Harry Potter API)

## Folder structure

```
lib/
├── cubit/
├── services/
├── presentation/
│   ├── screens/
│   └── widgets/
└── main.dart
```

## How to run it


```bash
flutter pub get
flutter run
```

## Purpose

This was a small project to practice using Cubit with a real API and
handling loading/success/error states properly.