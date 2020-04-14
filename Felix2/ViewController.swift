//
//  ViewController.swift
//  Felix2
//
//  Created by Parham Armani on 4/14/20.
//  Copyright © 2020 Parham Armani. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var movies = [[String:Any]]()
    @IBOutlet weak var tableView: UITableView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.movies = dataDictionary["results"] as! [[String:Any]]
            self.tableView.reloadData()
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data
            print(self.movies.count)

            }
            
        }
            task.resume()
            
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.movieNameLabel.text = movies[indexPath.row]["title"] as! String
        cell.movieDescLabel.text = movies[indexPath.row]["overview"] as! String
        let BasePath = "https://image.tmdb.org/t/p/w500/"
        let SecPath = movies[indexPath.row]["poster_path"] as! String
        let url = URL(string: BasePath+SecPath)
        cell.movieImageViewLabel.af_setImage(withURL:url!)
        return cell
    }

    
}
