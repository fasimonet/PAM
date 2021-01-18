//
//  BookRow.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    
    var body: some View {
        HStack {
            /*Image("http://books.google.com/books/content?id=8ewFubTO98gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")
                .resizable()
                .frame(width: 25, height: 50)*/
            Text(book.volumeInfo.title)
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BookRow(book: Book(id: "1",
                               volumeInfo: VolumeInfo(title: "Titre",
                                                      imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=8ewFubTO98gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"))))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
