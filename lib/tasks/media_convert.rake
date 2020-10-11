# frozen_string_literal: true

namespace :media_convert do
  desc "MediaConvert"
  task :create do

    params            = {
      access_key_id:     Rails.application.credentials.access_key_id,
      secret_access_key: Rails.application.credentials.secret_access_key,
      region:            'ap-northeast-1',
      endpoint:          'https://mpazqbhuc.mediaconvert.ap-northeast-1.amazonaws.com'
    }

    client = Aws::MediaConvert::Client.new(params)

    source = '/Users/shengzhan/Desktop/astro/5/video_example/config/presets/hls.json'
    settings = JSON.parse(File.read(source))

    client.create_job(
      role: "arn:aws:iam::789687039807:role/mediaconvert_test",
      settings: settings
    )

    puts 'done'
  end
end
