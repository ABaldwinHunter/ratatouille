def set_error(err_msg)
  session[:error] = err_msg
end

def get_error_messages(errors_hash)
  errors = []
  errors_hash.each do |key, value|
    case key
    when :password_confirmation
      errors << "Password confirmation must match password."
    when :password
      errors << "Please provide a password"
    when :email
      errors << "Sorry, that email is already taken"
    end
  end
  return errors
end

def format_errors(error_ary)
  error_msg = "<br>"
  error_ary.each do |msg|
    error_msg += msg + "<br>"
  end
  error_msg
end

def present_errors(hash)
  msgs = get_error_messages(hash) #returns array
  error_string = format_errors(msgs) #returns string
  set_error(error_string)
end

def display_error
  error = session[:error]
  session[:error] = nil
  error
end
