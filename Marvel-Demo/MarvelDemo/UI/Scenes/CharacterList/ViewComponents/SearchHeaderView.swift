
import UIKit

protocol SearchHeaderViewDelegate: AnyObject {
    func updateSearchResults(_ searchText: String)
}

class SearchHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.setImage(UIImage(systemName: "plus"), for: .normal)
            moreButton.setImage(UIImage(systemName: "minus"), for: .selected)
        }
    }
    
    weak var delegate: SearchHeaderViewDelegate?

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        layer.backgroundColor = UIColor.white.withAlphaComponent(0.9).cgColor
    }
    
    func configureView() {
        searchBar.placeholder = "Filter by Name"
        searchBar.delegate = self
    }
    
}

extension SearchHeaderView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.updateSearchResults(searchText)
    }
}
