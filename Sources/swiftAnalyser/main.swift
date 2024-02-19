import Foundation
import SourceKittenFramework

func getImportModule(for component: String) -> String? {
    let code = """
        import UIKit

        // Your code here...
        // For example:
        let \(component) = UIButton()
        """

    // Convert the code string to NSData
    guard let data = code.data(using: .utf8) else {
        print("Failed to convert code string to data.")
        return nil
    }

    // Parse the Swift code using SourceKitten
    let structure = Structure(file: File(data: data))
    guard let substructure = structure.substructure.first else {
        print("Failed to parse code structure.")
        return nil
    }

    // Find the import statements in the parsed structure
    let imports = substructure.substructure.filter { $0.kind == .import }
    guard let importModule = imports.first?.name else {
        print("No import statements found.")
        return nil
    }

    // Extract the import module from the import statement
    let components = importModule.components(separatedBy: ".")
    return components.last
}

// Example usage:
if let importModule = getImportModule(for: "UIButton") {
    print("The import module for UIButton is: \(importModule)")
} else {
    print("Failed to retrieve the import module.")
}
