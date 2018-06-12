//
//  CategoriesViewController.swift
//  Chuck Norris
//
//  Created by Kayron Cabral on 09/06/2018.
//  Copyright © 2018 Kayron Cabral. All rights reserved.
//

import UIKit
import Alamofire

class CateogoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var categories = [String]() {
        didSet {
            let hasItems = categories.count > 0
            tableView.isHidden = !hasItems
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        loadCategories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        let category = categories[indexPath.row]
        
        cell.name.text = category.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: JokeViewController.identifier, sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == JokeViewController.identifier {
            if let jokeViewController = segue.destination as? JokeViewController {
                jokeViewController.category = categories[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
    //MARK: - HTTP Request
    
    func loadCategories() {
        activityIndicator.startAnimating()
        Alamofire.request(URLS.categories).responseJSON { response in
            if let categories = response.result.value {
                self.categories = categories as! [String]
                self.tableView.reloadData()
            }
            self.activityIndicator.stopAnimating()
        }
    }
}

