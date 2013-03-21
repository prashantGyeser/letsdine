CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAI44BXMIU2QNMBGNA',                        # required
    :aws_secret_access_key  => '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'                        # required
  }
  config.fog_directory  = 'letsdine'                     # required
end