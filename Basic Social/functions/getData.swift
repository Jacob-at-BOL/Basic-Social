//
//  getData.swift
//  Basic Social
//
//  Created by Jacob on 7/22/24.
//

import Foundation

func getPosts(apiUrlString: String, completion: @escaping ([Post]?) -> Void) {
    
    guard let apiUrl = URL(string: apiUrlString) else {
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: apiUrl) { data, response, error in
        
        if let error = error {
            print("Error: \(error)")
            completion(nil)
        }
        
        guard let safeData = data else {
            print("No data received")
            completion(nil)
            return
        }
        
        let decoder = JSONDecoder()
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: safeData, options: []) as? [String: Any],
               let postsArray = jsonObject["posts"] as? [[String: Any]] {
                
                // Convert the posts array to JSON data
                let postsData = try JSONSerialization.data(withJSONObject: postsArray, options: [])
                
                // Decode the posts array data to an array of Post structs
                let posts = try decoder.decode([Post].self, from: postsData)
                //print(posts)
                completion(posts)
            } else {
                completion(nil)
            }
        } catch {
            print(error)
        }
        
    }
    
    task.resume()
    
}
