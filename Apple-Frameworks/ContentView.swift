//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Febry Ardiansyah on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MockData.frameworks) { item in
                        TitleView(framework: item)
                            .onTapGesture {
                                viewModel.selectedFramework = item
                            }
                    }
                })
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                FrameworkDetailView(
                    framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                    isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 80,height: 80)
            Text("\(framework.name)")
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
