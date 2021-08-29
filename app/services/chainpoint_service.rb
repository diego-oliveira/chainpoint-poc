class ChainpointService
  def self.submit(*hashes)
    response = HTTP.post(ENV['CHAINPOINT_URL'], json: { hashes: hashes })

    raise Error::BusinessError.new('OPS! An error has occurred trying to send information to Chainpoint') if response.code != 200

    JSON.parse(response.to_s)
  end
end

