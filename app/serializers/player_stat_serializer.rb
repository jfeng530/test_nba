class PlayerStatSerializer < ActiveModel::Serializer
  attributes :id, :ast
  has_one :player
  has_one :teamSeason
end
