class Character < ApplicationRecord
    serialize :quests, Array, default: [], accessor: :quests, coder: JSON
    serialize :questsDone, Array, default: [], accessor: :questsDone, coder: JSON
    serialize :fights, Array, default: [], accessor: :fights, coder: JSON
end
