class RegistrationsController < Devise::RegistrationsController

  protected

  def after_signup_path_for(resorce)
    root_path
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
