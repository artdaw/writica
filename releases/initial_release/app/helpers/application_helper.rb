module ApplicationHelper
  def format_error_message(instance, field)
    errors = instance.errors[field]
    
    if errors.any?
        %(<span class="validation_error">&nbsp;#{errors.join(', ')}</span>).html_safe
    end
  end
end
