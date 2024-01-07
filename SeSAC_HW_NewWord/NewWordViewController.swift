//
//  NewWordViewController.swift
//  SeSAC_HW_NewWord
//
//  Created by 박지은 on 1/1/24.
//

import UIKit

class NewWordViewController: UIViewController {

    @IBOutlet var searchBar: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    let keyword: [String: String] = ["윰차": "유모차의 줄임말?",
                   "실매": "실시간 매니저",
                   "만반잘부": "만나서 반가워 잘 부탁해",
                   "꾸안꾸": "꾸민듯 안 꾸민듯"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bar()
        searchButtonDesign()
//        buttonsDesign()
        
    }
    
    func bar() {
        searchBar.placeholder = "신조어를 검색해주세요"
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.borderWidth = 1
    }
    
    func searchButtonDesign() {
        searchButton.backgroundColor = .black
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
    }
    
//    func buttonsDesign() {
//        for (_, value) in buttons.enumerated() {
//            value.setTitle(keyword["윰차"], for: .normal)
//        }
//    }
    
    // 대소문자 구분 없이
    func setNavigationItem() {
        //아래 조건에 다 붙이는 것보다 여기에 붙이는게 통합적으로 적용이 됨
        let text = "jmt".uppercased()
        
        // 반복문, switch
        if text.uppercased() == "JMT" {
            
        } else if text.uppercased() == "아샷추" {
            
        } else if text.uppercased() == "알잘딱깔센" {
            
        }
    }
    
}
