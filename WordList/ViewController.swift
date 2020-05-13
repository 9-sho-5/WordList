//
//  ViewController.swift
//  WordList
//
//  Created by Kusunose Hosho on 2020/05/12.
//  Copyright © 2020 Kusunose Hosho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // FinishViewControllerまで行ったときスタート画面に戻ってくるためのメソッド
    @IBAction func back(sender: UIStoryboardSegue) {
        
    }
    
    //スタートボタンをした時の処理
    @IBAction func startButtonTapped() {
        let saveData = UserDefaults.standard //UserDefaultsは記憶メモリ上に情報を記録する仕組み(データを貯める倉庫のようなもの)倉庫にデータを書き込んだり、読み込んだりできる
        if saveData.array(forKey: "WORD") != nil {      //savaDataというUserDefaults型からWORDというキーを使って配列があるのかチェックする
            //配列があれば質問のビューに、配列がなければ単語登録を促すアラートを表示する
            if saveData.array(forKey: "WORD")!.count > 0 {
                performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        } else {
            let alert = UIAlertController (
                title: "単語",
                
                message: "まずは「単語一覧」をタップして単語を登録してください。",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            
            self.present(alert, animated: true, completion: nil)
        }

    }

}
