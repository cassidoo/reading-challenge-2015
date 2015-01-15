require 'books'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todoo

  after_create :init

  def init
    BOOKS.each do |item|
      @t = Todoo.new(name: item, done: false, user_id: current_user)
      #Make this work.
      #@t.user = self
      #@t.save()
    end
  end
end
