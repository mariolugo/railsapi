class Comite < ActiveRecord::Base
    has_many :users
    has_many :notices
end
