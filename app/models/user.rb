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
  after_create :welcome_email
  after_create :autoresponder
  #validates :city, :presence => true

  has_many :attendees
  has_many :interests, :dependent => :destroy
  has_many :waiting_lists
  has_many :comments
  


  accepts_nested_attributes_for :interests, :allow_destroy => true

  def welcome_email
    WelcomeMailer.welcome(email, name).deliver  
  end

  def autoresponder
    #WelcomeMailer.autoresponder(email, name).deliver
    require 'mandrill'
  time_to_send_this_mail_at = (Time.now.utc) + (30*60)

    begin
    mandrill = Mandrill::API.new 'NEsY0G9QRETYPOjQLkMTrA'
    template_name = "need-help-autoresponder"
    template_content = [{"content"=>"#{name}", "name"=>"FNAME"}]
    message = {"merge_vars"=>
        [{"rcpt"=>"recipient.email@example.com",
            "vars"=>[{"name"=>"FNAME", "content"=>"#{name}"}]}],
     "url_strip_qs"=>nil,
     "return_path_domain"=>nil,
     "from_name"=>"Prashant Angyan",
     "to"=>[{"name"=>"#{name}", "email"=>"#{email}"}],
     "from_email"=>"prashant@letsdine.co",
     #"tags"=>["password-resets"],
     "global_merge_vars"=>[{"name"=>"FNAME", "content"=>"#{name}"}],
     "merge"=>true,
     "track_opens"=>nil,
     "headers"=>{"Reply-To"=>"prashant@letsdine.co"}}
    async = false
    ip_pool = "Main Pool"
    send_at = "#{time_to_send_this_mail_at}"
    result = mandrill.messages.send_template template_name, template_content, message, send_at
        # [{"email"=>"recipient.email@example.com",
        #     "status"=>"sent",
        #     "_id"=>"abc123abc123abc123abc123abc123",
        #     "reject_reason"=>"hard-bounce"}]
    
rescue Mandrill::Error => e
    # Mandrill errors are thrown as exceptions
    puts "A mandrill error occurred: #{e.class} - #{e.message}"
    # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
    raise
end
# Mandrill call end

    
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
