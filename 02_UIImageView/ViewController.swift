
import UIKit

class ViewController: UIViewController {
    // 이미지 뷰에 대한 아웃렛 변수
    @IBOutlet var imgView: UIImageView!
    // UIImagePickerController 인스턴스 변수 생성
    let picker: UIImagePickerController! = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageView 에 default image 설정
        imgView.image = UIImage(named: "img01.jpeg")
        
        // ImageView 클릭(탭) 이벤트 구현
        let settingTap = UITapGestureRecognizer(target: self, action: #selector(settingTapped))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(settingTap)
        
        
    }
    @objc func settingTapped() {
        print("Image Click Event ! ")
        self.present(self.picker, animated: true) // Controller이기 때문에 present
        self.picker.sourceType = .photoLibrary // 방식 선택. 앨범에서 가져오는걸로 선택.
        self.picker.allowsEditing = false // 수정가능하게 할지 선택. 하지만 false
        self.picker.delegate = self // picker delegate
    }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        self.imgView.image = newImage // 받아온 이미지를 update
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
        
    }
}


