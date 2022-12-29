func findContact(inputName : String){
    var correctCount : Int = 0
    for contact in ContactSet {
        guard contact.name == inputName else {
            continue
        }
        correctCount += 1
        print("- \(contact.name) / \(contact.age) / \(contact.phoneNumber)")
    }
    guard correctCount == 0 else{
        print("")
        return
    }
    print("연락처에 \(inputName)이 없습니다.\n")
}

