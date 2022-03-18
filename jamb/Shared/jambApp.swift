//
//  jambApp.swift
//  Shared
//
//  Created by Domagoj Bunoza on 17.03.2022..
//

import SwiftUI

@main
struct jambApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = HomeScreenViewModel()
            HomeScreen(viewModel: viewModel)
        }
    }
}
