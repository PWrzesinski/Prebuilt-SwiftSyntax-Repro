import Foundation

@attached(member, names: arbitrary)
public macro Example() = #externalMacro(
    module: "PSRMacros",
    type: "ExampleMacro"
)
