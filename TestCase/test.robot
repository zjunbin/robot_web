*** Test Cases ***
randnumber
    ${phoneNumber}    Evaluate    random.randint(0,8)    random
    BuiltIn.Log    ${phoneNumber}    