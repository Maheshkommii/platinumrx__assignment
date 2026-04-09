def remove_duplicates(s):
    result = ""

    for ch in s:
        if ch not in result:
            result += ch

    return result


user_input = input("Enter a string: ")

if user_input.strip() == "":
    print("Please enter a valid non-empty string.")
else:
    result = remove_duplicates(user_input)
    print("Output:", result)