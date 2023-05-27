class Book < ApplicationRecord
    belongs_to :user
    after_create :update_status

    def update_status
        update_columns(status: "draft")
    end
end
