//
//  TestView.swift
//  SocketTester
//
//  Created by Daniel Morgan on 20/09/2021.
//

import SwiftUI
import Combine

struct TestView: View {
    
    @StateObject var viewModel = TestViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.subscriptionResults, id:\.self) { result in
                Text("Received: \(result)")
            }
        }
        .onAppear(perform: {
            viewModel.subscribe()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Trigger") {
                    viewModel.trigger()
                }
            }
        }
        .navigationTitle("Socket Tester")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
