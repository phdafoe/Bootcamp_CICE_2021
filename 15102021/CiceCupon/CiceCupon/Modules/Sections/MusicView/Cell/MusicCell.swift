//
//  MusicCell.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/10/21.
//

import UIKit
import Kingfisher

protocol MusicCellProtocol {
    func configCell(data: ResultMusic?)
}


class MusicCell: UITableViewCell {
    
    // MARK: - Static properties
    static let identifier = String(describing: MusicCell.self)
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var artistsNameLBL: UILabel!
    @IBOutlet weak var releaseDateLBL: UILabel!
    @IBOutlet weak var kindLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MusicCell: MusicCellProtocol {
    
    func configCell(data: ResultMusic?) {
        self.artistsNameLBL.text = data?.artistName
        self.releaseDateLBL.text = data?.releaseDate
        self.kindLBL.text = data?.kind
        
        let url = URL(string: data?.artworkUrl100 ?? "")
        let processor = DownsamplingImageProcessor(size: artworkImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        artworkImageView.kf.indicatorType = .activity
        artworkImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
    
}

