class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :statuses
  # def fullname method is used to concatenate the first name and the last name together
  def full_name
    first_name + " " + last_name
  end
end
