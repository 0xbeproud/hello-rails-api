GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end

GrapeSwaggerRails.options.url = '/api/v1/swagger_doc.json'
GrapeSwaggerRails.options.app_name = 'Swagger'
GrapeSwaggerRails.options.hide_url_input = true
GrapeSwaggerRails.options.doc_expansion = 'list'

GrapeSwaggerRails.options.headers['x-eav'] = '1.0.0'
GrapeSwaggerRails.options.headers['x-edos'] = 'ANDROID'
GrapeSwaggerRails.options.headers['x-euuid'] = 'd'

