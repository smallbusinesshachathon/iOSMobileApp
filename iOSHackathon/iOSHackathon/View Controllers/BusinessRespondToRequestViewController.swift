//
//  BusinessRespondToRequestViewController.swift
//  iOSHackathon
//
//  Created by Daniela Parra on 5/4/19.
//

import UIKit

class BusinessRespondToRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAppearance()
        updateViews()
    }
    
    // MARK - Private Methods
    
    private func setUpAppearance() {
        Appearance.setUpBlueButton(button: respondButton)
    }
    
    private func updateViews() {
        guard let request = request else { return }
        
        if request.category == "finance" {
            financeStackView.isHidden = false
        }
        
        titleLabel.text = request.title
        descriptionLabel.text = request.requestDescription
        dateLabel.text = request.date.dateFormatter()
        categoryLabel.text = request.category
        addressLabel.text = request.address
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func respondToRequest(_ sender: Any) {
        
        guard let request = request else { return }
        if request.category != "finance" {
            let alertController = UIAlertController(title: "Send a message", message: "Write your message", preferredStyle: .alert)
            
            alertController.addTextField(configurationHandler: nil)
            
            let alertAction = UIAlertAction(title: "Send", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            alertController.addAction(cancelAction)
            
            
            present((alertController), animated: true, completion: nil)
        }
    }
    
    // MARK - Properties
    
    var request: Request? {
        didSet {
            guard isViewLoaded else { return }
            updateViews()
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var respondButton: UIButton!
    @IBOutlet weak var financeStackView: UIStackView!
    
}
