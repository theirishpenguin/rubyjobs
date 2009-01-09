# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def set_focus_to_id(id)
    javascript_tag("$('##{id}').focus()")
  end
  
  def param_present?(param_name)
    params[param_name] && !params[param_name].blank?
  end

  def main_nav
    if params[:controller] == 'jobs' and ['new', 'edit'].include?(params[:action])
      link_to('<< Return to jobs list', :root)
    else
      link_to('Post a new job >>', new_job_path)
    end
  end
  
end
