//
//  MovieDetailViewController.swift
//  RottenTomatoes
//
//  Created by Peter Bohnert on 10/14/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollingView: UIScrollView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleYearLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var posterImageURL: String = ""
    var audience: Int = 0
    var critic: Int = 0
    var synopsis: String = ""
    var myTitle: String = ""
    var year: Int = 0
    var rating: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = myTitle
        setViewColor()
        
        posterImageView.setImageWithURL(NSURL(string: posterImageURL))
        titleYearLabel.text = myTitle  + " (\(year)" + ")"
        ratingLabel.text = "\(rating)"
        
        scoreLabel.text = "Critics score:" + " \(critic)" + ", Audience score:" + " \(audience)"
        synopsisLabel.text = synopsis
        synopsisLabel.sizeToFit()
        
        // Set up views sizes
        self.scrollingView.scrollEnabled = true
        self.contentView.frame = CGRectMake(CGRectGetMinX(self.contentView.frame), CGRectGetMinY(self.contentView.frame), CGRectGetWidth(self.contentView.frame), CGRectGetMaxY(self.synopsisLabel.frame) + 10)
        
        self.scrollingView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollingView.frame), CGRectGetMaxY(self.contentView.frame))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setViewColor() {
        
        self.contentView.backgroundColor = UIColor.blackColor()
        self.scrollingView.backgroundColor = UIColor.blackColor()
        self.contentView.tintColor = UIColor.whiteColor()
        titleYearLabel.textColor = UIColor.whiteColor()
        scoreLabel.textColor = UIColor.whiteColor()
        ratingLabel.textColor = UIColor.whiteColor()
        synopsisLabel.textColor = UIColor.whiteColor()
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
