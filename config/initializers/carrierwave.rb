
# require 'carrierwave/orm/activerecord'

require 'carrierwave/storage/fog'
  CarrierWave.configure do |config|
    config.fog_provider             = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-southeast-1'
    }
    config.fog_use_ssl_for_aws = false
    config.storage             = :fog
    config.fog_directory       = ENV['S3_BUCKET']
  end
