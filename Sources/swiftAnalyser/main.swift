import Foundation
import SourceKittenFramework

func getImportModule(for component: String) -> String? {
    let file = File(contents: """
        import UIKit

        // Your code here...
        // For example:
        let \(component) = UIButton()
        """)


    let request = SourceKitRequest.cursorInfo(file: file, offset: 0)
    let cursorInfo = try? request.send()

    guard let module = cursorInfo?.importedModule else {
        return nil
    }

    return module
}

// Example usage:
if let importModule = getImportModule(for: "UIButton") {
    print("The import module for UIButton is: \(importModule)")
} else {
    print("Failed to retrieve the import module.")
}
