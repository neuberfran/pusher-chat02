class Chat < ApplicationRecord
  after_create :notify_pusher, if: :create

  def notify_pusher
    Pusher.trigger('chat', 'new', self.as_json)
  end
end
