//
//  BookDetailViewController.swift
//  bookTrackerApp
//
//  Created by OWEN on 28/1/21.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var book: Book?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = book?.title
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let unWrappedBook = book,
              let url = URL(string: unWrappedBook.coverImageUrl),
              let imageData = try? Data(contentsOf: url),
              let validImage = UIImage(data: imageData)
        else {
            print("Error loading image")
            return
        }
        
        self.title = unWrappedBook.title
        imageView.image = validImage
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        switch indexPath.row {
        case 0: cell?.textLabel?.text = book.title
            <#code#>
        default:
            <#code#>
        }
        
        cell.textLabel?.text = book?.title[indexPath.row]
        cell.textLabel?.text = book?.isbn[indexPath.row]
        cell.textLabel?.text = book?.author[indexPath.row]
        cell.textLabel?.text = book?.coverImageUrl[indexPath.row]
        cell.textLabel?.text = book?.rating[indexPath.row]
        cell.textLabel?.text = book?.notes[indexPath.row]

        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
