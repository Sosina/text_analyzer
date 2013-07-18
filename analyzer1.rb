#text analyzer
=begin
	This application takes in a text file and analyzes the text to:
	 . calculate total no of charactes,lines, non space characters
	 . total no of words, sentences and paragraphs in the text
	 . average no of words in sentence and average no of sentences in paragraph
	 . calculates percentage of useful words to total no of words
	 . summarizes the text and finds ideal sentences
	 . Sosina Gebregziabher June 25/2013
=end

#reading the text file in line
lines=File.readlines(ARGV[0])
# No of lines 
line_count=lines.length
#creating array of words
text=lines.join()
#counting total characters and total readable characters
total_characters=text.split('').length
total_characters_nonspace=text.scan(/\S/).length
#calculating total no of words sentences and paragraph
total_words=text.split(/\w+/).length
total_sentences=text.split(/\.|\?|\!/).length
total_paragraphs=text.split(/\n\n/).length
#calculating average no words per sentence and no of sentences in a paragprah
average_words_in_sentence=total_words/total_sentences
average_sentences_in_paragraph=total_sentences/total_paragraphs

#Eliminating stop words and counting useful word and calculating the percentage
#of useful words to the total words
stopwords=%w{the a by in on for to from some my i it will be was your of with just but and are is has have am}
words=text.scan(/\w+/)
useful_words=words.select{|word| !stopwords.include?(word.downcase)}
good_percentage=((useful_words.length.to_f/total_words.to_f)*100).to_i

#summarizing text and finding interesting sentences
sentences=text.gsub(/\s+/,' ').strip.split(/\.|\?|\!/)
sentences_sorted=sentences.sort_by{|sentence| sentence.length}
one_third=sentences_sorted.length/3
interesting_sentences=sentences_sorted.slice(one_third,one_third+1)
ideal_sentences=interesting_sentences.select{|sentence|sentence =~/is|are/}
ideal_sentences=ideal_sentences.join(". ")
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nonspace} characters without space"
puts "#{total_words} words"
puts "#{total_sentences} sentences"
puts "#{total_paragraphs} paragraphs"
puts "On average there are #{average_words_in_sentence} words in a sentence"
puts "On average there are #{average_sentences_in_paragraph} sentences in a paragraph"
puts "#{good_percentage}% of the words are useful"
puts "Summary of the text"
puts ideal_sentences





 



