//
//  MoviesViewController.swift
//  RottenTomatoes
//
//  Created by Peter Bohnert on 9/21/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var movieDetails =  [MovieDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.blackColor()

    var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=gk3vtrh7ue3rhug94zhw4q66&limit=20&country=us"
        
        var request = NSURLRequest(URL: NSURL(string: url))
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var object = NSJSONSerialization.JSONObjectWithData(data, options:  nil, error: nil) as NSDictionary
            self.movieDetails = MovieDetails.moviesWithJSON(object["movies"] as NSArray)
            self.tableView.backgroundColor = UIColor.blackColor()
            self.tableView.reloadData()

        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieDetails.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        
        let movie = self.movieDetails[indexPath.row] as MovieDetails
        
        cell.titleLabel.text = movie.title
        cell.synopsisLabel.text = movie.synopsis
        cell.backgroundColor = UIColor.blackColor()
        cell.titleLabel.textColor = UIColor.whiteColor()
        cell.synopsisLabel.textColor = UIColor.whiteColor()
        //cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        //cell.selectedBackgroundView.backgroundColor = UIColor(white: 0.8, alpha: 0.4)
        
        var posterUrl = movie.thumbnailImageURL as String
        
        cell.posterView.setImageWithURL(NSURL(string: posterUrl))
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
