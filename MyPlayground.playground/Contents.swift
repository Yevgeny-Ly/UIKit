struct ViewController {
    func myFunc(param: Int?) {}
}

extension ViewController: DelegateOfImageView {
    func setImage(name: String) {
        print(name)
    }
}

protocol DelegateOfImageView {
    func setImage(name: String)
}

struct ImageView {
    var delegate: DelegateOfImageView?
    var image = "image"
    
    func doSomfing() {
        delegate?.setImage(name: image)
    }
}

var viewController = ViewController()
var imageView = ImageView()

imageView.delegate = viewController

imageView.doSomfing()




