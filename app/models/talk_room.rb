class TalkRoom < ApplicationRecord

    enum status:{
        between_team:1,
        in_team:2
    }

end
