//
//  ViewController.swift
//  Camera
//
//  Created by Trung Kiên on 8/1/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate ,UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSMutableURLRequest(url: URL(string: "https://www.facebook.com")!)
        request.allHTTPHeaderFields = ["x-ios" : "mobile"]
        request.httpMethod = "GET"
        webView.loadRequest(request as URLRequest)
        // Do any additional setup after loading the view.
    }
    @IBAction func onGet(_ sender: UIButton) {
       // AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
        
      //  AVCaptureDevice.default(.builtInDualCamera, for: AVMediaType.video, position: .front)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            present(imagePicker, animated: true) 
        }
    }
    
    @IBAction func onCamare(_ sender: Any) {
//        AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
//
//        AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
//        imagePicker =  UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .camera
//        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onSave(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(imageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        webView.scrollView.contentInset = UIEdgeInsets.zero;
    }
}
