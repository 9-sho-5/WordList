//
//  QuestionViewController.swift
//  WordList
//
//  Created by Kusunose Hosho on 2020/05/12.
//  Copyright © 2020 Kusunose Hosho. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false //回答したか、次の質問へいくかの判定
    
    var wordArray: [Dictionary<String, String>] = [] //UserDefaultsからとる配列
    
    var nowNumber: Int = 0 //現在の回答数
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {  //画面が最初に呼び出された時にどのような動作をすかどうかの記述
        super.viewDidLoad()
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]     //配列データをUserDefaultsから取得し、その配列の中身をshuffleメソッドでシャッフルする
        
        //問題をシャッフルする
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped () {
        //回答したか
        if isAnswered {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArray.count {
                questionLabel.text = wordArray[nowNumber]["english"]
                
                isAnswered = false
                
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = wordArray[nowNumber]["japanese"]
            
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
