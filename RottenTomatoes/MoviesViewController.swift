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
    var movies: [NSDictionary] = []
    var refreshControl:UIRefreshControl!  // An optional variable
    //var movieDetail: MovieDetails
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.blackColor()
        
         // set up pull to refresh
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        //get our movie list
    var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=gk3vtrh7ue3rhug94zhw4q66&limit=20&country=us"
        
        var request = NSURLRequest(URL: NSURL(string: url))
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var object = NSJSONSerialization.JSONObjectWithData(data, options:  nil, error: nil) as NSDictionary
            
            self.movies = object["movies"] as [NSDictionary]
            self.tableView.reloadData()
        }
        // set up pull to refresh
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // our user has tapped on one of the rows
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        // Get the row data for the selected row
        println("now I'm in didSelectRow")
        var rowData: NSDictionary = self.movies[indexPath.row] as NSDictionary
       //  MovieDetails = MovieDetails.moviesWithJSON(rowData)
        var name: String = rowData["title"] as String
        var synopsis: String = rowData["synopsis"] as String
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //println("I'm at row: \(indexPath.row), section: \(indexPath.section)")
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        
        var movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        var posters = movie["posters"] as NSDictionary
        var posterUrl = posters["thumbnail"] as String
        
        cell.posterView.setImageWithURL(NSURL(string: posterUrl))
        
        //cell.textLabel!.text = "Hello, I'm at row: \(indexPath.row), section: \(indexPath.section)"
        
        return cell
    }
    
    func refresh(sender:AnyObject) {
        self.tableView.reloadData()
        self.refreshControl .endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("here in prepare for Seque")
        var movieDetailViewController: MoviesDetailViewController = segue.destinationViewController as MoviesDetailViewController
        var movieIndex = tableView!.indexPathForSelectedRow()!.row
        var selectedMovie = self.movies[movieIndex]
        
        //this dumps whole array:  println("object \(selectedMovie)")
        var myTitle: String = selectedMovie["title"] as String!
        var myYear: Int = selectedMovie["year"] as Int!
        var myMpaa: String = selectedMovie["mpaa_rating"] as String!
        var mySyn: String = selectedMovie["synopsis"] as String!
        //println("my synopsis is \(mySyn)")
        
        var ratings = selectedMovie["ratings"] as NSDictionary
        var audience = ratings["audience_score"] as Int!
        var critic = ratings["critics_score"] as Int!
        //println("my audience score is \(audience)")
        
        var posters = selectedMovie["posters"] as NSDictionary
        var myImageURL = posters["original"] as String
        
        movieDetailViewController.audience = audience
        movieDetailViewController.critic = critic
        movieDetailViewController.mySyn = mySyn
        movieDetailViewController.myTitle = myTitle
        movieDetailViewController.myYear = myYear
        movieDetailViewController.myMpaa = myMpaa
        movieDetailViewController.myImageURL = myImageURL
        
    //   abandoned moving this to an object due to time
    //     movieDetailViewController.movie = selectedMovie as MovieDetails
        
        
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
