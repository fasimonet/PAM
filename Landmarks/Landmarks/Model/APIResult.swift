//
//  APIResult.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import Foundation

struct APIResult: Hashable, Codable {
    var totalItems: Int
    var items: [Book]
}
