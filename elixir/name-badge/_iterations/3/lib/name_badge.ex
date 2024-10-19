defmodule NameBadge do
  def print(id, name, department) do
    badge_text = if id != nil do
      "[#{id}] - "
    end
    badge_text = if name != nil do
      "#{badge_text}#{name} - "
    end
    if department != nil do
      "#{badge_text}#{department |> String.upcase()}"
    else
      "#{badge_text}OWNER"
    end
  end
end
