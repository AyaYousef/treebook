class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :profile_name, presence: true
  validates :profile_name, uniqueness: true,
                            format: {
                              with: /\A[a-zA-Z0-9_\-]+\z/,
                              message: "Must be formatted correctly."}
  has_many :statuses
  # def fullname method is used to concatenate the first name and the last name together
  def full_name
    first_name + " " + last_name
  end
end
