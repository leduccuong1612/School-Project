class User < ApplicationRecord
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :request_words_documents      

  enum role: [:student, :manager, :staff]

  private
    def set_default_role
      self.role ||= :student
    end

    def email_required?
      false
    end
end
