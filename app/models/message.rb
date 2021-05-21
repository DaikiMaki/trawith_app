class Message < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_one_attached :image
  belongs_to :user
  belongs_to :room
  validates :message, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "は有効な画像形式である必要があります" },
                      size:         { less_than: 5.megabytes,
                                      message: "は5MB未満である必要があります" }

  def template
    ApplicationController.renderer.render partial: "messages/message", locals: { message: self }
  end
  
end
