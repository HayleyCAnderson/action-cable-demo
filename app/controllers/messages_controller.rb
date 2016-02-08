class MessagesController < ApplicationController
  def handle
    data = params[:Body].gsub(/\D/, ' ').split
    survey_id = data.first.to_i
    answer_number = data.last.to_i

    if survey_id > 0 && answer_number > 0
      message = "You voted in Survey #{survey_id} for Answer #{answer_number}!"
      ActionCable.server.broadcast("surveys:#{survey_id}", {vote: answer_number})
    else
      message = 'Try again with both survey and answer number!'
    end

    render plain: message
  end
end
