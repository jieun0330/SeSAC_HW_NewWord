//
//  ViewController.swift
//  SeSAC_HW_NewWord
//
//  Created by 박지은 on 12/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var searchBar: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    @IBOutlet var resultScreen: UIImageView!
    @IBOutlet var resultContent: UILabel!
    
    let keywords = ["삼귀자", "윰차", "실매", "만만잘부"]
    let keyDic = ["삼귀자": "연애를 시작하기 전 썸단계!",
                  "윰차": "유명과 무명의 차이란다,,",
                  "실매": "실시간,, 매일매일,, 몰라,,",
                  "만만잘부": "만만하게 잘 부지런히 모른다고"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bar()
        searchClicked()
        keywordButton(firstButton, title: "삼귀자")
        keywordButton(secondButton, title: "윰차")
        keywordButton(thirdButton, title: "실매")
        keywordButton(fourthButton, title: "만만잘부")
        resultScreen.image = .wordLogo
        resultContent.text = ""
    }
    
    //Mark: - 검색 TextField
    func bar() {
        searchBar.placeholder = "신조어를 검색해주세요"
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.borderWidth = 2
        searchBar.layer.cornerRadius = 0
        searchBar.frame.size.height = 35
        searchBar.keyboardType = .default
    }
    
    //Mark: - 검색 시
    @IBAction func searchButtonClicked(_ sender: UITextField) {
        resultScreen.image = .background
        guard let input = searchBar.text else { return }
        if keywords.contains(input) {
            resultContent.text = keyDic[input]
        } else {
            resultContent.text = "\(searchBar.text!)에 대한 검색결과는 없습니다"
        }
        view.endEditing(true)
    }
    
    //Mark: - 삼귀자
    @IBAction func firstButtonClicked(_ sender: UIButton) {
        keywordClicked(button: sender, content: "연애를 시작하기 전 썸단계!")
    }
    
    //Mark: - 윰차
    @IBAction func secondButtonClicked(_ sender: UIButton) {
        keywordClicked(button: secondButton, content: "유명과 무명의 차이란다,,")
    }
    
    //Mark: - 실매
    @IBAction func thirdButtonClicked(_ sender: UIButton) {
        keywordClicked(button: thirdButton, content: "실시간,, 매일매일,, 몰라,,")
    }
    
    //Mark: - 만만잘부
    @IBAction func fourthButton(_ sender: UIButton) {
        keywordClicked(button: fourthButton, content: "만만하게 잘 부지런히 모른다고")
    }
    
    //Mark: - 검색 버튼 클릭 시
    func searchClicked() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.setTitle("", for: .normal)
    }
    
    //Mark: - 신조어
    func keywordButton(_ sender: UIButton, title: String) {
        sender.setTitle(title, for: .normal)
        sender.setTitleColor(.black, for: .normal)
        sender.layer.cornerRadius = 5
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 1
        sender.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    }
    
    //Mark: - 신조어 버튼 클릭 시
    func keywordClicked(button: UIButton, content: String) {
        resultScreen.image = .background
        searchBar.text = button.currentTitle
        resultContent.text = content
    }
    
    //Mark: - 빈 화면 클릭 시 키보드 내려가기
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
}

