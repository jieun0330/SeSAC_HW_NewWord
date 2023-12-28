//
//  ViewController.swift
//  SeSAC_HW_NewWord
//
//  Created by 박지은 on 12/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    // 검색바
    @IBOutlet var searchBar: UITextField!
    @IBOutlet var searchButton: UIButton!
    // 키워드 버튼
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    // 검색 결과 화면
    @IBOutlet var resultScreen: UIImageView!
    @IBOutlet var resultContent: UILabel!
    
    let keywords = ["삼귀자", "윰차", "실매", "만만잘부"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색바
        bar()
        searchClicked()
                
        // 키워드 버튼
        keywordButton(keyword: firstButton, title: "삼귀자", active: false)
        keywordButton(keyword: secondButton, title: "윰차", active: false)
        keywordButton(keyword: thirdButton, title: "실매", active: false)
        keywordButton(keyword: fourthButton, title: "만만잘부", active: false)
                
        // 검색 결과 화면
        resultScreen.image = .wordLogo
        resultContent.text = ""
    }
    
    // 검색 버튼 클릭 시
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        resultScreen.image = .background
        
        // 텍스트필드에 keywords에 있는 키워드 검색했을 때도 잘 나오게 하기
        if searchBar.text == keywords.description {
            resultContent.text = "신조어 내용을 보여줘"
        } else {
            resultContent.text = "\(searchBar.text!)에 대한 검색결과는 없습니다"
        }
        
        view.endEditing(true)
        
    }
    
    // 삼귀자 키워드 클릭 시
    @IBAction func firstButtonClicked(_ sender: UIButton) {
            
        keywordButton(keyword: firstButton, title: "삼귀자", active: true)
        keywordClicked(button: firstButton, content: "연애를 시작하기 전 썸단계!")
        
        // 이건 하드코딩인거같은데 말이지 이건 아닌거같은데 말이지
//        keywordButton(keyword: secondButton, title: "윰차", active: false)
//        keywordButton(keyword: thirdButton, title: "실매", active: false)
//        keywordButton(keyword: fourthButton, title: "만만잘부", active: false)
    }
    
    // 윰차 키워드 클릭 시
    @IBAction func secondButtonClicked(_ sender: UIButton) {
        keywordButton(keyword: secondButton, title: "윰차", active: true)
        keywordClicked(button: secondButton, content: "유명과 무명의 차이란다,,")
    }
    
    // 실매 키워드 클릭 시
    @IBAction func thirdButtonClicked(_ sender: UIButton) {
        keywordClicked(button: thirdButton, content: "실시간,, 매일매일,, 몰라,,")
    }
    
    // 만만잘부 키워드 클릭 시
    @IBAction func fourthButton(_ sender: UIButton) {
        keywordClicked(button: fourthButton, content: "만만하게 잘 부지런히 모른다고")
    }

    // 검색 바 디자인
    // return key 눌렀을 때 키보드 내려가게 하는 것도 해야되는데 눈 아파 디지겠네
    func bar() {
        searchBar.placeholder = "신조어를 검색해주세요"
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.borderWidth = 2
        searchBar.layer.cornerRadius = 0
        searchBar.frame.size.height = 35
        searchBar.keyboardType = .default
    }
    
    // 검색 버튼 디자인
    func searchClicked() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.setTitle("", for: .normal)
    }
    
    // 키워드 버튼 디자인
    // 버튼간의 간격 조절하고싶어요
    // 버튼 폰트 크기는 대체 어떻게 조절하는거야
    func keywordButton(keyword: UIButton, title: String, active: Bool) {
        
        if active == true {
            keyword.setTitleColor(.white, for: .normal)
            keyword.backgroundColor = .black
        } else {
            keyword.setTitleColor(.black, for: .normal)
            keyword.backgroundColor = .white
        }
        keyword.setTitle(title, for: .normal)
        keyword.layer.cornerRadius = 10
        keyword.layer.borderColor = UIColor.black.cgColor
        keyword.layer.borderWidth = 1
        keyword.sizeToFit()
    }
    
    // 키워드 버튼 눌렀을 때 디자인
    func keywordClicked(button: UIButton, content: String) {
        resultScreen.image = .background
        searchBar.text = button.currentTitle
        resultContent.text = content
    }
}

