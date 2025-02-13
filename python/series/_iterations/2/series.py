def slices(series, length):
    if series == "":
        raise ValueError("series cannot be empty")
    if length > len(series):
        raise ValueError("slice length cannot be greater than series length")
    if length == 0:
        raise ValueError("slice length cannot be zero")
    if length < 0:
        raise ValueError("slice length cannot be negative")

    return [
        series[index : index + length]
        for index in range(len(series))
        if (index + length) <= len(series)
    ]
