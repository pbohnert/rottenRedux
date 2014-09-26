//
//  MovieDetails.swift
//  
//
//  Created by Peter Bohnert on 9/26/14.
//
//

import UIKit

class MovieDetails: NSObject {
    var title: String
    var year: String
    var thumbnailImageURL: String
    var largeImageURL: String
    var critic_score: String
    var audience_score: String
    var rating: String
    var synopsis: String
    
    init(name: String, year: String, thumbnailImageURL: String, largeImageURL: String, critic_score: String, audience_score: String, rating: String, synopsis: String) {
        self.title = name
        self.year = year
        self.thumbnailImageURL = thumbnailImageURL
        self.largeImageURL = largeImageURL
        self.rating = rating
        self.synopsis = synopsis
        self.critic_score = critic_score
        self.audience_score = audience_score
    }
    
  
   
}
