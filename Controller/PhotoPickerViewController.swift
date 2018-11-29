import UIKit

class PhotoPickerViewController: PickerViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    @IBOutlet var loader: UIActivityIndicatorView!
    @IBOutlet weak var loaderWidthConstraint: NSLayoutConstraint!
    
    var isProcessing = false
    var model = TransferStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var isProcessing : Bool = false {
            didSet {
                button.isEnabled = !isProcessing
                self.isProcessing ? self.loader.startAnimating() : self.loader.stopAnimating()
                self.loaderWidthConstraint.constant = self.isProcessing ? 20.0 : 0.0
                UIView.animate(withDuration: 0.3) {
                    self.isProcessing
                        ? self.button.setTitle("Processing...", for: .normal)
                        : self.button.setTitle("Transform!", for: .normal)
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @IBOutlet weak var pickerBtn: UIButton!
    
    @IBAction func pickerBtnAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true)
        } else {
            print("Photo Library not available")
        }
        // openOptions()
    }
    
    @IBAction func preview(_ sender: Any) {
        performSegue(withIdentifier: "toPost", sender: self)
    }
    override func selectedImage(choosenImage: UIImage) {
        imageView.image=choosenImage
    }
    
    @IBAction func transfer() {
        guard let image = self.imageView.image else {
            print("Select an image first")
            return
        }
        
        self.isProcessing = true
        model.process(input: image) { filteredImage in
            self.isProcessing = false
            if let filteredImage = filteredImage {
                self.imageView.image = filteredImage
            }
        }
    }
}
