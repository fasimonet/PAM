//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 04/01/2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @ObservedObject private var bookData = BookData()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BookContentView(books: $bookData.books)
            }
            .onAppear {
                bookData.load()
            }
        }
    }
}
