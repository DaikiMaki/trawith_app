class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :message, presence: true, length: { maximum: 140 }
  
  def template
    ApplicationController.renderer.render partial: "messages/message", locals: { message: self }
  end
end
