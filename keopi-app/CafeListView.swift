//
//  ContentView.swift
//  keopi-app
//
//  Created by Luka Vujnovac on 05.01.2022..
//

import SwiftUI

struct CafeListView: View {
    
    @StateObject private var vm = CafeListViewModel()
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("backgroundColor"))
            
            VStack(spacing: 20){
                VStack(spacing: 20) {
                    logoView
                    
                    HStack(spacing: 20) {
                        searchView
                        filterView
                    }
                    .frame(maxHeight: 55)
                    .shadow(radius: 10)
                }
                
                VStack{
                    HStack {
                        Text("Promo")
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                        
                        Spacer()
                    }
                    
                    
                    List{
                        ForEach(vm.cafes) {cafe in 
                            VStack(alignment: .leading) {
                                Text(cafe.name)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                Text(cafe.location)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Spacer()
                
            }//glavi vstack
            .padding(.horizontal, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CafeListView()
    }
}

extension CafeListView {
    
    private var logoView: some View {
        VStack{
            Image(systemName: "crown.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .foregroundColor(Color("goldColor"))
                .shadow(radius: 10)
                .padding()
        }
    }
    
    private var searchView: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.white)
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .scaleEffect(1.4)
                        .padding()
                        .onTapGesture { 
                            vm.searchText = ""
                        }
                    
                    TextField("Search...", text: $vm.searchText)
                }
            )
    }
    
    private var filterView: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.white)
            .frame(maxWidth: 60)
            .overlay(
                Image("filter")
                    .resizable()
                    .frame(width: 30, height: 30)
            )
    }
}
