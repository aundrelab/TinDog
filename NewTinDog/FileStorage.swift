//
//  FileStorage.swift
//  NewTinDog
//
//  Created by Ramiro Soto on 12/10/21.
//

import Foundation
import FirebaseStorage

let storage = Storage.storage()

class FileStorag {
    class func uploadImages(_ image: UIImage, directory: String, completion: @escaping(_ documentLink: String?) -> Void){
        
        
        let storageRef = storage.reference(forURL: kFILEREFERENCE).child(directory)
        
        let imageData = image.jpegData(compressionQuality: 0.6)
        
        var task: StorageUploadTask!
        
        task = storageRef.putData(imageData!, metadata: nil, completion: { (metaDAta, error) in
            
            task.removeAllObservers()
            
            if error != nil {
                print("error uploading image", error!.localizedDescription)
                return
            }
            
            storageRef.downloadURL { (url, error) in
                guard let downloadUrl = url else{
                    completion(nil)
                    return
                }
                
                print("images uploaded to", downloadUrl.absoluteString)
                completion(downloadUrl.absoluteString)
            }
        })
    }
    
    class func downloadImage(imageUrl: String, completion: @escaping(_ image: UIImage?) -> Void){

        let imageFileName = ((imageUrl.components(separatedBy: " -- ").last!).components(separatedBy: "?").first)!.components(separatedBy: ".").first!

        if fileExistAt(path: imageFileName){
            print("we have looocal file")
            
            if let contentsOfFile = UIImage(contentsOfFile: fileInDocumentsDirectory(filename: imageFileName)){
                completion(contentsOfFile)
            } else {
                print("could't generate image from local image")
                completion(nil)
            }
            
        } else {
            //download
            
            if imageUrl != "" {
                let documentURL = URL(string: imageUrl)
                
                let downloadQueue = DispatchQueue(label: "download Queue")
                
                downloadQueue.async {
                    let data = NSData(contentsOf: documentURL!)
                    
                    if data != nil {
                        let imageToReturn = UIImage(data: data! as Data)
                        
                        FileStorag.saveImageLocally(imageData: data!, fileName: imageFileName)
                        
                        completion(imageToReturn)
                    } else {
                        print("no image on database")
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
            
        }
    }
    
    
    class func saveImageLocally(imageData: NSData, fileName: String){
        
        var docURL = getDocumentsURL()
        
        docURL = docURL.appendingPathComponent(fileName, isDirectory: false)
        
        imageData.write(to: docURL, atomically: true)
    }
}

func getDocumentsURL() -> URL {
    
    let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    
    return documentURL!
}

func fileInDocumentsDirectory(filename: String) -> String {
    let fileURL = getDocumentsURL().appendingPathComponent(filename)
    
    return fileURL.path
}

func fileExistAt(path: String) -> Bool {
    var doesExist = false
    
    let filePath = fileInDocumentsDirectory(filename: path)
    
    if FileManager.default.fileExists(atPath: filePath){
        doesExist = true
    } else {
        doesExist = false
    }
    
    return doesExist
}
    
