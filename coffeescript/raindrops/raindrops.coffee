class Raindrops
  @convert: (number) ->
    message = ""
    if number % 3 == 0 
        message += "Pling"
    if number % 5 == 0 
        message += "Plang"
    if number % 7 == 0
        message += "Plong"
    return message or "#{number}"

module.exports = Raindrops
