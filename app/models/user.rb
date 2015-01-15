class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todoo

  after_create :init

  def init
    BOOKS.each do |item|
      @todo = Todoo.create(name: item, done: false, user: self)
    end
  end

end
