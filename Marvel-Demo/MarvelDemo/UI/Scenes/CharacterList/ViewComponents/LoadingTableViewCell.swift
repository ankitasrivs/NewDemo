
import UIKit

class LoadingTableViewCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        spinner.startAnimating()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.startAnimating()
        contentView.backgroundColor = .white
    }    
}
