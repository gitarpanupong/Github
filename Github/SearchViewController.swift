//
//  SearchViewController.swift
//  Github
//
//  Created by Panupong Chaiyarut on 18/10/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   // var username: getdata!
    var getrepository: [getrepo] = []
    var getcon: [getcontribute] = []
    var name: String = ""
    
  //  var arr: [String: [getcontribute]] = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading()
        //self.title = username.login
        self.title = name
        
        if let url = URL(string: "https://api.github.com/users/"+name+"/repos") {
                        URLSession.shared.dataTask(with: url) { data, response, error in
                     if let data = data {
                     let jsonDecoder = JSONDecoder()
                         do {
                          
                            let parsedJSON = try jsonDecoder.decode([getrepo].self, from: data)
                          
                            self.getrepository = parsedJSON

                                
                            self.getdata()
                            
                             } catch {
                                 print(error)
                             }
                            }
                        }.resume()
                     }
    }
    
    
    func getdata() {
        
        for i in self.getrepository {
            if let url = URL(string: "https://api.github.com/repos/"+name+"/"+i.name+"/contributors") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        let jsonDecoder = JSONDecoder()
             do {
                let parsedJSON = try jsonDecoder.decode([getcontribute].self, from: data)
                self.getcon = parsedJSON
                 
                DispatchQueue.main.async(){
                   
                   self.tableView.reloadData()
                    self.dismiss(animated: false, completion: nil)
                }

                 } catch {
                     print(error)
                 }
                }
            }.resume()
         
        }
        }
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getrepository.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        
        cell.Repositorylbl.text = getrepository[indexPath.row].name
        cell.Starlbl.text = String(getrepository[indexPath.row].stargazers_count)
        cell.searchgetcon = getcon
        
        return cell
        
    }
    
    func loading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
   

}
