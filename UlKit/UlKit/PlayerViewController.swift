// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// описывает воспроизведение трека в плейлисте
class PlayerViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var crossButton: UIButton?
    @IBOutlet var sendButton: UIButton?
    @IBOutlet var shadowImageView: UIImageView?
    @IBOutlet var albumPictureImageView: UIImageView?
    @IBOutlet var volumeIndicator: UISlider?
    @IBOutlet var backgroundImageView: UIImageView?
    @IBOutlet var songName: UILabel?
    @IBOutlet var artistName: UILabel?
    @IBOutlet var soundIndicator: UIImageView?
    @IBOutlet var trackSlider: UISlider?
    @IBOutlet var durationTrackLabel: UILabel?
    @IBOutlet var backwardImageView: UIButton?
    @IBOutlet var forwardImageView: UIButton?
    @IBOutlet var rewindImageView: UIButton?
    @IBOutlet var fastForwardImageView: UIButton?
    @IBOutlet var playbackStatusImageView: UIButton?

    // MARK: - Public Properties

    var albumPicture: UIImage?
    var songNameTitle = ""
    var artistNameTitle = ""

    // MARK: - Private Properties

    private var currentActivePlayer: AVPlayer?

    private var playerOne: AVPlayer?
    private var playerTwo: AVPlayer?

    private var isPlaying = false

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        dimensioningSubview()
        settingSubviews()
        assignsData()
        customizesPlayer()
        switchesTracks()
    }

    // MARK: - Private Methods

    private func assignsData() {
        albumPictureImageView?.image = albumPicture
        songName?.text = songNameTitle
        artistName?.text = artistNameTitle
    }

    private func dimensioningSubview() {
        crossButton?.frame = CGRect(x: 20, y: 20, width: 14, height: 14)
        sendButton?.frame = CGRect(x: 335, y: 20, width: 14, height: 14)
        shadowImageView?.frame = CGRect(x: 150, y: 3, width: 21, height: 18)
        albumPictureImageView?.frame = CGRect(x: 20, y: 470, width: 75, height: 75)
        volumeIndicator?.frame = CGRect(x: -30, y: 200, width: 100, height: 8)
        backgroundImageView?.frame = CGRect(x: 0, y: 450, width: 375, height: 400)
        songName?.frame = CGRect(x: 110, y: 475, width: 250, height: 29)
        artistName?.frame = CGRect(x: 110, y: 510, width: 250, height: 19)
        soundIndicator?.frame = CGRect(x: 330, y: 482, width: 16, height: 20)
        trackSlider?.frame = CGRect(x: 20, y: 560, width: 265, height: 8)
        durationTrackLabel?.frame = CGRect(x: 294, y: 552, width: 61, height: 21)
        backwardImageView?.frame = CGRect(x: 60, y: 607, width: 30, height: 30)
        forwardImageView?.frame = CGRect(x: 283, y: 607, width: 30, height: 30)
        rewindImageView?.frame = CGRect(x: 120, y: 610, width: 24, height: 24)
        fastForwardImageView?.frame = CGRect(x: 230, y: 610, width: 24, height: 24)
        playbackStatusImageView?.frame = CGRect(x: 165, y: 600, width: 45, height: 45)
    }

    private func settingSubviews() {
        volumeIndicator?.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        albumPictureImageView?.layer.cornerRadius = (albumPictureImageView?.frame.size.height ?? 0) / 2
        albumPictureImageView?.layer.borderWidth = 2
        albumPictureImageView?.layer.borderColor = UIColor.white.cgColor
    }

    private func customizesPlayer() {
        if let urlOne = Bundle.main.url(forResource: "rain", withExtension: "mp3") {
            let playerItem = AVPlayerItem(url: urlOne)
            playerOne = AVPlayer(playerItem: playerItem)

            currentActivePlayer = playerOne

            playerOne?.addPeriodicTimeObserver(
                forInterval: CMTime(seconds: 1, preferredTimescale: 1),
                queue: DispatchQueue.main
            ) { [weak self] time in
                if let duration = self?.playerOne?.currentItem?.duration.seconds {
                    self?.trackSlider?.value = Float(time.seconds / duration)
                }
            }
        }
        if let urlTwo = Bundle.main.url(forResource: "cat", withExtension: "mp3") {
            let playerItem = AVPlayerItem(url: urlTwo)
            playerTwo = AVPlayer(playerItem: playerItem)
            playerTwo?.addPeriodicTimeObserver(
                forInterval: CMTime(seconds: 1, preferredTimescale: 1),
                queue: DispatchQueue.main
            ) { [weak self] time in
                if let duration = self?.playerTwo?.currentItem?.duration.seconds {
                    self?.trackSlider?.value = Float(time.seconds / duration)
                }
            }
        }
    }

    private func switchesTracks() {
        if currentActivePlayer == playerOne {
            currentActivePlayer = playerTwo
            playerOne?.pause()
            playerTwo?.pause()
        } else {
            currentActivePlayer = playerOne
            playerTwo?.pause()
            playerOne?.play()
        }
    }

    // MARK: - @IBAction

    @IBAction
    private func setVolume(_ sender: UISlider) {
        let volumeValue = sender.value
        playerOne?.volume = sender.value
        playerTwo?.volume = sender.value

        if volumeValue == 0 {
            soundIndicator?.image = UIImage(named: "off")
        } else {
            soundIndicator?.image = UIImage(named: "on")
        }
    }

    @IBAction
    private func forwardTracks(_ sender: UIButton) {
        if currentActivePlayer == playerOne {
            playerOne?.pause()
            currentActivePlayer = playerTwo
            playerTwo?.play()
        } else {
            playerTwo?.pause()
            currentActivePlayer = playerOne
            playerOne?.play()
        }
    }

    @IBAction
    private func backward(_ sender: UIButton) {
        if currentActivePlayer == playerOne {
            playerOne?.pause()
            currentActivePlayer = playerTwo
            playerTwo?.play()
        } else {
            playerTwo?.pause()
            currentActivePlayer = playerOne
            playerOne?.play()
        }
    }

    @IBAction
    private func playButtonTapped(_ sender: UIButton) {
        if isPlaying {
            playerOne?.pause()
            isPlaying = false
            playbackStatusImageView?.setImage(UIImage(named: "play"), for: .normal)
        } else {
            playerOne?.play()
            isPlaying = true
            playbackStatusImageView?.setImage(UIImage(named: "pause"), for: .normal)
        }
    }

    @IBAction
    private func sliderValueChanged(_ sender: UISlider) {
        if let duration = playerOne?.currentItem?.duration.seconds {
            let timeToSeek = Double(sender.value) * duration
            let time = CMTime(seconds: timeToSeek, preferredTimescale: 1)
            playerOne?.seek(to: time)
        }
    }

    @IBAction func closesViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
