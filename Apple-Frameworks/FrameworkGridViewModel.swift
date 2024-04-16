//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Febry Ardiansyah on 05/04/24.
//

import Foundation

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView: Bool = false
}
