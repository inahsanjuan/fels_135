class Relationship < ActiveRecord::Base
  include CreateActivity

  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  after_create :create_activity_follow
  before_destroy :create_activity_unfollow

  private
  def create_activity_follow
    create_relationship_activities Settings.activity.follow
  end

  def create_activity_unfollow
    create_relationship_activities Settings.activity.unfollow
  end
end
