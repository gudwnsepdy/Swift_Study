//
//  SecondViewController.swift
//  proj_4
//
//  Created by 형주 on 2021/06/03.
//

import UIKit
import Photos

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var sortToolbarItem: UIBarButtonItem!
    @IBOutlet weak var actionToolBarItem: UIBarButtonItem!
    @IBOutlet weak var trashToolbarItem: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var buttonstatus = false
    var pictures: PHFetchResult<PHAsset>!
    var albumName: String!
    var albumindex: Int!
    
    let imageManger: PHCachingImageManager = PHCachingImageManager()
    let half: Double = Double(UIScreen.main.bounds.width/3 - 15)

    
    var myrightBarButtonItem: UIBarButtonItem!
    
    var delete = [Int]()
    
    var stop: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: half, height: half)
        flowlayout.sectionInset = UIEdgeInsets.zero
        flowlayout.minimumLineSpacing = 20
        flowlayout.minimumInteritemSpacing = 20
        self.collectionView.collectionViewLayout = flowlayout
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationItem.title = albumName
        
//        PHPhotoLibrary.shared().register(self)
        
        myrightBarButtonItem = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectbtAction(_:)))
        self.navigationItem.rightBarButtonItem = myrightBarButtonItem
        
        
    }
    
    
    @objc func selectbtAction(_ sender: UIBarButtonItem) -> Void {
        self.stop = true
        self.actionToolBarItem.isEnabled = true
        self.trashToolbarItem.isEnabled = true
        self.navigationItem.title = "항목선택"
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "취소" , style: .plain , target: self, action: #selector(cancelbtAction(_:)))
        
        self.collectionView.allowsMultipleSelection = true
    }
    
    @objc func cancelbtAction(_ sender: UIBarButtonItem) -> Void {
        self.stop = false
        self.actionToolBarItem.isEnabled = false
        self.trashToolbarItem.isEnabled = false
        self.navigationItem.title = "선택"
        self.navigationItem.hidesBackButton = false
        self.navigationItem.rightBarButtonItem = myrightBarButtonItem
        
        self.delete = [Int]()
        self.collectionView.allowsMultipleSelection = false
        self.collectionView.reloadData()
        
        
    }
    
    @IBAction func sortToolbarbt(_ sender: Any) {
        
        buttonstatus = !buttonstatus
        
        if buttonstatus{
            sortToolbarItem.title = "과거순"
            let reversecreationDateFet = PHFetchOptions()
            reversecreationDateFet.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            
            if albumName! == "Camera Roll" {
                let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
                guard let userAlbum: PHAssetCollection = cameraRoll.firstObject else {
                    return
                }
                pictures = PHAsset.fetchAssets(in: userAlbum, options: reversecreationDateFet)
            } else {
                let listfet = PHFetchOptions()
                listfet.sortDescriptors = [NSSortDescriptor(key: "localizedTitle", ascending: false)]
                
                let userAlbumList: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: listfet)
                
                let userAlbum:PHAssetCollection = userAlbumList.object(at: albumindex-1)
                pictures = PHAsset.fetchAssets(in: userAlbum, options: reversecreationDateFet)
            }
            
            collectionView.reloadData()
        } else {
            sortToolbarItem.title = "최신순"
            let creationDateFet = PHFetchOptions()
            creationDateFet.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            
            if albumName! == "Camera Roll" {
                let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
                guard let userAlbum: PHAssetCollection = cameraRoll.firstObject else {
                    return
                }
                pictures = PHAsset.fetchAssets(in: userAlbum, options: creationDateFet)
            } else {
                let listfet = PHFetchOptions()
                listfet.sortDescriptors = [NSSortDescriptor(key: "localizedTitle", ascending: false)]
                
                let userAlbumList: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: listfet)
                
                let userAlbum:PHAssetCollection = userAlbumList.object(at: albumindex-1)
                pictures = PHAsset.fetchAssets(in: userAlbum, options: creationDateFet)
            }
            
            collectionView.reloadData()
        }
    }
    
    @IBAction func actionItemClick(_ sender: Any) {
        
    }
    
    @IBAction func trashItemClick(_ sender: Any) {
        
        var asset = [PHAsset]()
        
        for i in delete {
            asset.append(pictures[i])
        }
        
        PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets(asset as NSFastEnumeration)}, completionHandler: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PictureCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PictureCollectionViewCell else {
            print("cell error")
            return UICollectionViewCell()
        }
        
        let picture: PHAsset = pictures.object(at: indexPath.item)
        
        imageManger.requestImage(for: picture, targetSize: CGSize(width: half, height: half), contentMode: .aspectFill, options: nil, resultHandler: {img, _ in cell.imageView?.image = img})
        cell.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 0.7
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.black
        
        if !delete.contains(indexPath.item) {
            delete.append(indexPath.item)
        }
        print(delete)
        
        if !stop {
            guard let vc = storyboard?.instantiateViewController(identifier: "detailView") else {
                print("View controller not found")
                return
            }
            
            let thirdvc: ThirdViewController = vc as! ThirdViewController
            
            let cell:PictureCollectionViewCell = collectionView.cellForItem(at: indexPath) as! PictureCollectionViewCell
            thirdvc.picture = cell.imageView.image
            thirdvc.asset = pictures[indexPath.item]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 1
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.white
        let index: Int! = delete.firstIndex(of: indexPath.item)
        delete.remove(at: index)
        print("delete: \(delete)")
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: pictures)
        else { return }
        
        pictures = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.collectionView.reloadData()
        }
    }
}
