//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.1
        
        updateQ()   //it updates the text at start of the app.
        
        
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        
        
        let userAnswer = sender.currentTitle    //Title names are either True or False
        let actualQuestion = quiz[currentQuestion]
        let correctAnswer = actualQuestion.answer    //True or False in the 2D array
        
        
        
        if(userAnswer == correctAnswer){
            sender.backgroundColor = UIColor.green
            print("You are goddamn right!")
        }else{
            sender.backgroundColor = UIColor.red
            print("You are wrong my friend...")
        }
        
        
        if(currentQuestion + 1 < quiz.count){
            currentQuestion += 1
        }else{
            currentQuestion = 0
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false)
        { _ in
            self.updateQ()
        }
        
        
        
    }
    
    func updateQ(){
        questions.text = quiz[currentQuestion].text
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        progressBar.progress = Float(currentQuestion + 1) / Float(quiz.count)
    }
}

