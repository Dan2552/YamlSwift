import Foundation

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
    default:
        return ""
    }
}

func serializeArray(array: [Yaml]) -> String {
    let strings: [String] = array.map({ yaml -> String in
        let s: String = serializeYaml(yaml)
        return s
    })
    
    var result = "["
    for (index, string) in strings.enumerate() {
        if index < strings.count - 1 {
            result += "\(string), "
        } else {
            result += string
        }
    }
    result += "]"
    return result
}
