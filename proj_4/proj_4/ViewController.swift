//
//  ViewController.swift
//  proj_4
//
//  Created by 형주 on 2021/06/02.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var userAsset = [PHFetchResult<PHAsset>]()
    var albumName = [String]()
    var assetCount = [Int]()
    
    
    let imagemanager = PHCachingImageManager()
    
    let half: Double = Double(UIScreen.main.bounds.width/2 - 20)
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let heightSize: Double = half + 40
        
        self.navigationItem.title = "앨범"
        
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: half, height: heightSize)
        
        flowlayout.sectionInset = UIEdgeInsets.zero
        flowlayout.minimumLineSpacing = 40
        flowlayout.minimumInteritemSpacing = 20
        self.collectionView.collectionViewLayout = flowlayout
        
        let photoAuthorizaitonStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizaitonStatus {
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            self.collectionView.reloadData()
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.collectionView.reloadData()
                    }
                    
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
                
            })
        case .restricted:
            print("접근 제한")
        default:
            break
        }
        
//        PHPhotoLibrary.shared().register(self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userAsset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell: ListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCollectionViewCell else {
            print("celll error")
            return UICollectionViewCell()
        }
        
        let img: PHAsset = userAsset[indexPath.item].object(at: 0)
        
        cell.titleLabel.text = albumName[indexPath.item]
        cell.numLabel.text = "\(assetCount[indexPath.item])"
        
        imagemanager.requestImage(for: img, targetSize: CGSize(width: half, height: half), contentMode: .aspectFill, options: nil, resultHandler: {img, _ in cell.imgView?.image = img})
        cell.imgView.layer.cornerRadius = 5
        return cell
    }
    
    func requestCollection() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        let listfet = PHFetchOptions()
        listfet.sortDescriptors = [NSSortDescriptor(key: "localizedTitle", ascending: false)]
        
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        userAsset.append(PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions))
        albumName.append("Camera Roll")
        assetCount.append(userAsset[0].count)
        
        let userAlbumList: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: listfet)
        let albumCount = userAlbumList.count
        let userAlbum: [PHAssetCollection] = userAlbumList.objects(at: IndexSet(0..<albumCount))
        
        
        for i in 0..<albumCount {
            userAsset.append(PHAsset.fetchAssets(in: userAlbum[i], options: fetchOptions))
            assetCount.append(userAsset[i + 1].count)
            albumName.append(userAlbum[i].localizedTitle!)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "picture" {
            print("picture")
            guard let nextView : SecondViewController = segue.destination as? SecondViewController else {
                return
            }
            
            guard let cell: ListCollectionViewCell = sender as? ListCollectionViewCell else {
                return
            }
            
            
            guard let index: IndexPath = self.collectionView.indexPath(for: cell) else {
                return
            }
            
            nextView.pictures = userAsset[index.item]
            nextView.albumName = self.albumName[index.item]
            nextView.albumindex = index.item
            
            
        }
    }

}

