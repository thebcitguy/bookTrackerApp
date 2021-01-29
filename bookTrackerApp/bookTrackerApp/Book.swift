class Book {
  var title: String
  var isbn: String
  var author: String
  var coverImageUrl: String
  var rating: Int
  var notes: String?
  
  init(title: String, isbn: String, author: String, coverImageUrl: String, rating: Int, notes: String?) {
    self.title = title
    self.isbn = isbn
    self.author = author
    self.coverImageUrl = coverImageUrl
    self.rating = rating
    self.notes = notes
  }
}

//Model: Book
