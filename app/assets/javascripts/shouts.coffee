# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).ready( ($) ->
	$.ajaxSetup({
	  dataType: 'json'
	})

	String.prototype.replaceDataTags = (dataTags) ->

		replacedString = this;

		for k,v of dataTags
			replacedString = replacedString.replace("%%" + k + "%%", v)

		return replacedString

	String.prototype.replaceDataTag = (dataTag, replacement) ->

		return this.replace("%%" + dataTag + "%%", replacement)

	newShoutTemplate = $("#new_shout_template").html();

	# New Shout
	$("#new_shout").on("ajax:success", (e, data, status, xhr) ->
	  $(this).find("#shout_message").val("")
	  $(".shout-feed").prepend(newShoutTemplate.replaceDataTags({"username": data['user']['username'], "message": data['message'], "created_at": data['created_at']}))
	  $(".shout-feed").effect("highlight")
	).on("ajax:error", (e, data, status, xhr) ->
	  $("#new_shout").render_form_errors('shout', data.responseJSON)
	)

	$.fn.render_form_errors = (model_name, errors) ->
	  form = this
	  this.clear_form_errors()

	  $.each(errors, (field, messages) ->
	    input = form.find('input, select, textarea').filter(->
	      name = $(this).attr('name')
	      if name
	        name.match(new RegExp(model_name + '\\[' + field + '\\(?'))
	    )

	    input.closest('.form-group').addClass('has-error')
	   	input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
	  )

	$.fn.clear_form_errors = () ->
	  this.find('.form-group').removeClass('has-error')
	  this.find('span.help-block').remove()
)
