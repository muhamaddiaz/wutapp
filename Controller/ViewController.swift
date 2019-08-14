//
//  ViewController.swift
//  wutapp
//
//  Created by Muhamad Diaz on 03/08/19.
//  Copyright © 2019 Muhamad Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PertanyaanLabel: UILabel!
    
    var QuestionList = QuestionBank()
    var currentAnswer = false;
    var currentQuestion = 0;
    var userScore = 0;
    var progress : Float = 0;
    @IBOutlet weak var hitungJawaban: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        if(sender.tag == 0) {
            currentAnswer = true
        } else if(sender.tag == 1) {
            currentAnswer = false
        }
        
        checkAnswer()
        
    }
    
    func nextQuestion() {
        if(currentQuestion < (QuestionList.QuestionList.count - 1)) {
            progress += (1 / Float(QuestionList.QuestionList.count))
            currentQuestion += 1
            updateUI()
        } else {
            progress += (1 / Float(QuestionList.QuestionList.count))
            updateUI()
            displayRetryAlert()
        }
    }
    
    func checkAnswer() {
        if(currentAnswer == QuestionList.QuestionList[currentQuestion].answer) {
            userScore += 2
            nextQuestion()
        } else {
            userScore -= 1
            displayErrorAlert()
            updateUI()
        }
    }
    
    func updateUI() {
        PertanyaanLabel.text = QuestionList.QuestionList[currentQuestion].text
        score.text = String(userScore)
        hitungJawaban.text = "\(currentQuestion + 1)/\(QuestionList.QuestionList.count)"
        progressBar.progress = progress
    }
    
    func displayRetryAlert() {
        let alert = UIAlertController(title: "Selesai", message: "skor anda adalah \(userScore),apakan ingin mengulang?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ulangi", style: .default, handler: { (_) in
            self.currentQuestion = 0
            self.userScore = 0
            self.progress = 0
            self.updateUI()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayErrorAlert() {
        let alert = UIAlertController(title: "Jawaban Salah!", message: "skor dikurang 1", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tutup", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

