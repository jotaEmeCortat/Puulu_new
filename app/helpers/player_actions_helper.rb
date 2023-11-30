module PlayerActionsHelper
  def player_action_message(player_action)
    if (player_action.kind == 'Shot' && player_action.position == 'C2M')
      "Centre shot - #{player_action.result}"
      
    elsif  (player_action.kind == 'Shot' && player_action.position != 'C2M')
      "Action shot - #{player_action.result}"
    elsif (player_action.kind == 'Exclusion' && player_action.position == 'C2M')
      'Centre forward position exclusion'
    elsif (player_action.kind == 'Exclusion' && player_action.position != 'C2M')
      'Field exclusion'
    else
      player_action.kind
    end
  end
end
