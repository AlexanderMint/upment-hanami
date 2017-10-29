# frozen_string_literal: true

class RoleRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def admin?(user_id)
    with_role?(user_id, 'admin')
  end

  def with_role?(user_id, role)
    !roles.where(user_id: user_id, name: role).one.nil?
  end
end
