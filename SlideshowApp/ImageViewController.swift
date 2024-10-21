//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by mba2408.silver kyoei.engine on 2024/10/10.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var sendView: UIImageView!
    var receivedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = receivedImage{
            sendView.image = image
            // Do any additional setup after loading the view.
            sendView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 
 */
