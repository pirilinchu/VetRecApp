//
//  VetAppApp.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI

@main
struct VetAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabsView()
        }
    }
}

//App/
//│
//├── App.swift
//├── Root/
//│   ├── RootTabsView.swift
//│   ├── AppContainer.swift
//│   └── DeepLinkHandler.swift
//│
//├── Core/
//│   ├── Navigation/
//│   │   ├── Router.swift
//│   │   ├── Routes.swift
//│   │   └── NavigationProtocols.swift
//│   │
//│   ├── Networking/
//│   │   ├── APIClient.swift
//│   │   ├── Endpoints.swift
//│   │   └── NetworkError.swift
//│   │
//│   ├── Database/
//│   │   ├── Realm/
//│   │   │   ├── RealmConfiguration.swift
//│   │   │   ├── PostObject.swift
//│   │   │   └── RealmPostsStore.swift
//│   │   └── DatabaseProtocols.swift
//│   │
//│   ├── Analytics/
//│   │   └── Analytics.swift
//│   │
//│   └── Extensions/
//│
//├── Features/
//│   ├── Home/
//│   │   ├── Domain/
//│   │   │   ├── Post.swift
//│   │   │   └── HomeUseCases.swift
//│   │   │
//│   │   ├── Data/
//│   │   │   ├── PostsRepository.swift
//│   │   │   ├── CachedPostsRepository.swift
//│   │   │   └── RemotePostsDataSource.swift
//│   │   │
//│   │   ├── Presentation/
//│   │   │   ├── HomeView.swift
//│   │   │   ├── HomeViewModel.swift
//│   │   │   └── HomeNavHost.swift
//│   │   │
//│   │   └── Components/
//│   │
//│   ├── Search/
//│   │   ├── Domain/
//│   │   ├── Data/
//│   │   └── Presentation/
//│   │
//│   └── Profile/
//│       ├── Domain/
//│       ├── Data/
//│       └── Presentation/
//│
//└── Shared/
//    ├── UI/
//    ├── Components/
//    └── Helpers/
