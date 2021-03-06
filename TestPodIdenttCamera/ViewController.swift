//
//  ViewController.swift
//  TestPodIdenttCamera
//
//  Created by Arkadiusz Lewandowski on 21/07/2020.
//  Copyright © 2020 Identt. All rights reserved.
//

import AVFoundation
import IdenttCamera
import UIKit

class ViewController: SICVideoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldDetectFace = true
        shouldDetectDocument = true
        shouldDetectFrontDocument = true
        shouldDetectBackDocument = true
    }

    override func setRectOfInterest() -> CGRect {
        return CGRect(origin: CGPoint(x: 0.3, y: 0.3), size: CGSize(width: 0.33, height: 0.33))
    }

    override func gotOtherPresetUrl(avassetexportsession: AVAssetExportSession) {
        guard avassetexportsession.status == AVAssetExportSession.Status.completed, avassetexportsession.outputURL != nil else { return }
        videoUrlMediumQuality = avassetexportsession.outputURL
        let fileURL = videoUrlMediumQuality
        var filesToShare = [Any]()
        filesToShare.append(fileURL!)
        let activityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }

}

