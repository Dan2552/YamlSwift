import Foundation

// Missing:
// - Flow seq
// - Flow map
// - Directives
// - Aliases

// TODO spacing!
func serializeYaml (yaml: Yaml) -> String {
    switch yaml {
    case .String:
        return yaml.string!
    case .Bool(true):
        return "true"
    case .Bool(false):
        return "false"
    case .Int:
        return "\(yaml.int!)"
    case .Double:
        return "\(yaml.double!)"
    case .Array:
        return serializeArray(yaml.array!)
    case .Dictionary:
        return serializeDictionary(yaml.dictionary!)
    default:
        return ""
    }
}

func serializeArray(array: [Yaml]) -> String {
    var result = ""
    for (index, element) in array.enumerate() {
        let line = "- \(serializeYaml(element))"
        if index < array.count - 1 {
            result += "\(line)\n"
        } else {
            result += line
        }
    }
    return result
}

func serializeDictionary(dictionary: [Yaml: Yaml]) -> String {
    var result = ""
    for (index, (key, value)) in dictionary.enumerate() {
        let line = "\(serializeYaml(key)): \(serializeYaml(value))"
        
        if index < dictionary.keys.count - 1 {
            result += "\(line)\n"
        } else {
            result += line
        }
    }
    return result
}
