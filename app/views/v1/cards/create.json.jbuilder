json.data do
  json.user do
    json.partial! 'v1/cards/card', card: @card
  end
end
