//
//  picZoomViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI552 on 2021/03/17.
//

import UIKit

class picZoomViewController: UIViewController {

    @IBOutlet weak var zoomPic: UIImageView!
    var pic:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        zoomPic.image = pic
        
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
