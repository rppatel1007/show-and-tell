module OverviewHelper
  def flip_form_helper(model, args, &block)
    form_type = Flip.placeholder_over_label? ? 'minimal_form_for' : 'simple_form_for'
    send(form_type, model, args, &block)
  end

  def flip_form_button(form, id)
    params = Flip.edit_in_place? ? {type: 'button', class: 'edit-save', data: {id: id}} : nil
    form.button(:submit, params)
  end
end
