//
//  PlayerViewController.swift
//  NetflixStApp
//
//  Created by chxhyxn on 2022/05/27.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.closeButton.alpha = 0.5
        playerView.player = player
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        play()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
        pause()
        player.replaceCurrentItem(with: nil)
    }
    
    @IBAction func togglePlayButton(_ sender: Any) {
        if player.isPlaying {
            pause()
        }else {
            play()
        }
    }
    
    func pause() {
        player.pause()
        playButton.isSelected = false
    }
    
    func play() {
        player.play()
        playButton.isSelected = true
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else {
            return false
        }
        return self.rate != 0
    }
}
