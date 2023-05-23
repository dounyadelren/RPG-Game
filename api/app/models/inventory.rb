class Inventory < ApplicationRecord
    serialize :items, Array, default: [], accessor: :items, coder: JSON 
end
