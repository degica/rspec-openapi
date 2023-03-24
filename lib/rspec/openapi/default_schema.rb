class << RSpec::OpenAPI::DefaultSchema = Object.new
  def build(title)
    spec = {
      openapi: '3.1.0',
      info: {
        title: title,
        version: RSpec::OpenAPI.application_version,
      },
      servers: RSpec::OpenAPI.servers,
      paths: {},
    }

    if RSpec::OpenAPI.security_schemes.present?
      spec[:components] = {
        securitySchemes: RSpec::OpenAPI.security_schemes,
      }
    end

    spec.freeze
  end
end
