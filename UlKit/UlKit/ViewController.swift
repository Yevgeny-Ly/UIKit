// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает экран где находится начальный плейлист
final class ViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var playlistLabel: UILabel!
    @IBOutlet var firstPerformerImageView: UIImageView?
    @IBOutlet var firstExecutorLabel: UILabel?
    @IBOutlet var firstTrackTitleLabel: UILabel?
    @IBOutlet var firstDurationTrackLabel: UILabel?
    @IBOutlet var firstLineView: UIView!

    @IBOutlet var secondPerformerImageView: UIImageView?
    @IBOutlet var secondExecutorLabel: UILabel?
    @IBOutlet var secondTrackTitleLabel: UILabel?
    @IBOutlet var secondDurationTrackLabel: UILabel?
    @IBOutlet var secondLineView: UIView!

    @IBOutlet var thirdPerformerImageView: UIImageView?
    @IBOutlet var thirdExecutorLabel: UILabel?
    @IBOutlet var thirdTrackTitleLabel: UILabel?
    @IBOutlet var thirdDurationTrackLabel: UILabel?
    @IBOutlet var thirdLineView: UIView?

    // MARK: - Public Properties

    let songTitle: String? = "Let it Be"
    let artistTitle: String? = "The Beatles"

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        dimensioningSubview()
    }

    // MARK: - Public Methods

    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if let image = firstPerformerImageView?.image,
           let songName = songTitle,
           let artistTitle = artistTitle
        {
            if let playerViewController = storyboard?
                .instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController
            {
                playerViewController.albumPicture = image
                playerViewController.songNameTitle = songName
                playerViewController.artistNameTitle = artistTitle
                present(playerViewController, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Private Methods

    private func dimensioningSubview() {
        playlistLabel.frame = CGRect(x: 155, y: 47, width: 175, height: 22)

        firstPerformerImageView?.frame = CGRect(x: 20, y: 100, width: 75, height: 75)
        firstExecutorLabel?.frame = CGRect(x: 103, y: 112, width: 175, height: 19)
        firstTrackTitleLabel?.frame = CGRect(x: 103, y: 139, width: 200, height: 19)
        firstDurationTrackLabel?.frame = CGRect(x: 303, y: 128, width: 52, height: 19)
        firstLineView?.frame = CGRect(x: 20, y: 183, width: 335, height: 1)

        secondPerformerImageView?.frame = CGRect(x: 20, y: 202, width: 75, height: 75)
        secondExecutorLabel?.frame = CGRect(x: 103, y: 214, width: 175, height: 19)
        secondTrackTitleLabel?.frame = CGRect(x: 103, y: 241, width: 200, height: 19)
        secondDurationTrackLabel?.frame = CGRect(x: 303, y: 230, width: 52, height: 19)
        secondLineView?.frame = CGRect(x: 20, y: 285, width: 335, height: 1)

        thirdPerformerImageView?.frame = CGRect(x: 20, y: 305, width: 75, height: 75)
        thirdExecutorLabel?.frame = CGRect(x: 103, y: 316, width: 175, height: 19)
        thirdTrackTitleLabel?.frame = CGRect(x: 103, y: 343, width: 200, height: 38)
        thirdDurationTrackLabel?.frame = CGRect(x: 303, y: 332, width: 52, height: 19)
        thirdLineView?.frame = CGRect(x: 20, y: 387, width: 335, height: 1)
    }

    @IBAction func tapFirstTrack(_ sender: Any) {
        if let playerViewController = storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") {
            present(playerViewController, animated: true, completion: nil)
        }
    }

    @IBAction func tapSecondTrack(_ sender: Any) {
        if let playerViewController = storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") {
            present(playerViewController, animated: true, completion: nil)
        }
    }

    @IBAction func tapThirdTrack(_ sender: Any) {
        if let playerViewController = storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") {
            present(playerViewController, animated: true, completion: nil)
        }
    }
}
