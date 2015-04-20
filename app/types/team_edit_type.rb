class TeamEditType < Team
  include ApplicationType

  permit :title, :description, :image
end
