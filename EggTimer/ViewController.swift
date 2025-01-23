//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5;
//    let mediumTime = 7;
//    let hardTime = 12;
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium":4, "Hard": 7]
    
    var secondsRemaining = 60
    var targetSeconds = 0
    var timer = Timer()
    var timePassed = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func eggBtnPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        let hardness = sender.currentTitle!
        resetSetting()
        
        switch hardness {
        case "Soft":
            print(eggTimes["Soft"]!)    // title이 nil일 수 있기에 강제 언래핑 해준다
            secondsRemaining = eggTimes["Soft"]!
            targetSeconds = eggTimes["Soft"]!
        case "Medium":
            print(eggTimes["Medium"]!)
            secondsRemaining = eggTimes["Medium"]!
            targetSeconds = eggTimes["Medium"]!
        default:
            print(eggTimes["Hard"]!)
            secondsRemaining = eggTimes["Hard"]!
            targetSeconds = eggTimes["Hard"]!

        }
    }
    
    func resetSetting(){    // 설정 초기화 함수
        progressBar.progress = 0.0
        progressBar.tintColor = UIColor.systemYellow

        timePassed = 0
        targetSeconds = 0
        setTimer()
    }
    
    
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }

    @objc func updateTimer() {   // 매 시간 간격마다 실행하는 코드
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            stateLabel.text = String(secondsRemaining)
            timePassed += 1
//            progressBar.progress = timePassed / Float(targetSeconds)
            progressBar.setProgress(timePassed / Float(targetSeconds), animated: true)  // 애니메이션 추가 가능(부드럽게)
            print(progressBar.progress)
            secondsRemaining -= 1
        } else {
            progressBar.tintColor = .red
            stateLabel.text = "Done!!!"
            timer.invalidate()

        }
    }
    
}
