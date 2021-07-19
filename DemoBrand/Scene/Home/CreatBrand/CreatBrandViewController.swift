//
//  CreatBrandViewController.swift
//  DemoBrand
//
//  Created by Thân Văn Thanh on 24/05/2021.
//

import UIKit

class CreatBrandViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var founderYear: UITextField!
    @IBOutlet weak var founderTextfield: UITextField!
    @IBOutlet weak var ceoTextfield: UITextField!
    @IBOutlet weak var introduceTextView: UITextView!
    
    @IBOutlet var datePicker: UIDatePicker!
    let dateLabel = UILabel()

    var isAddNewBrand = true
    var brandEdit: ((BrandEntity) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDatePicker()

        // Do any additional setup after loading the view.
    }
    func setDatePicker() {
        // set kiểu ngày tháng cho datePicker
        datePicker.datePickerMode = .date
        // gán datePicker cho textField
        founderYear.inputView = datePicker
        // Set ngày mặc định khi hiển thị
        datePicker.setDate(Date(), animated: true)
        
        //  khởi tạo toolBar, toolBar.sizeToFit là các thành phần nằm trong nó tự dãn theo đúng kích thước width
        let toolBar = UIToolbar()
        founderYear.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        dateLabel.text = "Chọn năm thành lập"
        
        // khai báo các thành phần trong toolBar (button,label)
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneDateAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let label = UIBarButtonItem(customView: dateLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        // set các thành phần vào toolBar
        toolBar.setItems([cancelButton, spaceButton, label, spaceButton, doneButton], animated: false)
        
        // add hành động datepicker
        datePicker.addTarget(self, action: #selector(valueChangeDatePicker), for: .valueChanged)
    }
    @objc func valueChangeDatePicker() {
        dateLabel.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        dateLabel.sizeToFit()
    }
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    @objc func doneDateAction() {
        founderYear.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "yyyy")
        self.view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    private func setupView() {
        title = "Add new brand"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ontapSave))
    }
    @IBAction func ontapAddPhotoLogo(_ sender: Any) {
        openGallery()
    }
    
    @objc func ontapSave() {
        (brandEdit!)(BrandEntity(logo: logoImage.image, name: nameTextfield.text,
                                 foundedYear: Int(founderYear.text ?? ""),
                                 founder: founderTextfield.text,
                                 ceo: ceoTextfield.text,
                                 introduce: introduceTextView.text))
        navigationController?.popViewController(animated: true)
    }
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
//    func validateNewBrand() -> Bool {
//        if nameTextfield.text?.count == 0 || founderYear.text?.count == 0 || founderTextfield.text?.count == 0 || ceoTextfield.text?.count == 0 || introduceTextView.text.count == 0{
//            print("Please input all information")
//            return false
//        }
//        return true
//    }
}
extension CreatBrandViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            self.logoImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
