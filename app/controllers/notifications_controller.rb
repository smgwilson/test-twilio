require 'twilio-ruby'

class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(:body => "Learning to send SMS you are",
                                              :to => "+19543260737",
                                              :from => "+15102963225",
                                              :media_url => "http://linode.rabasa.com/yoda.gif",
                                              :status_callback => request.base_url + '/twilio/status')

    puts message.to

    render plain: message.status
  end

end
