//
//  ContentView.swift
//  PenCakeClone
//
//  Created by Celan on 2023/03/18.
//

import SwiftUI

struct ContentView: View {
    @State private var isOptionBtntabbed: Bool = false
    
    var name = ""
    
    var body: some View {
        VStack {
            if isOptionBtntabbed {
                ScrollView(showsIndicators: false) {
                    Text("앱 설정")
                    
                    Text("이 이야기")
                    
                    Text("모든 이야기")
                    
                    Text("검색")
                    
                    Text("글 추가")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
            } else {
                GeometryReader { proxy in
                    let headerMinY = proxy.frame(in: .named("HEADER")).minY
                    let safeArea = proxy.safeAreaInsets
                    let size = proxy.size
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 25) {
                            Text("\(headerMinY.description)")
                                .padding(.top, 25)
                                .font(.title)
                            
                            Text("proxy: \(proxy.size.height.description)")
                                .font(.body)
                        }
                        .frame(width: proxy.size.width)
                        .offset(
                            y: proxy.frame(in: .local).minY > 0
                            ? -proxy.frame(in: .local).minY: 0
                        )
                        .coordinateSpace(name: "HEADER")
                        
                        Divider()
                            .padding(.top, 40)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 20)
                        
                        LazyVStack {
                            ForEach(0..<5) { int in
                                HStack {
                                    Text("글 \(int)")
                                    
                                    Spacer()
                                    
                                    Text(Date.now.formattedDateString())
                                        .font(.caption)
                                        .foregroundColor(Color(.systemGray2))
                                }
                                .padding(.top, 25)
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                    .coordinateSpace(name: "SCROLLVIEW")
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                isOptionBtntabbed.toggle()
            } label: {
                Image(
                    systemName:
                        isOptionBtntabbed
                    ? "xmark"
                    : "ellipsis.circle.fill"
                )
                    .resizable()
                    .frame(
                        width: isOptionBtntabbed ? 30 : 60,
                        height: isOptionBtntabbed ? 30 : 60
                    )
                    .foregroundColor(Color(.systemGray4))
                    .padding(
                        isOptionBtntabbed
                        ? 30
                        : 15
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
