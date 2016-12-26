import Foundation

class Download: NSObject {
    
    var url: String
    var isDownloading = false
    var progress: Float = 0.0
    
    var downloadTask: URLSessionDownloadTask?
    var resumeData: Data?
    
    var callBack: DownloadCallback?
    var progressCallBack: DownloadProgressCallback?
    var type = DownloadType.Other
    
    var requestCount = 1
    
    init(url: String) {
        self.url = url
    }
}
