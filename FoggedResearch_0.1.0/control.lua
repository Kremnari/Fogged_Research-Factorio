function hide_tech(node)
  local hide = true
  local count = 0
  for k, v in pairs(node.prerequisites) do 
    count = count + 1
    if v.researched then
      hide = false
    end
    for k2, v2 in pairs(v.prerequisites) do
      if v2.researched then
        hide = false
      end
    end
  end
  if count > 0 and hide == true then
    node.enabled = false
  else 
    node.enabled = true
  end
  return
end

function research_loop(event)
  local techs = game.players[1].force.technologies
  for k, v in pairs(techs) do
    hide_tech(v)
  end
end

function research_loop_joined(num)
  local techs = game.players[1].force.technologies
  for k, v in pairs(techs) do
    hide_tech(v)
  end
end



script.on_event(defines.events.on_player_joined_game, research_loop_joined)
script.on_event(defines.events.on_research_finished, research_loop)