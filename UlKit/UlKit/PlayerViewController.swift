// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class PlayerViewController: UIViewController {
    @IBOutlet var crossButton: UIButton?
    @IBOutlet var sendButton: UIButton?
    @IBOutlet var shadowImageView: UIImageView?
    @IBOutlet var volumeIndicator: UISlider?
    @IBOutlet var backgroundImageView: UIImageView?
    @IBOutlet var songName: UILabel?
    @IBOutlet var artistName: UILabel?
    @IBOutlet var soundIndicator: UIImageView?
    @IBOutlet var trackSlider: UISlider?
    @IBOutlet var durationTrackLabel: UILabel?
    @IBOutlet var backwardImageView: UIImageView?
    @IBOutlet var forwardImageView: UIImageView?
    @IBOutlet var rewindImageView: UIImageView?
    @IBOutlet var fastForwardImageView: UIImageView?
    @IBOutlet var playbackStatusImageView: UIImageView?

    var songTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        dimensioningSubview()
    }

    private func dimensioningSubview() {
        crossButton?.frame = CGRect(x: 20, y: 20, width: 14, height: 14)
        sendButton?.frame = CGRect(x: 335, y: 20, width: 14, height: 14)
        shadowImageView?.frame = CGRect(x: 150, y: 3, width: 21, height: 18)
        volumeIndicator?.frame = CGRect(x: 14, y: 310, width: 100, height: 8)
        backgroundImageView?.frame = CGRect(x: 0, y: 450, width: 375, height: 291)
        songName?.frame = CGRect(x: 145, y: 470, width: 250, height: 29)
        artistName?.frame = CGRect(x: 145, y: 495, width: 250, height: 19)
        soundIndicator?.frame = CGRect(x: 330, y: 475, width: 16, height: 20)
        trackSlider?.frame = CGRect(x: 20, y: 560, width: 265, height: 8)
        durationTrackLabel?.frame = CGRect(x: 294, y: 552, width: 61, height: 21)
        backwardImageView?.frame = CGRect(x: 60, y: 607, width: 30, height: 30)
        forwardImageView?.frame = CGRect(x: 283, y: 607, width: 30, height: 30)
        rewindImageView?.frame = CGRect(x: 120, y: 610, width: 24, height: 24)
        fastForwardImageView?.frame = CGRect(x: 230, y: 610, width: 24, height: 24)
        playbackStatusImageView?.frame = CGRect(x: 165, y: 600, width: 45, height: 45)
    }
}
