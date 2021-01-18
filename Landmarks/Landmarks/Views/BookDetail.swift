//
//  BookDetail.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import SwiftUI

struct BookDetail: View {
    @Binding var book: Book
    
    var body: some View {
        ScrollView {
            /*
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            */
            
            VStack(alignment: .leading) {
                Text(book.volumeInfo.title)
                    .font(.title)
            }
            .padding()
        }
        .navigationTitle(book.volumeInfo.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: .constant(Book(id: "1",
                                        volumeInfo: VolumeInfo(title: "Titre",
                                                   imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=8ewFubTO98gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))))
    }
}
