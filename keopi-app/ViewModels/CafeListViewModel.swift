//
//  CafeListViewModel.swift
//  keopi-app
//
//  Created by Luka Vujnovac on 06.01.2022..
//

import Foundation
import SwiftUI
import Combine

class CafeListViewModel: ObservableObject {
    @Published var searchText: String = ""
    
    @Published var cafes: CafeListModel?
    var cancellabels = Set<AnyCancellable>()
    
    init() {   
        getCafes()
    }
    
    func getCafes() {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/cafes?seed=4") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: CafeListModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] returnedCafeListModel in
                self?.cafes = returnedCafeListModel
            })
            .store(in: &cancellabels)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
        return output.data
    }
}

