func validateInputBySlash(input: String) -> Bool {
    guard (input.filter{ $0 == "/" }.count == 2) else {
        return false
    }
    return true
}

func validateInputByHyphenNum(input: String) -> Bool {
    guard (input.filter { $0 == "-" }.count == 2) else {
        return false
    }
    return true
}
