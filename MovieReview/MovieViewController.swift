//
//  MovieViewController.swift
//  MovieReview
//
//  Created by Kellen Pierson on 4/4/16.
//  Copyright © 2016 Kellen Pierson. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var movie: Movie!

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingAndDurationLabel: UILabel!
    @IBOutlet weak var directedByLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var synopsisHideOrShowButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!

    var shouldHideSynopsisSetting: Bool {
        get {
            return NSUserDefaults.standardUserDefaults().boolForKey("shouldHideSynopsis")
        }
        set {
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: "shouldHideSynopsis")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = ""

        movieTitleLabel.text = movie.movieTitle
        ratingAndDurationLabel.text = movie.ratingAndDuration
        directedByLabel.text = movie.directedBy
        castLabel.text = movie.cast
        synopsisLabel.text = movie.synopsis
        ratingLabel.text = String(count: movie.userRating, repeatedValue: "⭐️")

        updateSynopsisViews(hideSynopsis: shouldHideSynopsisSetting, animated: false)
    }


    // MARK: - Show Or Hide Button

    @IBAction func synopsisHideOrShowButtonTapped(sender: UIButton) {
        let shouldHideSynopsis = sender.titleLabel!.text! == "Hide"
        updateSynopsisViews(hideSynopsis: shouldHideSynopsis, animated: true)
        shouldHideSynopsisSetting = shouldHideSynopsis
    }

    func updateSynopsisViews(hideSynopsis shouldHideSynopsis: Bool, animated: Bool) {
        let newButtonTitle = shouldHideSynopsis ? "Show" : "Hide"
        synopsisHideOrShowButton.setTitle(newButtonTitle, forState: .Normal)

        if animated {
            UIView.animateWithDuration(0.3) {
                self.synopsisLabel.hidden = shouldHideSynopsis
            }
        } else {
            synopsisLabel.hidden = shouldHideSynopsis
        }
    }

}
