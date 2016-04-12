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

  # This method is used to retrieve the user's image who signed up in gravatar.com
  # it gets the user's image by his email
  def gravatar_url
    # to remove white spaces from email
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}"
  end
end
