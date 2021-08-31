//
//  AdvanceSearchViewModel.swift
//  Marvel
//
//  Created by VVDN on 31/08/21.
//

import Foundation
import UIKit

struct AddAdvancedViewModel: Hashable {
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class AdvancedSearchCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
