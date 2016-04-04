//
//  Movie.swift
//  MovieReview
//
//  Created by Kellen Pierson on 4/4/16.
//  Copyright © 2016 Kellen Pierson. All rights reserved.
//

import Foundation

struct Movie {
    let movieTitle: String
    let ratingAndDuration: String
    let directedBy: String
    let cast: String
    let synopsis: String
    let userRating: Int
    let thumbnailName: String
}

    // Mark: Loading data from plist

extension Movie {

    static func loadAllMovies() -> [Movie] {
        return loadMoviesFromPlistNamed("movies")
    }

    private static func loadMoviesFromPlistNamed(plistName: String) -> [Movie] {
        guard
            let path = NSBundle.mainBundle().pathForResource(plistName, ofType: "plist"),
            let dictArray = NSArray(contentsOfFile: path) as? [[String : AnyObject]]
            else {
                fatalError("Error occured while reading \(plistName).plist")
        }

        var movies = [Movie]()

        for dict in dictArray {
            guard
                let movieTitle = dict["movieTitle"] as? String,
                let ratingAndDuration = dict["ratingAndDuration"] as? String,
                let directedBy = dict["directedBy"] as? String,
                let cast = dict["cast"] as? String,
                let synopsis = dict["synopsis"] as? String,
                let userRating = dict["userRating"] as? Int,
                let thumbnailName = dict["thumbnailName"] as? String
                else {
                    fatalError("Error parsing dictionary \(dict)")
            }

            let movie = Movie(
                movieTitle: movieTitle,
                ratingAndDuration: ratingAndDuration,
                directedBy: directedBy,
                cast: cast,
                synopsis: synopsis,
                userRating: userRating,
                thumbnailName: thumbnailName)

            movies.append(movie)
        }

        return movies
    }
}











