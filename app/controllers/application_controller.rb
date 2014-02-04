class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_access_control_headers

  def  set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Allow-Credentials'] = "true"
  end

  def instagram
    @access_token = params[:access_token]
  end

  def home
    if request.post? # for the POST exercise.
      if params[:color].blank?
        render :json => { :error => "Color parameter can't be blank." }
      else
        render :json => { :success => "I like #{params[:color]} too!" }
      end
    end
  end

  def instagram_login
    redirect_to "https://instagram.com/oauth/authorize/?client_id=#{INSTAGRAM_CLIENT_ID}&redirect_uri=#{INSTAGRAM_REDIRECT_URI}&response_type=token"
  end
end