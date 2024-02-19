import Foundation
import SourceKittenFramework

func getImportModule(for expression: String) -> String? {
    let file = File(contents: "import UIKit\nlet \(expression) = UIButton()")

    let arguments: [String] = ["-sdk", "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk", "-target", "x86_64-apple-ios12.0-simulator"]

    let offset = Int64(file.contents.utf8.count)

    let request = Request.cursorInfo(file: file.path ?? "", offset: offset, arguments: arguments)
    let cursorInfo = try? request.send()

    guard let module = cursorInfo?["key.modulename"] as? String else {
        return nil
    } 

    return module
}

func main() {
    // Example usage:
    if let importModule = getImportModule(for: "myButton") {
        print("The import module for myButton is: \(importModule)")
    } else {
        print("Failed to retrieve the import module.")
    }
}

// Only execute the `main` function if this module is the main executable
if CommandLine.arguments.contains(where: { $0 == "-run" }) {
    main()
}
