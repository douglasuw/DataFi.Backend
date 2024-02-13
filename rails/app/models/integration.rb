class Integration < ApplicationRecord
    belongs_to :project
    belongs_to :data_source
    belongs_to :field
end
