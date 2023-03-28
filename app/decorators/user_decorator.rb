class UserDecorator < ApplicationDecorator
  delegate_all

  def name_or_email
    return username if username.present?

    email.split('@')[0]
  end

end
