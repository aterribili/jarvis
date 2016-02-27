# Description
# Just testing some hubot scripts

module.exports = (robot) ->

  robot.respond /how many pull requests has in (.*) from (.*)/i, (msg) ->
    term = msg.match[1]
    repo = msg.match[2]
    msg.http("https://api.github.com/repos/#{repo}/#{term}/pulls?access_token={seu-access-token}")
    .header('Accept', 'application/json')
    .get() (err, response, body) ->
      try
        data = JSON.parse(body)
        count = 0
        for pr in data 
          count+=1
        msg.reply "Has #{count} pull requests"
      catch err
        msg.reply "Error while parsing JSON :("

  team_members = [
    "Abner",
    "Felipe",
    "Pilon"
  ]

  robot.respond /who can review PR in (.*) from (.*)/i, (msg) ->
    term = msg.match[1]
    repo = msg.match[2]
    
    msg.http("https://api.github.com/repos/#{repo}/#{term}/pulls?access_token={seu-access-token}")
    .header('Accept', 'application/json')
    .get() (err, response, body) ->
      try
        data = JSON.parse(body)
        for pull in data 
          msg.reply "#{msg.random team_members} should review #{pull.title}"
      catch err
          msg.reply "No PRs to review"

