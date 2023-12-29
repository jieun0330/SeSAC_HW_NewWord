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
    // 키워드 뜻도 배열 사용해서 해보기
    //    let meanings = ["연애를 시작하기 전 썸단계!", "유명과 무명의 차이란다,,", "실시간,, 매일매일,, 몰라,,", "만만하게 잘 부지런히 모른다고"]
    
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
    
    // 서치바 클릭 시 나오는 키보드에서 return key 눌렀을 때 키보드 내리게 하기
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        resultScreen.image = .background
        
        // 텍스트필드에 키워드 검색했을 때도 잘 나오게 해야되는데 잘 안됨 뿌엥
        if searchBar.text == keywords.description {
            resultContent.text = "신조어 내용을 보여줘"
        } else {
            resultContent.text = "\(searchBar.text!)에 대한 검색결과는 없습니다"
        }
        view.endEditing(true)
    }
    
    @IBAction func firstButtonClicked(_ sender: UIButton) {
        if sender == firstButton {
            searchBar.text = sender.currentTitle
            keywordClicked(button: sender, content: "연애를 시작하기 전 썸단계!")
        }
    }
    
    @IBAction func secondButtonClicked(_ sender: UIButton) {
        keywordButton(secondButton, title: "윰차")
        keywordClicked(button: secondButton, content: "유명과 무명의 차이란다,,")
    }
    
    @IBAction func thirdButtonClicked(_ sender: UIButton) {
        keywordClicked(button: thirdButton, content: "실시간,, 매일매일,, 몰라,,")
    }
    
    @IBAction func fourthButton(_ sender: UIButton) {
        keywordClicked(button: fourthButton, content: "만만하게 잘 부지런히 모른다고")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func bar() {
        searchBar.placeholder = "신조어를 검색해주세요"
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.borderWidth = 2
        searchBar.layer.cornerRadius = 0
        searchBar.frame.size.height = 35
        searchBar.keyboardType = .default
    }
    
    func searchClicked() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.setTitle("", for: .normal)
    }
    
    func keywordButton(_ sender: UIButton, title: String) {
        
        // 버튼 클릭 시 색상 바뀌는거 구현하기
        //        if sender == sender {
        //            sender.setTitleColor(.white, for: .normal)
        //            sender.backgroundColor = .black
        //        } else {
        //            sender.setTitleColor(.black, for: .normal)
        //            sender.backgroundColor = .white
        //        }
        sender.setTitle(title, for: .normal)
        sender.setTitleColor(.black, for: .normal)
        sender.layer.cornerRadius = 5
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 1
        // 텍스트만큼 버튼 사이즈 줄이는건 맞는데 너무 딱 붙어서 더 찾아봐야함
        // 사이즈 줄어들고 버튼간 간격도 조절해야 함
        //        sender.sizeToFit()
    }
    
    func keywordClicked(button: UIButton, content: String) {
        resultScreen.image = .background
        searchBar.text = button.currentTitle
        resultContent.text = content
    }
}

