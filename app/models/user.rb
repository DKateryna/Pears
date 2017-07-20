class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_students, -> { where(admin: :false) }
  scope :all_admins, -> { where(admin: :true) }
  scope :ordered, -> { order(id: :asc) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    admin == true
  end
end
