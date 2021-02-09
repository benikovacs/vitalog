module ApplicationHelper

    def gravatar_for(user, options = { size: 80 })
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")

    end

# to help with logged in/out state

def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #it checks whether the session already has a user, if not then it checks the database
end

def logged_in? #to check if the user is logged in
    !!current_user #!! turns current user into a boolean
end

end
