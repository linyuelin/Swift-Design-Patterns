//
//  APICaller.swift
//  APIKit
//
//  Created by dreaMTank on 2024/01/30.
//

import Foundation

public class APICaller{
    public static let shared = APICaller()
    
    private init(){}
    
    public func fetchCourseNames(completion: @escaping ([String]) -> Void){
        
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            completion([])
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
           
            // デコード
            do {
                guard  let json =  try JSONSerialization.jsonObject(with: data, options: .allowFragments)  as? [[String: String]] else { completion([])
                    return
                }
                
                let names: [String] = json.compactMap({ $0["name"] })
                print(names)
                completion(names)
                
            }
            catch {
                completion([])
            }
        }
        task.resume()
        
        
    }
     
}
