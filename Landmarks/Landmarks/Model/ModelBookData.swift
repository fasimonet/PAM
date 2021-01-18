//
//  ModelBookData.swift
//  Landmarks
//
//  Created by Fabien SIMONET on 18/01/2021.
//

import Foundation

class BookData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("api.json")
    }
    
    @Published var books: [Book] = []
    
    func load() {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=riche") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // An error occured print(error)
                print(error)
            }
            else if let data = data {
                // Data downloaded, start mapping
                print(data)
                do {
                    let result = try JSONDecoder().decode(APIResult.self, from: data)
                    DispatchQueue.main.async {
                        self.books = result.items
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let books = self?.books else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(books) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
