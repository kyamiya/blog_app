class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy

  def has_written?(article)
    articles.exist?(id: article.id)
  end

  # username
  def display_name
    self.email.split('@').first
  end
  
end
