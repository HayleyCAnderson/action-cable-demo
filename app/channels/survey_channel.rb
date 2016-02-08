class SurveyChannel < ApplicationCable::Channel
  def subscribe(data)
    stream_from "surveys:#{data['id']}"
  end
end
