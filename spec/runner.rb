#!/usr/bin/env ruby

path_to_src = File.dirname(__FILE__) + '/../src/'
path_to_fixtures = File.dirname(__FILE__) + '/fixtures'
failures = {}

expectations = {
  'single-quote.js' => 'a spec with single quotes',
  'double-quote.js' => 'a spec with double quotes',
  'leading-single-comments.js' => 'a spec with leading comments',
  'leading-block-comment.js' => 'a spec with a leading block comment'
}

Dir.glob(path_to_src + '*.*') do |src_path|
  expectations.each do |spec_name, expected|
    extracted = `"#{src_path}" "#{path_to_fixtures}/#{spec_name}"`.chomp
    unless extracted == expected
      failures[src_path] ||= {}
      failures[src_path][spec_name] = extracted
    end
  end
end

failures.each do |src_path, specs_to_failures|
  $stderr.puts(File.basename(src_path))
  specs_to_failures.each do |spec_name, actual|
    $stderr.puts("  for #{spec_name}:")
    $stderr.puts("    expected: '#{expectations[spec_name]}'")
    $stderr.puts("    actual: '#{actual}'")
  end
end

exit(1) unless failures.empty?
