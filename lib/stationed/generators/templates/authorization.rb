# Controller concern for authorization using Pundit. This ensures that actions
# properly use Pundit's authorization hooks (`authorize` and `policy_scope`).
module Authorization
  extend ActiveSupport::Concern
  include Pundit

  included do
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index
  end
end
