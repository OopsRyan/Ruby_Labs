
file = File.open("emails.txt").read()

emails = file.split(/\n/)

spam_emails = []
puts("spam email files: ")

i = 1
emails.each do |email|
  if (email =~ /PDF Expert/ || email =~ /edX/ || email =~ /trial/ || email =~ /iphoneX/) then
    spam_emails << i
    puts("file#{i}")
  end
  i += 1
end

