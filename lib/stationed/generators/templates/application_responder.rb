# Base responder for our application, that uses the Responders gem to mix in
# extra functinoality into Rails' default Responder.
class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
end
