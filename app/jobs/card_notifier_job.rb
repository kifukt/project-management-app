class CardNotifierJob < ApplicationJob
  queue_as :default

  def perform()
    puts 'test'
  end
end
