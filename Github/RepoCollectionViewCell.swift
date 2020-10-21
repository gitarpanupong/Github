//
//  RepoCollectionViewCell.swift
//  Github
//
//  Created by Panupong Chaiyarut on 19/10/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class RepoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Title: UILabel!
  
    var myrepo: getcontribute!{

           didSet{
               updateData()
           }
       }
    
    func updateData(){
        Title.text = myrepo.login
        let url = URL(string: myrepo.avatar_url)!
      
        if let data = try? Data(contentsOf: url) {
            Img.image = UIImage(data: data)
        }
        //Img.image = myrepo.avatar_url
    }
    
}
