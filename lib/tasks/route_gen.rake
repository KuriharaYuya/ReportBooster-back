task route_gen: :environment do
  sh 'openapi-generator-cli generate -g ruby-on-rails -i swagger.yml -o output_dir \
  --skip-validate-spec -t ruby-on-rails-server'
  sleep 10
  sh 'mv -f output_dir/config/routes.rb config/routes.rb'
  sleep 2
  sh 'rm -rf output_dir'
  puts '完了しました'
end
