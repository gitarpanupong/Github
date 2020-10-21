//
//  HomeViewController.swift
//  Github
//
//  Created by Panupong Chaiyarut on 18/10/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var SearchTxfield: UITextField!
    @IBOutlet weak var Searchbtn: UIButton!
    
   
   // var userdata: getdata!
    
    func displayAlertMessage(msg: String){
        let alert=UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction=UIAlertAction(title: "Ok",style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func SearchButton(_ sender: Any) {
        
       
            if let url = URL(string: "https://api.github.com/users/"+SearchTxfield.text!) {
                  URLSession.shared.dataTask(with: url) { data, response, error in
               if let data = data {
                
                
               let jsonDecoder = JSONDecoder()
                   do {
                      // let parsedJSON = try jsonDecoder.decode(getdata.self, from: data)
                      // print("parsedJson ",parsedJSON.login)
                    
                      ///  self.userdata = parsedJSON
                  
                            DispatchQueue.main.async(){
                                self.performSegue(withIdentifier: "goSearchvc", sender: self)
                            }
            
                       } catch {
                          DispatchQueue.main.async(){
                            self.displayAlertMessage(msg: "Not found")
                             print(error)
                        }
                         
                       }
                    
                    }
                      
                  }.resume()
               }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.SearchTxfield.delegate = self
    }
    

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
         let vc = segue.destination as! SearchViewController
         //   vc.username = self.userdata
            vc.name = SearchTxfield.text!
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
}
