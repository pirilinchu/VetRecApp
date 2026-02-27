# 🚀 VetApp

> A SwiftUI-based iOS application that allows users to create and manage pet medication entries using a clean and scalable MVVM architecture. (Please read the improvements part, as I am aware of what is missing, didnt want to make the app too big) The app is more like a snapshot of what what the real one can be

---

## 📱 Overview

- Add new medication entries
- View history of saved medications
- Local persistence using Realm
- Typed navigation with enum-based Router
- Design system based UI with a local framework

---

## 🧠 Architecture

The project follows a structured and scalable architecture:

- Pattern: MVVM + UseCases + Repository
- UI: SwiftUI + Design System
- Navigation: Router + NavigationStack (typed enum routes)
- Concurrency: async/await
- Persistence: Realm (local database)
- Dependency Injection: Constructor-based (AppContainer)

### Key Principles

- Views are dumb (UI only), created the first item by hand and then filled the rest with gpt and clear prompts.
- ViewModels handle UI state and user actions.
- UseCases contain business logic.
- Repository abstracts persistence.
- Router centralizes navigation logic.

---

## 🏗 Project Structure

```
App/
├── Root/
│   ├── RootTabsView.swift
│   └── AppContainer.swift
├── Core/
│   └── Navigation/
│       ├── Router.swift
│       └── Routes.swift
|   └── Persistence/
|       └── MedicationStore.swift
├── Features/
│   ├── Home/
│   ├── Medication/
│   └── History/
```

---

## 💾 Persistence

- Data is stored locally using Realm. I dndnt focus on the Realm part only on the useCases and repositories
- UUID is used as the domain identifier.
- Added some key functionalities to the db protocol that where not used like filter by petName.

---

## ⚙️ Requirements

- Xcode 16+
- iOS 17+

---

## 🚀 Setup

```bash
git clone [repository-url]
cd [project-folder]
open VetApp.xcodeproj
```

Build and run with:

```
⌘ + R
```

---

## 🔮 Possible Improvements

- The medication sharing part was left out of this version, I consider it to be a great feature but for implementing it on the right way it should be handled with universal links(Added a todo there)
- Some TODO: where added please check them on the app for more context
- Add unit tests for ViewModels and UseCases (I left almost everything with mocked repos for previews but then I had to start commenting so I can end the app and go to sleep)
- Add another layer between the Realm implementation and the App, maybe creating another Local Framework and use Generics instead of the Medication model.
- Improvements on the localize part, also the UI Design System got short, only one component was added (Need to add TextStyles, buttons, etc. Just added as a POC, so you guy can see what my plan was)
- Of course adding the networking layer and its own useCases so I can follow the remote first approach

---

## 👤 Author

Santiago Mendoza  
Senior iOS Engineer
