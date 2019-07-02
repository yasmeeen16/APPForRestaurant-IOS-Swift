//
//  OffersScreenViewController.swift
//  otlob
//
//  Created by yasmeen on 6/25/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class OffersScreenViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet weak var OffersCollectionView: UICollectionView!
    var ArrayOfImages = [
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg",
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg",
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg",
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg",
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg",
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg",
        "https://pbs.twimg.com/media/D4G_q_eW4AAW6Bz.jpg"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        OffersCollectionView.delegate = self
        OffersCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayOfImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "offercell", for: indexPath) as! OfferCell
        let image = self.ArrayOfImages[indexPath.item]
        print(image)
        if let url = URL(string: image){
            do{
                let data = try Data(contentsOf: url)
                cell.offerImageOutlet.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        return cell
    }
}
