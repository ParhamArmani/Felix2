//
//  MovieDetailViewController.swift
//  Felix2
//
//  Created by Parham Armani on 4/20/20.
//  Copyright © 2020 Parham Armani. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieDetailViewController: UIViewController {
    @IBOutlet weak var backdropView: UIImageView!
    var movie : [String:Any]!
    
    @IBOutlet weak var posterView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsisLable: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit();
        synopsisLable.text = movie["overview"] as? String
        synopsisLable.sizeToFit()
        let BasePath = "https://image.tmdb.org/t/p/w500/"
        let SecPath = movie["poster_path"] as! String
        let url = URL(string: BasePath+SecPath)
        let BackDrop_BasePath = "https://image.tmdb.org/t/p/w780/"
        let BackDrop_SecPath = movie["backdrop_path"] as! String
        let BackDrop_url = URL(string: BackDrop_BasePath+BackDrop_SecPath)
        posterView.af_setImage(withURL:url!)
        backdropView.af_setImage(withURL:BackDrop_url!)

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
