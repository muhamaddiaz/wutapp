//
//  QuestionBank.swift
//  wutapp
//
//  Created by Muhamad Diaz on 12/08/19.
//  Copyright © 2019 Muhamad Diaz. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var QuestionList = [Question]()
    
    init() {
        QuestionList.append(Question(text: "Apakah presiden indonesia pertama adalah soekarno?", answer: true))
        QuestionList.append(Question(text: "Apakah Indonesia merdeka tahun 1955?", answer: false))
        QuestionList.append(Question(text: "Apakah Swift bahasa pemrograman?", answer: true))
        QuestionList.append(Question(text: "Apakah haji Umuh manager persib?", answer: true))
        QuestionList.append(Question(text: "Bumi itu datar?", answer: false))
        QuestionList.append(Question(text: "Bumi itu bulat?", answer: true))
    }
}
