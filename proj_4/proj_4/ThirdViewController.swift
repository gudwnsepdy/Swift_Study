//
//  ThirdViewController.swift
//  proj_4
//
//  Created by 형주 on 2021/06/03.
//

import UIKit
import Photos

class ThirdViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var picture: UIImage!
    var asset: PHAsset!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        
        imageView.image = picture
    }
    
    
    @IBAction func trashbtClick(_ sender: Any) {
        
        PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets([self.asset] as NSArray)}, completionHandler: nil)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.backgroundColor = UIColor.black
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.toolbar.isHidden = true
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if scale == 1.0 {
            scrollView.backgroundColor = UIColor.white
        }
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.toolbar.isHidden = false
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
