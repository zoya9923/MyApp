
    class User < ApplicationRecord
        has_one :profile
        has_many :books
        has_many :orders
        validates_presence_of :email
    end

