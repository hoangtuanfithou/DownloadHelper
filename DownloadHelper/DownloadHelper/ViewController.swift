import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let testUrl = "http://images.apple.com/v/apple-watch-series-2/a/images/gallery/watch_11_large_2x.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBAction func downloadOnClick(_ sender: Any) {
        DownloadHelper.sharedInstance.startDownloadImage(testUrl, callBack: { success, image in
            self.imageView.image = image as? UIImage
        }, progressCallBack: { (progress, object) in
            self.downloadProgress.progress = progress
        })
    }
    
    @IBAction func pauseOnClick(_ sender: Any) {
        DownloadHelper.sharedInstance.pauseDownload(testUrl)
    }
    
    @IBAction func cancelOnClick(_ sender: Any) {
        DownloadHelper.sharedInstance.cancelDownload(testUrl)
    }
    
    @IBAction func resumeOnClick(_ sender: Any) {
        DownloadHelper.sharedInstance.resumeDownload(testUrl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let urlString = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(indexPath.row + 1).jpg"

        // Configure the cell...
        DownloadHelper.sharedInstance.startDownloadImage(urlString, callBack: { (success, image) in
            cell.customImageView?.image = image as? UIImage
        })
        return cell
    }
    
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var customImageView: UIImageView!    
}
