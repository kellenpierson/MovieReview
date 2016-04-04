//
//  MoviesViewController.swift
//  MovieReview
//
//  Created by Kellen Pierson on 4/4/16.
//  Copyright © 2016 Kellen Pierson. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movie Review"

        movies = Movie.loadAllMovies()

        // Eliminate the empty table cells from the view
        tableView.tableFooterView = UIView()

    }


    // MARK: - Table View Delegate Methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as UITableViewCell

        let movie = movies[indexPath.row]

        cell.textLabel?.text = movie.movieTitle
        cell.detailTextLabel?.text = movie.ratingAndDuration
        cell.imageView?.image = UIImage(named: movie.thumbnailName)

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let selectedCell = sender as? UITableViewCell, selectedRowIndex = tableView.indexPathForCell(selectedCell)?.row
            where segue.identifier == "showMovieInfoVC" else {
                fatalError("sender is not a UITableViewCell or was not found in the tableView, or segue.identifier is incorrect")
        }

        let movie = movies[selectedRowIndex]
        let destinationViewController = segue.destinationViewController as! MovieViewController
        destinationViewController.movie = movie
    }

}
