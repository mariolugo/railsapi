class Notice < ActiveRecord::Base
    belongs_to :user
    belongs_to :comite
    has_one :notice_type
end
