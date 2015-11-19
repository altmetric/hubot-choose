# Description
#   Elected to lead, not to read
#
# Commands:
#   hubot choose <option> or <option> - choose between the options
#
# Author:
#   Altmetric LLP <infrastructure@altmetric.com>

module.exports = (robot) ->
  robot.respond /choose (?:between )?(.+?) (?:or|and) (.+)$/i, (res) ->
    options = res.match[1].split(/,\s*/)
    options.push(res.match[2])

    res.send res.random options
