import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct PSRMacrosPlugin: CompilerPlugin {
    
    let providingMacros: [Macro.Type] = [
        ExampleMacro.self
    ]
}
