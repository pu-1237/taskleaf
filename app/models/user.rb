class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { maximum: 10 }
    validates :email, email: {allow_blank: true}

    has_many :tasks
end
