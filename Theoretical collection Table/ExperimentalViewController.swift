//
//  ExperimentalViewController.swift
//  Theoretical collection Table
//
//  Created by Michael Redig on 7/29/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ExperimentalViewController: UICollectionViewController {


}

// MARK: - collection view stuff
extension ExperimentalViewController {

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 5
		default:
			return 200
		}
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.section {
		case 0:
			return tableCell(from: collectionView.dequeueReusableCell(withReuseIdentifier: "tableRowCell", for: indexPath), atIndex: indexPath.item)
		default:
			return normalCell(from: collectionView.dequeueReusableCell(withReuseIdentifier: "collectionLikeCell", for: indexPath), atIndex: indexPath.item)
		}
	}

	

	private func tableCell(from cell: UICollectionViewCell, atIndex index: Int) -> TableCollectionViewCell {
		guard let cell = cell as? TableCollectionViewCell else { return TableCollectionViewCell() }
		cell.rowLabel.text = "table row \(index)"
		cell.contentsView.backgroundColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 0.8, brightness: 0.7, alpha: 1)
		return cell
	}

	private func normalCell(from cell: UICollectionViewCell, atIndex index: Int) -> NormalCollectionViewCell {
		guard let cell = cell as? NormalCollectionViewCell else { return NormalCollectionViewCell() }
		cell.contentsView.backgroundColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 0.8, brightness: 0.7, alpha: 1)
		return cell
	}
}

extension ExperimentalViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		switch indexPath.section {
		case 0:
			return CGSize(width: view.bounds.width, height: 50)
		default:
			return CGSize(width: 50, height: 50)
		}
	}
}
