module CreateActivity
  def create_relationship_activities action_type
    Activity.create user_id: self.follower_id, target_id: self.followed_id,
      action_type: action_type
  end

  def create_lesson_activities action_type
    Activity.create user_id:self.user_id, target_id: self.id,
      action_type: action_type
  end
end
