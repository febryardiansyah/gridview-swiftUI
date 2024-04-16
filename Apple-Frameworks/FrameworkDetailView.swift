//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Febry Ardiansyah on 05/04/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isShowingDetailView = false
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44,height: 44)
                })
            }.padding()
            
            Spacer()
            
            TitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
                
            Spacer()
            
            Button(action: {
                openURL(URL(string: framework.urlString)!)
            }, label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework,isShowingDetailView: .constant(false))
    }
}
