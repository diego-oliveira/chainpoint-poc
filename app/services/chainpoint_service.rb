class ChainpointService
  def self.submit(*hashes)
    response = HTTP.post(ENV['CHAINPOINT_URL'], json: { hashes: hashes })

    if response.code != 200
      Rails.logger.error "Error while POST information to chainpoint #{ENV['CHAINPOINT_URL']}. Response: #{response}"
      raise Error::BusinessError.new('OPS! An error has occurred trying to send information to Chainpoint') if response.code != 200
    end

    JSON.parse(response.to_s)
  end
end

