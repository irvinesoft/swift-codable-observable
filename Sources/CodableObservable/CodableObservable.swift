@attached(member, names: named(CodingKeys))
public macro CodableObservable() = #externalMacro(
    module: "CodableObservableMacros",
    type: "CodableObservableMacro"
)
