//
//  Book.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import Foundation
import SwiftUI

struct ImageLinks: Hashable, Codable {
    var smallThumbnail: String
}

struct VolumeInfo: Hashable, Codable {
    var title: String
    var imageLinks: ImageLinks
}

struct Book: Hashable, Codable, Identifiable {
    var id: String
    var volumeInfo: VolumeInfo
}
