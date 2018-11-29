import Foundation
import UIKit

class Post {
    
    /// Boolean indicating whether or not the post has been read
    var read: Bool = false
    
    /// Username of the poster
    let username: String
    
    /// The date that the snap was posted
    let date: String
    
    /// The image path of the post
    let postImage: UIImage
    
    /// The ID of the post, generated automatically on Firebase
    let postId: String
    
    ///The name of the Post
    let name: String
    
    /// The position where you post the post
    let lat: Float
    
    //
    let lon: Float
    
    
    /// Designated initializer for posts
    ///
    /// - Parameters:
    ///   - username: The name of the user making the post
    ///   - postImage: The image that will show up in the post
    ///   - thread: The thread that the image should be posted to
    init(id: String, username: String, dateString: String, read: Bool, name: String, lat: Float, lon: Float) {
        self.postImage = UIImage.init(named: name)!
        self.username = username
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.A"
        self.date = dateString
        self.read = read
        self.postId = id
        self.name = name
        self.lat = lat
        self.lon = lon
    }
    
    /*func getTimeElapsedString() -> String {
        let secondsSincePosted = -date.timeIntervalSinceNow
        let minutes = Int(secondsSincePosted / 60)
        if minutes == 1 {
            return "\(minutes) minute ago"
        } else if minutes < 60 {
            return "\(minutes) minutes ago "
        } else if minutes < 120 {
            return "1 hour ago"
        } else if minutes < 24 * 60 {
            return "\(minutes / 60) hours ago"
        } else if minutes < 48 * 60 {
            return "1 day ago"
        } else {
            return "\(minutes / 1440) days ago"
        }
        
    }*/
    
    func getName() -> String {
        return self.name
    }
    
}
