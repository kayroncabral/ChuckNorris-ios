//
//  JokeViewController.swift
//  Chuck Norris
//
//  Created by Kayron Cabral on 11/06/2018.
//  Copyright © 2018 Kayron Cabral. All rights reserved.
//

import UIKit
import Alamofire

class JokeViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    static let identifier = "JokeViewController"
    
    var category: String!
    var joke: Joke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = category.capitalized
        loadJoke()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func loadJoke() {
        activityIndicator.startAnimating()
        Alamofire.request(URLS.randomJoke.replacingOccurrences(of: "{category}", with: "\(category!)")).responseJSON { response in
            if let joke = response.result.value as AnyObject? {
                self.joke = Joke(data: joke)
                self.loadIcon()
                
                if let value = self.joke!.value {
                    self.content.text = value
                    self.stackView.isHidden = false
                }
            }
            self.activityIndicator.stopAnimating()
        }
    }
    
    func loadIcon() {
        if let iconUrl = self.joke!.iconUrl, let url = URL(string: iconUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    self.icon.image = UIImage(data: data)
                }
            }.resume()
        }
    }

}
