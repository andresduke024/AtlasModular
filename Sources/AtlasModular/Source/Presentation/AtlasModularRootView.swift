//
//  AtlasModularRootView.swift
//  AtlasModular
//
//  Created by Andres Duque on 26/10/26.
//

import SwiftUI
import AtlasNavigator

public struct AtlasModularRootView<Content: View>: View {
    
    private let content: () -> Content
    
    public init(
        modules: [AtlasModule],
        @ViewBuilder content: @escaping () -> Content
    ) {
        AtlasModular.shared.start(with: modules)
        
        self.content = content
    }

    
    @StateObject
    private var router = Router()
    
    public var body: some View {
        NavigationModule(onNavigateTo: onNavigateTo(_:)) {
            content()
        }
        .environmentObject(router)
    }
    
    @ViewBuilder
    private func onNavigateTo(_ route: RouteWrapper) -> some View {
        if let entryPointBuilder = AtlasModular.shared.getEntryPoint(from: route) {
            AnyView(entryPointBuilder())
        } else {
            EmptyView()
        }
    }
}
