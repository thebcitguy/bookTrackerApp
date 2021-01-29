//
//  ViewController.swift
//  bookTrackerApp
//
//  Created by OWEN on 28/1/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  let books = [
    Book(title: "To Kill a Mockingbird",
         isbn: 0446310786,
         author: "Harper Lee",
         coverImageUrl: "https://images-na.ssl-images-amazon.com/images/I/51N5qVjuKAL._SX309_BO1,204,203,200_.jpg",
         rating: 5,
         notes: "The book takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos."),
    
    Book(title: "This Book Will Save Your Life",
         isbn: 0143038745,
         author: "A.M. Homes",
         coverImageUrl: "https://images-na.ssl-images-amazon.com/images/I/51j2E+xXx+L._SX305_BO1,204,203,200_.jpg",
         rating: 4,
         notes: "This book is a vivid, uplifting, and revealing story about compassion, transformation, and what can happen if you are willing to lose yourself and open up to the world around you."),
    
    Book(title: "Harry Potter and the Prisoner of Azkaban",
         isbn: 0439136350,
         author: "J.K. Rowling",
         coverImageUrl: "https://images-na.ssl-images-amazon.com/images/I/51-rbiAIiRL._SX341_BO1,204,203,200_.jpg",
         rating: 5,
         notes: "After reading the first two books in the series, the third book in the running is highly anticipated for Harry Potter fans all around the world. The focus of the plot is on Sirius Black, the man who killed 13 people with a single curse and was said to be the heir of the Dark Lord. Just by reading, you will find the story has a beautiful unexpected twist.")
  ]
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
    
    let book = books[indexPath.row]
    
    cell.textLabel?.text = book.title
    
    guard let url = URL(string: book.coverImageUrl),
          let data = try? Data(contentsOf: url),
          let validImage = UIImage(data: data)
    else {
      print("error retrieving image from book image url.")
      return cell
    }
    
    cell.imageView?.image = validImage
    return cell
  }

    //segueing!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? BookDetailViewController,
         let index = tableView.indexPathForSelectedRow?.row {
        destination.book = books[index]
      }
    }
}

