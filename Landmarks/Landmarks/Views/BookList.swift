//
//  BookList.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import SwiftUI

struct BookList: View {
    @Binding var books: [Book]
    
    var filteredBooks: [Book] {
        books.filter { book in
            true
        }
    }
    
    var body: some View {
        List(books) { book in
            NavigationLink(destination: BookDetail(book: binding(for: book))) {
                BookRow(book: book)
            }
        }
        .navigationTitle("Books")
    }
    
    private func binding(for book: Book) -> Binding<Book> {
        guard let bookIndex = books.firstIndex(where: { $0.id == book.id }) else {
            fatalError("Can't find book in array")
        }
        return $books[bookIndex]
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList(books: .constant([]))
    }
}
