class PostPolicy < ApplicationPolicy
  def update?
    # Case 1 = User of record or # Case 2 = Admin User
    record.user_id == user.id || admin_types.include?(user.type)
  end
end
