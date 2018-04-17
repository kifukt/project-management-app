class CardMailer < ApplicationMailer
  default from: "notifier@kanban.pl"
  layout 'mailer'

  def new_card(card)
    mail(to: card.creator.email, subject: 'New card has been created')
  end
end
