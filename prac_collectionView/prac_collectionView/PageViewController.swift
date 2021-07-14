//
//  PageViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/09.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    lazy var VCArray:[UIViewController] = {
            return [self.VCInstance(name: "SelectAlcholViewController"),
                    self.VCInstance(name: "SelectBaseViewController"),
                    self.VCInstance(name: "SelectSweetViewController"),
                    self.VCInstance(name: "SelectSourViewController"),
                    self.VCInstance(name: "SelectBitterViewController"),
                    self.VCInstance(name: "SelectDryViewController")]
        }()
        
        private func VCInstance(name: String)-> UIViewController{
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = VCArray.index(of: viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return VCArray.last
            }
            
            guard VCArray.count > previousIndex else {
                return nil
            }
            
            return VCArray[previousIndex]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = VCArray.index(of: viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            
            guard nextIndex < VCArray.count else{
                return VCArray.first
            }
            
            guard VCArray.count > nextIndex else {
                return nil
            }
            
            return VCArray[nextIndex]
        }
        

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            self.dataSource = self
            self.delegate = self
            
            if let firstVC = VCArray.first{
                setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            }
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
