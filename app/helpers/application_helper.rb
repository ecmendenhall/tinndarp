require 'gravatar'

module ApplicationHelper

  def gravatar_for(*args)
    Gravatar.for(*args)
  end
end
