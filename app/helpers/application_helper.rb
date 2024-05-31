# frozen_string_literal: true

module ApplicationHelper
  def errors_for(form, field)
    return unless form.object.errors[field].any?

    tag.p(form.object.errors[field].join(', '), class: 'mt-2 text-xs text-red-600 dark:text-red-400')
  end

  def form_input_class(form, field)
    if form.object.errors[field].any?
      'border-red-600 dark:border-red-500 dark:focus:border-red-500 focus:border-red-600'
    else
      'border-gray-300 dark:border-gray-600 dark:focus:border-blue-500 focus:border-blue-600'
    end
  end

  def form_label_class(form, field)
    if form.object.errors[field].any?
      debugger
      'text-red-600 dark:text-red-500 peer-focus:text-red-600 peer-focus:dark:text-red-500'
    else
      'text-gray-500 dark:text-gray-400 peer-focus:text-blue-600 peer-focus:dark:text-blue-500'
    end
  end
end
