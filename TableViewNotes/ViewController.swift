//
//  ViewController.swift
//  TableViewNotes
//
//  Created by JAKE KENEFICK on 10/18/23.
//

struct Book{
    var author : String
    var title : String
    var pages : Int
    var chapters : Int
}



import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var TextField: UITextField!
    
    
    
    @IBOutlet weak var tableViewOutley: UITableView!
    var numbers = [3,5,7,9,12,15]
    var books = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutley.delegate = self
        tableViewOutley.dataSource = self
        books.append(Book(author: "Seaver", title: "Figure it out", pages: 12, chapters: 2))
        books.append(Book(author: "Steven", title: "Psycho", pages: 5, chapters: 10))
        // Do any additional setup after loading the view.
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    //This populates each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
       as! CrazyCell
        cell.textLabel?.text =  "\( numbers[indexPath.row])"
        cell.detailTextLabel?.text = "Hello"
        cell.AuthorOutlet.text = books[indexPath.row].author
        cell.TitleOutlet.text = books[indexPath.row].title
        cell.PagesOutlet.text = "\(books[indexPath.row].pages)"
        cell.ChaptersOutlet.text = "\(books[indexPath.row].chapters)"
        return cell
    }
    
    @IBAction func AddAction(_ sender: UIBarButtonItem) {
     var blah = TextField.text!
        var num = Int(blah)
        if let n = num{
            numbers.append(n)
            tableViewOutley.reloadData()
        }
    }
    
}

