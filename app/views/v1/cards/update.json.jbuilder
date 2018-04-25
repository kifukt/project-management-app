json.data do
  json.card do
    json.partial! 'v1/cards/card', card: @card
  end
end
