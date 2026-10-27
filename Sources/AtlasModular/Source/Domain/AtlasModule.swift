//
//  AtlasModule.swift
//  AtlasModular
//
//  Created by Andres Duque on 26/10/26.
//

import SwiftDependencyInjector
import AtlasNavigator

public protocol AtlasModule {
    var dependenciesContainer: DependenciesInjectorProtocol { get }
    
    var route: BaseRoute { get }
}
