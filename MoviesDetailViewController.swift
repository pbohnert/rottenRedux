//
//  MoviesDetailViewController.swift
//  
//
//  Created by Peter Bohnert on 9/25/14.
//
//

import UIKit

class MoviesDetailViewController: UIViewController {
    @IBOutlet weak var scroller: UIScrollView!
    
   // var movie: MovieDetails
    var audience: Int = 0
    var critic: Int = 0
    var mySyn: String = ""
    var myTitle: String = ""
    var myYear: Int = 0
    var myMpaa: String = ""
    var myImageURL: String = ""
    
    @IBOutlet weak var largeImage: UIImageView!
    
    @IBOutlet weak var titleYear: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    
 //   required init(coder aDecoder: NSCoder) {
   //     super.init(coder: aDecoder)
   // }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("starting the detail view")
        scroller.scrollEnabled = true
        scroller.contentSize = CGSizeMake(320, 800)
        
        titleYear.text = "This is my title" + " (" + "2004" + ")"
        score.text = "Critics score: 94"
        rating.text = "G"
        synopsis.text = "Once upon a time in the west there was an amazing list of titles that could not be believed as they were just sooooo amazing"
        
        titleYear.text  = myTitle  + " (\(myYear)" + ")" as String
        rating.text = myMpaa as String
    
        score.text = "Critics score:" + " \(critic)" + ", Audience score:" + " \(audience)"
        synopsis.text = mySyn
        largeImage.setImageWithURL(NSURL(string: myImageURL))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
