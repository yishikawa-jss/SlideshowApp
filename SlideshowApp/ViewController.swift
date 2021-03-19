//
//  ViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI552 on 2021/03/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var previousB: UIButton!
    @IBOutlet weak var SPB: UIButton!
    @IBOutlet weak var pic: UIImageView!
    
    var timer: Timer!
    var indexOfPic: Int = 0
    
    var imageArray:[UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "10")!]
    
    var slideFlg: Bool = false
    
    @IBAction func nextButton(_ sender: Any) {
        
        //次の画像へ
        indexOfPic += 1
        
        //最後の画像の場合、最初に戻る
        if(indexOfPic == imageArray.count){
            
            indexOfPic = 0
            
        }
        
        //表示
        pic.image = imageArray[indexOfPic]
        
    }
    
    @IBAction func previousButton(_ sender: Any) {
        
        //前の画像へ
        indexOfPic -= 1
        
        //最初の画像の場合、最後に移動
        if(indexOfPic == -1){
            
            indexOfPic = imageArray.count - 1
            
        }
        
        //表示
        pic.image = imageArray[indexOfPic]
        
    }
    
    @IBAction func SPButton(_ sender: Any) {
        
        //停止中
        if (timer == nil){
            
            //ボタン非活性化
            nextB.isEnabled = false
            previousB.isEnabled = false
            //ボタン色変更
            nextB.backgroundColor = UIColor.systemGray
            nextB.setTitleColor(UIColor.white, for: .normal)
            previousB.backgroundColor = UIColor.systemGray
            previousB.setTitleColor(UIColor.white, for: .normal)
            
            //ボタン表記を「停止」に変更
            SPB.setTitle("停止", for: .normal)
            
            //timer 起動
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:     #selector(slideImage), userInfo: nil, repeats: true)
            
        }else{//再生中
            
            //ボタン活性化
            nextB.isEnabled = true
            previousB.isEnabled = true
            //ボタン色変更
            nextB.backgroundColor = UIColor.systemTeal
            nextB.setTitleColor(UIColor.white, for: .normal)
            previousB.backgroundColor = UIColor.systemYellow
            previousB.setTitleColor(UIColor.systemBlue, for: .normal)
            
            //ボタン表記を「再生」に変更
            SPB.setTitle("再生", for: .normal)
            
            //timer 停止
            timer.invalidate()
            timer = nil
            
        }
        
    }
    
    @IBAction func picTap(_ sender: Any) {
        
        if (timer != nil){//スライドショー実行中
            
            //timer 停止
            timer.invalidate()
            timer = nil
            
            //フラグ立てる
            slideFlg = true
            
        }
        
        //遷移
        self.performSegue(withIdentifier: "zoom", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if(segue.identifier == "zoom"){
            
            let nextViewController = segue.destination as! picZoomViewController
            //表示中のUIImageを渡す
            nextViewController.pic = imageArray[indexOfPic]
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期表示
        pic.image = imageArray[indexOfPic]
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
        if(slideFlg == true){//スライドショー実行中の画面遷移だった場合
            
            //timer 起動
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:     #selector(slideImage), userInfo: nil, repeats: true)
            
            //フラグを折る
            slideFlg = false
            
        }
        
    }
    
    @objc func slideImage(){
        
        //次の画像へ
        indexOfPic += 1
        
        //最後の画像の場合、最初に戻る
        if(indexOfPic == imageArray.count){
            
            indexOfPic = 0
            
        }
        
        //表示
        pic.image = imageArray[indexOfPic]
        
    }


}

