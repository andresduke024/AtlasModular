//
//  AtlasModular.swift
//  AtlasModular
//
//  Created by Andres Duque on 26/10/26.
//

import SwiftDependencyInjector
import AtlasRESTClient
import AtlasNavigator
import SwiftUI

@MainActor
public class AtlasModular {
    public static let shared = AtlasModular()
    
    private var modules: [AtlasModule] = []
    
    private init () {}
    
    public func start(with modules: [AtlasModule]) {
        Injector.global.turnOffLogger(forced: true)
        
        self.modules.append(contentsOf: modules)
        
        let dependenciesContainer = modules.map { $0.dependenciesContainer } + [
            AtlasRESTClientDependenciesContainer.shared
        ]
        
        dependenciesContainer.forEach { container in
            container.startInjection()
        }
    }
    
    public func getEntryPoint(from routeWrapper: RouteWrapper) -> EntryPoint? {
        return modules
            .lazy
            .compactMap { $0.route.resolve(from: routeWrapper) }
            .first
    }
}
