import Foundation
import SourceKittenFramework

func getImportModule(for component: String) -> String? {
    let file = File(contents: """
        import UIKit

        // Your code here...
        // For example:
        let \(component) = UIButton()
        """)

    let structure = Structure(file: file)

    guard let decl = structure.dictionary.substructure.first(where: { subDict in
        return subDict.declarationKind == .varInstance &&
               subDict.name == component
    }) else {
        return nil
    }

    guard let typeName = decl.typeName else {
        return nil
    }

    let components = typeName.components(separatedBy: ".")
    return components.first
}
