class MessagesController < ApplicationController
  respond_to :json, :xml

  def index
    @messages = Message.where("id > #{params['last_message_id']}")
    render :json => @messages
  end

  def create
    if message = Message.create(:text => params[:text],
                                :user => params[:user])
      render :json => { :message => message, :status => 201 }
    else
      render :json => { :error => message.errors, :status => 304 }
    end
  end
end
