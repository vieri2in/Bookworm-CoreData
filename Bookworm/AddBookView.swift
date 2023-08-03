//
//  AddBookView.swift
//  Bookworm
//
//  Created by bin li on 7/20/23.
//

import SwiftUI

struct AddBookView: View {
  @Environment(\.managedObjectContext) var moc
  @Environment(\.dismiss) var dismiss
  @State private var title = ""
  @State private var author = ""
  @State private var rating = 3
  @State private var genre = ""
  @State private var review = ""
  let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
      NavigationStack {
        Form {
          Section {
            TextField("Name of book", text: $title)
            TextField("Author of book", text: $author)
            Picker("Genre", selection: $genre) {
              ForEach(genres, id: \.self) {
                Text($0)
              }
            }
          }
          Section("Write a review") {
            TextEditor(text: $review)
//            Picker("Rating", selection: $rating) {
//              ForEach(0..<6) {
//                Text(String($0))
//              }
//            }
          RatingView(rating: $rating)
          }
          Section {
            Button("Save") {
              let newBook = Book(context: moc)
              newBook.id = UUID()
              newBook.title = title
              newBook.author = author
              newBook.rating = Int16(rating)
              newBook.genre = genre
              newBook.review = review
              try? moc.save()
              dismiss()
            }
          }
        }
        .navigationTitle("Add Book")
      }
    }
}

#Preview {
    AddBookView()
}
