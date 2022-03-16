//
//  LogManager.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

private enum LogType: String {
    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}

class LogManager {
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    private static var dateFormat = "hh:mm:ss"
    private static var isLoggingEnabled: Bool { return true }
    
    class func e( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if self.isLoggingEnabled {
            print("LogManager: \(Date().toString()) \(LogType.e.rawValue)[\(self.sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func i( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if self.isLoggingEnabled {
            print("LogManager: \(Date().toString()) \(LogType.i.rawValue)[\(self.sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func d( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if self.isLoggingEnabled {
            print("LogManager: \(Date().toString()) \(LogType.d.rawValue)[\(self.sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func v( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if self.isLoggingEnabled {
            print("LogManager: \(Date().toString()) \(LogType.v.rawValue)[\(self.sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func w( _ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if self.isLoggingEnabled {
            print("LogManager: \(Date().toString()) \(LogType.w.rawValue)[\(self.sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object!)")
        }
    }
    
    class func s( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if self.isLoggingEnabled {
            print("LogManager: \(Date().toString()) \(LogType.s.rawValue)[\(self.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    class func req(_ request: RequestModel) {
        guard self.isLoggingEnabled else { return }
        
        let endpoint: String = request.endpoint
        let path: String = request.path
        let headers: String = String(describing: request.headers)
        let httpMethod: String = String(describing: request.method.rawValue)
        var body: String = ""
        var bodyStrings: [String] = []
        
        for (_, value) in request.body.enumerated() {
            if let valueValue = value.value {
                bodyStrings.append("\(value.key): \(type(of: valueValue))(\(valueValue))")
            } else {
                bodyStrings.append("\(value.key): nil")
            }
        }
        body = bodyStrings.joined(separator: ", ")
        
        var log: String = "[\(endpoint)\(path)]"
        
        if !request.headers.isEmpty { log = log + "\n\(headers)" }
        
        log = log + "\n[\(httpMethod)]"
        
        if !request.body.isEmpty { log = log + "\n[\(body)]" }
        
        print("LogManager: \n--- Request ---\n[\(Date().toString())] \n\(log) \n--- End ---\n")
    }
    
    class func res<T: Codable>(_ response: ResponseModel<T>) {
        guard self.isLoggingEnabled else { return }
        
        let endpoint: String? = response.request?.endpoint
        let path: String? = response.request?.path
        let isSuccess: Bool = response.isSuccess
        let message: String = response.message
        let dataJSON: String? = response.json
        
        var log: String = ""
        
        if let endpoint = endpoint, let path = path { log = log + "[\(endpoint)\(path)]\n" }
        
        log = log + "[isSuccess: \(isSuccess)]\n[message: \(message)]"
        
        if let json = dataJSON { log = log + "\n[\(json)]" }
        
        print("LogManager: \n--- Response ---\n[\(Date().toString())] \n\(log) \n--- End ---\n")
    }
    
    class func err(_ error: ErrorModel) {
        guard self.isLoggingEnabled else { return }
        
        let errorKey: String? = error.messageKey
        let errorMessage: String? = error.message
        
        var log: String = ""
        
        if let errorKey = errorKey { log = log + "\n[key: \(errorKey)]" }
        if let errorMessage = errorMessage { log = log + "\n[message: \(errorMessage)]" }
        
        if log.isEmpty { return }
        
        print("LogManager: \n--- Error ---\n[\(Date().toString())] \(log) \n--- End ---\n")
    }
}

private extension LogManager {
    
    class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {
    func toString() -> String { return LogManager.dateFormatter.string(from: self as Date) }
}
