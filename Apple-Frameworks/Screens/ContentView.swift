//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Febry Ardiansyah on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("List View",isOn: $viewModel.isListView)
                    .onTapGesture {
                        viewModel.isListView.toggle()
                    }.padding()
                if !viewModel.isListView {
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns, content: {
                            ForEach(MockData.frameworks) { item in
                                ItemVertical(framework: item)
                                    .onTapGesture {
                                        viewModel.selectedFramework = item
                                    }
                            }
                        })
                        
                    }
                    .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                        FrameworkDetailView(
                            framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                            isShowingDetailView: $viewModel.isShowingDetailView,
                            isListView: .constant(true)
                        )
                    })
                } else {
                    List {
                        ForEach(MockData.frameworks) {item in
                            NavigationLink(
                                destination: FrameworkDetailView(
                                    framework: item,
                                    isShowingDetailView: $viewModel.isShowingDetailView,
                                    isListView: .constant(false)
                                )){
                                ItemGrid(framework: item)
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("🍎 Frameworks")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ItemVertical: View {
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

struct ItemGrid: View {
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 80, height: 80)
            Text("\(framework.name)")
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
            
        }
    }
}
