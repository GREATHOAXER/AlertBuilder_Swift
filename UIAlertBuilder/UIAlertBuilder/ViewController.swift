//
//  ViewController.swift
//  UIAlertBuilder
//
//  Created by Hyung Seo Han on 2024/01/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    @IBAction func onTouchedAlertButton(_ sender: Any) {
        self.present(
            AlertBuilder()
                .setTitle("이것은 타이틀")
                .setMessage("이것은 메시지")
                .setProceedAction("확인", .default, {_ in
                    print("확인 누름")
                })
                .setCancelAction("취소", .destructive, { _ in
                    print("취소 누름")
                })
                .build()
            , animated: true)
    }
    
    @IBAction func onTouchedActionButton(_ sender: Any) {
        self.present(
            AlertBuilder()
                .setTitle("이것은 타이틀")
                .setMessage("이것은 메시지")
                .setPreferredStyle(.actionSheet)
                .addAction("일반 버튼", .default, { _ in
                    print("일반 버튼 누름")
                })
                .addAction("두번째 일반 버튼", .default) { _ in
                    print("두번째 일반 버튼 누름")
                }
                .addAction("빨간 버튼", .destructive)
                .addAction("취소", .cancel){ _ in
                    print("액션 버튼 -> 취소 누름")
                }
                .build()
            , animated: true)
    }
}

