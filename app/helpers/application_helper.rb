module ApplicationHelper
  def check_active(cont, act)
    if cont==controller_name and act==action_name
      "active"
    end
  end
end
