line_count=0
text=''

File.open("text.txt").each do |line|
	text<<line
	line_count+=1
end
print "#{line_count} lines"
lines=File.readlines("text.txt")
line_count=lines.length
text=lines.join()
print "#{line_count} lines"

total_characters=text.split('').length
puts
print "#{total_characters} total characters"

total_characters=text.length
puts total_characters

total_printable_characters=text.scan(/\S/).length
puts "#{total_printable_characters} characters without spaces"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"

total_words=text.split.length
puts "#{total_words} words"

total_words=text.scan(/\w+/).length
puts total_words

puts text.split.length

total_sentences=text.split(/\.|\?|\!/).length
print "#{total_sentences} sentences"

total_sentences=text.scan(/\.|\?|\!/).length
print "#{total_sentences} sentences"
total_sentences


