class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :trackable, :timeoutable


  ############### RELATIONS ####################
  has_many :courses
  has_many :levels
  has_many :materials
  has_many :statuts
  has_many :exercises
  has_many :questions
  has_many :results
  has_many :articles
  
  ############### VALIDATIONS ####################
  
  #enum :role, student: "student", teacher: "teacher", team: "team", default: "student"
  
  
  before_validation  :full_name#, :user_referral_id

  
  validates :first_name, :last_name, :full_name, :email, :password,
              :contact, :user_role, :city_name, presence: true

  validates :contact, uniqueness: true, numericality: { only_integer: true }, length: { is:10,
              message: "verifier que votre nom numéro est 10 chiffres"}
 
              
   validates :user_role, inclusion: { in: %w(Student Teacher Team Ambassador),
                    message: "%{value} acces non identifier" }
  
  
  ################  FULL NAME ###########
  def full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  ################  CONTACT ###########
  def strip_fields
    self.contact = contact.gsub(/\s+/, "") #Delete espace into fields
  end
  ################## SLUG ###############
    extend FriendlyId
    friendly_id :user_slugged, use: :slugged
    def user_slugged
        [
        :full_name,
        [:full_name, :contact]
        ]
    end
  ################## END SLUGGED #########
  
  ################## BEFORE SAVE  #########
  before_save do
    self.contact            = contact.strip.squeeze("")
    self.first_name         = first_name.strip.squeeze("").downcase.capitalize
    self.last_name          = last_name.strip.squeeze("").downcase.capitalize
    self.city_name          = city_name.downcase.capitalize
    self.matricule          = matricule.downcase
  end
end
