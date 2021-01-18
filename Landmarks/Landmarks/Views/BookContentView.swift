//
//  BookContentView.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import SwiftUI

struct BookContentView: View {
    @Binding var books: [Book]
    
    var body: some View {
        BookList(books: $books)
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookContentView(books: .constant([]))
        }
    }
}
