//
//  ViewController.swift
//  PhotosExample
//
//  Created by 형주 on 2021/05/31.
//

import UIKit
import Photos
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var fetchResults = [PHFetchResult<PHAsset>]()
    let imageManger = PHCachingImageManager()
    var fetchOptions: PHFetchOptions {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        return fetchOptions
    }
    
    func checkPermission() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            self.requestImageCollection()
        case .denied: break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                switch $0 {
                case .authorized:
                    self.requestImageCollection()
                case .denied: break
                default:
                    break
                }
            })
        default:
            break
        }
    }
    
    func requestImageCollection() {
        let cameraRoll = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        let favoriteList = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumFavorites, options: nil)
        let albumList = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
        addAlbums(collection: cameraRoll)
        addAlbums(collection: favoriteList)
        addAlbums(collection: albumList)
        
        OperationQueue.main.addOperation {
            self.collectionView.reloadData()
        }
    }

    private func addAlbums(collection : PHFetchResult<PHAssetCollection>){
        for i in 0 ..< collection.count {
            let collection = collection.object(at: i)
            self.fetchResults.append(PHAsset.fetchAssets(in: collection, options: fetchOptions))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
        //PHPhotoLibrary.shared().register(self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
 
    
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AlbumCollectionViewCell else {
            return AlbumCollectionViewCell()
        }
        guard let asset = fetchResults[indexPath.item].firstObject as? PHAsset else {
            return AlbumCollectionViewCell()
        }
        imageManger.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: nil) {(image, _) in cell.imageView?.image = image}
        return cell
    }

    
}
