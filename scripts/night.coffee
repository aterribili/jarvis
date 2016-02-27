ways_to_say_good_night = [
  "Good night, sucker!",
  "Cheers"
]

module.exports = (robot) ->
  robot.hear /(good night|by|nighty night)/i, (msg) ->
    msg.send msg.random ways_to_say_good_night
