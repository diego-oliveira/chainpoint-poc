class ChainpointService
  def self.submit(cryptographic_hash)
    response = HTTP.post(ENV['CHAINPOINT_URL'], json: { hashes: [cryptographic_hash] })

    raise Error::BusinessError.new('OPS! An error has occurred trying to send information to Chainpoint') if response.code != 200

    JSON.parse(response.to_s)
  end
end

