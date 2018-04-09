json.data do
  json.array! @cards do |card|
    json.partial! 'v1/cards/card', card: card
  end
end
