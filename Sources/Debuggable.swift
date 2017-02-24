/// `Debuggable` provides an interface that allows a type
/// to be more easily debugged in the case of an error.
protocol Debuggable {
    
    /// The reason for the error.
    /// Typical implementations will switch over `self`
    /// and return a friendly `String` describing the error.
    /// - note: It is most convenient that `self` be a `Swift.Error`.
    ///
    /// Here is one way to do this:
    ///
    ///     switch self {
    ///     case someError:
    ///        return "A `String` describing what went wrong including the actual error: `Error.someError`."
    ///     // other cases
    ///     }
    var reason: String { get }
    
    /// The identifier that describes the error at hand in the form of
    /// `Module.Type.value`.
    /// - note: A default implementation returns `String(reflecting: self)`.
    var identifier: String { get }
    
    /// A `String` array describing the possible causes of the error.
    /// - note: Defaults to an empty array.
    /// Provide a custom implementation to give more context.
    var possibleCauses: [String] { get }
    
    /// A `String` array listing some common fixes for the error.
    /// - note: Defaults to an empty array.
    /// Provide a custom implementation to be more helpful.
    var suggestedFixes: [String] { get }
    
    /// An array of string `URL`s linking to documentation pertaining to the error.
    /// - note: Defaults to an empty array.
    /// Provide a custom implementation with relevant links.
    var documentationLinks: [String] { get }
    
    /// An array of string `URL`s linking to related Stack Overflow questions.
    /// - note: Defaults to an empty array.
    /// Provide a custom implementation to link to useful questions.
    var stackOverflowQuestions: [String] { get }
    
    /// An array of string `URL`s linking to related issues on Vapor's GitHub repo.
    /// - note: Defaults to an empty array.
    /// Provide a custom implementation to a list of pertinent issues.
    var gitHubIssues: [String] { get }
    
    /// A computed property returning a `String` that encapsulates
    /// why the error occurred, suggestions on how to fix the problem,
    /// and resources to consult in debugging (if these are available).
    /// - note: Consult the implementation of `generateDebugDescription()`
    /// in `Debuggable`'s protocol extension for details on how
    /// `log` is constructed by default.
    var log: String { get }
    
}

extension Debuggable {
    
    var identifier: String {
        return String(reflecting: self)
    }
    
    var possibleCauses: [String] {
        return []
    }
    
    var suggestedFixes: [String] {
        return []
    }
    
    var documentationLinks: [String] {
        return []
    }
    
    var stackOverflowQuestions: [String] {
        return []
    }
    
    var gitHubIssues: [String] {
        return []
    }
    
    var log: String {
        return generateDebugDescription()
    }
    
    private func mapAndJoin<T: CustomStringConvertible>(resource: [T]) -> String {
        return resource.map({ "\n- \($0)" }).joined()
    }
    
    private func generateDebugDescription() -> String {
        let debugString = "\(reason)\n"
        let id = "\nIdentifier: \(identifier)\n"
        var possibleCausesString = ""
        var suggestedFixesString = ""
        var documentationLinksString = ""
        var stackOverflowQuestionsString = ""
        var gitHubIssuesString = ""
        
        if !possibleCauses.isEmpty {
            possibleCausesString = "\nHere are some possible causes: \(mapAndJoin(resource: possibleCauses))\n"
        }
        
        if !suggestedFixes.isEmpty {
            suggestedFixesString = "\nThese suggestions could address the issue: \(mapAndJoin(resource: suggestedFixes))\n"
        }
        
        if !documentationLinks.isEmpty {
            documentationLinksString = "\nVapor's documentation talks about this: \(mapAndJoin(resource: documentationLinks))\n"
        }
        
        if !stackOverflowQuestions.isEmpty {
            stackOverflowQuestionsString = "\nThese Stack Overflow links might be helpful: \(mapAndJoin(resource: stackOverflowQuestions))"
        }
        
        if !gitHubIssues.isEmpty {
            gitHubIssuesString = "\nSee these Github issues for discussion on this topic: \(mapAndJoin(resource: gitHubIssues))"
        }
        
        return debugString +
            id +
            possibleCausesString +
            suggestedFixesString +
            documentationLinksString +
            stackOverflowQuestionsString +
            gitHubIssuesString
    }
    
}
