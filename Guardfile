all_dirs = Dir.glob('ruby/*')

directories all_dirs

clearing :on

options = {
  test_folders: all_dirs, 
  test_file_patterns: '*_test.rb',
  pride: true
}

guard :minitest, options do
  watch(%r{^ruby/([^/]+)/([^/]+).rb$}) do |m|
    file = Dir.glob("ruby/#{m[1]}/*_test.rb").first
    puts "  Should test #{file}"
    file
  end
end
