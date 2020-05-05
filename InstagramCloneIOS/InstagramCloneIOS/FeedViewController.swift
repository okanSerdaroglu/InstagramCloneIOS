//
//  FeedViewController.swift
//  InstagramCloneIOS
//
//  Created by Okan Serdaroğlu on 4.05.2020.
//  Copyright © 2020 Okan Serdaroğlu. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableViewFeeds: UITableView!
    
    var postList = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewFeeds.delegate = self
        tableViewFeeds.dataSource = self
        getDataFromFireStore()
    }
    
    func getDataFromFireStore(){
        
        let fireStoreDatabase = Firestore.firestore()

        fireStoreDatabase.collection("Posts")
            .order(by:"date", descending: true)
            .addSnapshotListener { (snapshot, error) in
            
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    self.postList.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents{
                        let post = Post()
                        post.date = document.get("date") as? String
                        post.imageUrl = document.get("imageUrl") as? String
                        post.likes = document.get("likes") as? Int
                        post.postComment = document.get("postComment") as? String
                        post.postedBy = document.get("postedBy") as? String
                        post.documentID = document.documentID
                        self.postList.append(post)
                        
                    }
                    
                    self.tableViewFeeds.reloadData()
                    
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        
        let post = postList[indexPath.row]
        cell.labelComment.text = post.postComment ?? ""
        cell.labelUserEmail.text = post.postedBy ?? ""
        cell.labelLike.text = String(post.likes ?? 0)
        cell.imageViewUser.sd_setImage(with: URL(string:post.imageUrl!))
        cell.documentID = post.documentID
        return cell
    }
    
}
