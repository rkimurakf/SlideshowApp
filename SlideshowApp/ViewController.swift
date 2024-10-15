//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mba2408.silver kyoei.engine on 2024/10/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageVIEW: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var up: UIButton!
    @IBOutlet weak var down: UIButton!
    var hantei: Bool = false
    
    //最初に表示させる画像
    var page:Int = 0
    
    var timer:Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "inu3")!,
        UIImage(named: "inu2")!,
        UIImage(named: "inu1")!,
        UIImage(named: "inu4")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapgesture(_ sender: Any) {
        
    }
    
    @IBAction func Abutton(_ sender: Any) {
        if hantei == false {
            //ONにする時に走らせたい処理
            startButton.setTitle("停止", for: .normal)
            hantei = true
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            up.isEnabled = false
            down.isEnabled = false
            
        } else if hantei == true {
            //OFFにする時に走らせたい処理
            startButton.setTitle("開始", for: .normal)
            hantei = false
            up.isEnabled = true
            down.isEnabled = true
            timer.invalidate()
        }
        
    }
    
    
    
    //プラス１関数
    @objc func changeImage(){
        page += 1
        if(page  == imageArray.count){
            page = 0
        }
        imageVIEW.image = imageArray[page]
    }
    //進むボタン
    @IBAction func up(_ sender: Any) {
        if(timer == nil){
            page += 1
        }else{
            timer.invalidate()
            startButton.setTitle("開始", for: .normal)
            hantei = false
            page += 1
        }
        if(page  == imageArray.count){
            page = 0
        }
        imageVIEW.image = imageArray[page]
    }
    
    
    
    //戻るボタン
    @IBAction func down(_ sender: Any) {
        if(timer == nil){
            page -= 1
        }else{
            timer.invalidate()
            startButton.setTitle("開始", for: .normal)
            hantei = false
            page -= 1
        }
        if page == -1 {
            page = 3
        }
        
        imageVIEW.image = imageArray[page]
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "showImageDetail"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.receivedImage = imageVIEW.image
            startButton.setTitle("開始", for: .normal)
            up.isEnabled = true
            down.isEnabled = true
            hantei = false
            timer.invalidate()
        }
    }
    
    
}


