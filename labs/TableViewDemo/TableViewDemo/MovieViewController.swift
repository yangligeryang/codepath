//
//  MovieViewController.swift
//  TableViewDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit
import AFNetworking

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let names = ["Charlie", "Kingsley", "Juneau", "Norm", "Charlene", "Raechel", "Brezen", "Katy", "Bruno", "Jackson"]
    var movies: [NSDictionary] = []

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest,completionHandler: { (dataOrNil, response, error) in
            
            if let data = dataOrNil {
                if let response = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    print("response: \(response)")
                    
                    self.movies = response["results"] as! [NSDictionary]
                    self.table.reloadData()
                }
            }
        })
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        let imageSlug = movie["poster_path"] as! String
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + imageSlug)
        cell.titleLabel.text = title
        cell.overviewText.text = overview
        cell.posterImage.setImageWith(imageURL!)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
