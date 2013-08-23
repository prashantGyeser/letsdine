# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  oauth_token            :string(255)
#  oauth_expires_at       :string(255)
#  image                  :string(255)
#  city                   :string(255)
#  role                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,  :interests_attributes, :city
  # attr_accessible :title, :body

  # Sending out a welcome email after a person registers
  #after_create :welcome_email

  has_many :attendees
  has_many :interests, :dependent => :destroy
  has_many :waiting_lists
  has_many :comments
  


  accepts_nested_attributes_for :interests, :allow_destroy => true

  def welcome_email
    WelcomeMailer.welcome(email, name).deliver  
  end

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      logger.debug user.inspect
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
  		user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end


  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  # Methods to make the password and email fields not required when creating a user, using their facebook login
  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def self.total_signups_on(date)
    where("date(created_at) = ?", date).count
  end

  def self.total_signups_this_month
    where("created_at > ? and created_at < ?", Time.now.beginning_of_month.to_date, Time.now.end_of_month.to_date).count
  end

end
