# frozen_string_literal: true

module ReposHelper
  def repo_nav_item_classes(repo)
    classes = %w[nav-link]
    classes << 'active' if repo == @repo
    classes.join(' ')
  end
end
