//
//  ContentView.swift
//  Bookworm
//
//  Created by bin li on 7/20/23.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: [
//    SortDescriptor(\.title),
//    SortDescriptor(\.author)
    NSSortDescriptor(key: "title", ascending: true),
    NSSortDescriptor(key: "author", ascending: true)
  ]) var books: FetchedResults<Book>
  @State private var showingAddScreen = false
  var body: some View {
    NavigationStack {
      List{
        ForEach(books) { book in
          NavigationLink {
            DetailView(book: book)
          } label: {
            HStack {
              EmojRatingView(rating: book.rating)
                .font(.largeTitle)
              VStack(alignment: .leading) {
                Text(book.title ?? "Unknown Title")
                  .font(.headline)
                Text(book.author ?? "Unknown Author")
                  .foregroundColor(.secondary)
              }
            }
          }
        }
        .onDelete(perform: deleteBooks(at:))
      }
      .navigationTitle("Bookworm")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            showingAddScreen.toggle()
          } label: {
            Label("Add Book", systemImage: "plus")
          }
        }
      }
      .sheet(isPresented: $showingAddScreen) {
        AddBookView()
      }
    }
  }
  func deleteBooks(at offsets: IndexSet) {
    for offset in offsets {
      let book = books[offset]
      moc.delete(book)
    }
    try? moc.save()
  }
}

#Preview {
  ContentView()
}
