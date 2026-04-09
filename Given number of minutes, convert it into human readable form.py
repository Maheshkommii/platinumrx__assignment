def convert_minutes(minutes):
    if minutes < 0:
        return "Invalid input. Please enter a positive number."

    hours = minutes // 60
    remaining = minutes % 60

    if hours == 0:
        return f"{remaining} minutes"
    elif hours == 1:
        return f"1 hr {remaining} minutes"
    else:
        return f"{hours} hrs {remaining} minutes"


try:
    minutes = int(input("Enter total minutes: "))
    result = convert_minutes(minutes)
    print("Output:", result)
except ValueError:
    print("Please enter a valid number.")