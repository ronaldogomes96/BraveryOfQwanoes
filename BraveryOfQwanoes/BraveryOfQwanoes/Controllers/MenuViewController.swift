//
//  ViewController.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 12/03/21.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {

    @IBOutlet weak var configurationButton: UIButton!
    @IBOutlet weak var startLabel: UIButton!
    var player: AVAudioPlayer?
    var isConfigPresent = false
    
    @IBOutlet weak var configView: UIView!
    @IBOutlet weak var soundLabelConfig: UILabel!
    @IBOutlet weak var notificationLabelConfig: UILabel!
    @IBOutlet weak var switchSoundConfig: UISwitch!
    @IBOutlet weak var switchNotificationConfig: UISwitch!
    @IBOutlet weak var closeConfigButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
        setConfigView()
        animateView()
        closeConfigButton.addTarget(self, action: #selector(setConfigView), for: .touchUpInside)
        configurationButton.addTarget(self, action: #selector(setConfigView), for: .touchUpInside)
        configView.layer.cornerRadius = 6
        configView.backgroundColor = .backgroundBlue
        switchSoundConfig.onTintColor = .switchOnColor
        switchNotificationConfig.onTintColor = .switchOnColor
        switchSoundConfig.tag = 1
        switchNotificationConfig.tag = 2
        switchSoundConfig.addTarget(self, action: #selector(changeSwitchValue(mySwitch:)), for: .touchUpInside)
        switchNotificationConfig.addTarget(self, action: #selector(changeSwitchValue(mySwitch:)), for: .touchUpInside)

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tap)
        startLabel.titleLabel?.font = UIFont(name: "SueEllenFrancisco", size: 20)
    }

    @objc func tapGesture() {
        if isConfigPresent {
            let controller = GameViewController()
            controller.modalPresentationStyle = .fullScreen
            controller.menuControllerReference = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func animateView() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [.autoreverse, .repeat]) { [self] in
            startLabel.alpha = 0.2
            startLabel.alpha = 1
        }

    }
    
    @objc func setConfigView() {
        configView.isHidden = !configView.isHidden
        soundLabelConfig.isHidden = !soundLabelConfig.isHidden
        notificationLabelConfig.isHidden = !notificationLabelConfig.isHidden
        switchSoundConfig.isHidden = !switchSoundConfig.isHidden
        switchNotificationConfig.isHidden = !switchNotificationConfig.isHidden
        closeConfigButton.isHidden = !closeConfigButton.isHidden
        isConfigPresent = !isConfigPresent
        setSwitch()
    }

    func setSwitch() {
        let soundEnable = UserDefaults.standard.bool(forKey: "Sound")
        let notificationEnable = UserDefaults.standard.bool(forKey: "Notification")
        if soundEnable {
            switchSoundConfig.isOn = true
        } else {
            switchSoundConfig.isOn = false
        }
        
        if notificationEnable {
            switchNotificationConfig.isOn = true
        } else {
            switchNotificationConfig.isOn = false
        }
        
    }
    
    @objc func changeSwitchValue(mySwitch: UISwitch) {
        if mySwitch.tag == 1 {
            if mySwitch.isOn {
                UserDefaults.standard.setValue(true, forKey: "Sound")
                playSound()
            } else {
                UserDefaults.standard.setValue(false, forKey: "Sound")
                playSound()
            }
        } else {
            if mySwitch.isOn {
                UserDefaults.standard.setValue(true, forKey: "Notification")
            } else {
                UserDefaults.standard.setValue(false, forKey: "Notification")
            }
        }
    }
    
    func stopSound() {
        player?.stop()
    }

    func playSound() {
        let soundEnable = UserDefaults.standard.bool(forKey: "Sound")
        if soundEnable {
            guard let url = Bundle.main.url(forResource: "startMusic", withExtension: "mp3") else { return }

                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                    /* iOS 10 and earlier require the following line:
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                    guard let player = player else { return }
                    player.volume = 0.5
                    player.numberOfLoops = -1

                    player.play()

                } catch let error {
                    print(error.localizedDescription)
                }
        } else {
            stopSound()
        }
    }
}
