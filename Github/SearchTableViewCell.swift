//
//  SearchTableViewCell.swift
//  Github
//
//  Created by Panupong Chaiyarut on 19/10/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell, UICollectionViewDelegate{
 
    @IBOutlet weak var Repositorylbl: UILabel!
    @IBOutlet weak var Starlbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchgetcon: [getcontribute] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

extension SearchTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchgetcon.count//searchgetcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepositoryCell", for: indexPath) as! RepoCollectionViewCell
        
        myCell.myrepo = searchgetcon[indexPath.row]
       // myCell.nametxt = nametxt
       
        //print(indexPath.row," xxx ",searchgetcon)
        
        
       // myCell.Title.text = searchgetcon[0].login
       // myCell.Img = searchgetcon[0].avatar_url
        //myCell.myrepo =
       // myCell.myDessert = dessert[indexPath.row]
        
//        let url = URL(string: searchgetcon[0].avatar_url)!
//
//        if let data = try? Data(contentsOf: url) {
//            myCell.Img.image = UIImage(data: data)
//        }

        
        return myCell
    }
     
    
}
