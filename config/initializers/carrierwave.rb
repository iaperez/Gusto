CarrierWave.configure do |config|
  #if Rails.env.test? || Rails.env.development?
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp/uploads/#{DateTime.now.to_f}.#{rand(999)}.#{rand(999)}"
  else
    config.fog_credentials = {
        provider: 'AWS',
        # just to make snap-ci works :(
        aws_access_key_id: 'AKIAIMRG2I3WSV3U7ESQ',
        aws_secret_access_key: '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'
    }
    config.fog_directory = 'testgusto'
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads/#{DateTime.now.to_f}.#{rand(999)}.#{rand(999)}"
  config.fog_public     = false
  config.fog_attributes = {}
end