//
//  ViewController.swift
//  StormViewer
//
//  Created by Felipe Marques Ramos on 05/06/21.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var picturesURLs = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Table View of Contents"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchImages()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesURLs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = picturesURLs[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            detailViewController.selectedImage = picturesURLs[indexPath.row]
            detailViewController.rowNumber = indexPath.row + 1
            detailViewController.totalRows = picturesURLs.count
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func fetchImages(){
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                picturesURLs.append(item)
            }
        }
        
        picturesURLs.sort()
        
        print(picturesURLs)
    }

}

