@students = []

def student_input
puts "Please enter the name of students"
puts "To finish, just press enter twice"
name = STDIN.gets.gsub("\n", '')
#students = []
cohort_by_months = []
months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
while !name.empty? do
puts "Please enter the student's cohort"
cohort = STDIN.gets.gsub("\n", '')
cohort = Time.now.strftime("%B") if cohort.empty?
until months.include?(cohort.capitalize)
  puts "Spelling error, please type cohort again!"
  cohort = STDIN.gets.gsub("\n", '')
end
puts "Please enter the students hobbies"
hobbies = STDIN.gets.gsub("\n", '')
hobbies = "undisclosed" if hobbies.empty?
puts "Please enter the students place of birth"
pob = STDIN.gets.gsub("\n", '')
pob = "undisclosed" if pob.empty?
puts "Please enter the students height"
height = STDIN.gets.gsub("\n", '')
height = "undisclosed" if height.empty?
  students_capture(name, cohort, hobbies, pob, height)
  #@students << {name: name, cohort: cohort, hobbies: hobbies, pob: pob, height: height}
  puts @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
  name = STDIN.gets.gsub("\n", '')
end
x = 0
while x < months.count
@students.map{|hash| cohort_by_months << hash if hash[:cohort] == months[x]}
x += 1
end
@students = cohort_by_months
end

def print_header
 puts "The students of Villains Academy".center(500)
 puts "-----------".center(500)
end

 def print_students_list

#exercise 1, 2, & 3 completed in the below code block:
#names.each.with_index(1){|student, index| puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].split('').shift == "H" && student[:name].length < 12}

#exercise 4 below:
int = 0
until int == @students.count
puts "#{@students[int][:name]} (#{@students[int][:cohort]} cohort), Hobbies: #{@students[int][:hobbies]}, Born: #{@students[int][:pob]}, Height: #{@students[int][:height]}".center(500)
int += 1
end
end

 def print_footer
   puts @students.count > 1 ? "Overall, we have #{@students.count} great students".center(500) : "Overall, we have #{@students.count} great student".center(500)
 #puts  "Overall, we have #{names.count} great students".center(500)
end

def print_menu
    puts "1. Input the students"
    puts "2. Shows the students"
    puts "3. Save students list"
    puts "4. Load students list"
    puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    student_input
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again!"
end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobbies], student[:pob], student[:height]]
      csv_line = student_data.join(',')
      file.puts csv_line
    end
    file.close
  end

def students_capture(name, cohort, hobbies, pob, height)
  @students << {name: name, cohort: cohort, hobbies: hobbies, pob:pob, height:height}
end


  def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort, hobbies, pob, height = line.chomp.split(',')
      students_capture(name, cohort, hobbies, pob, height)
      #@students << {name: name, cohort: cohort, hobbies: hobbies, pob:pob, height:height}
    end
    file.close
  end

  def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exits."
      exits
    end
  end

puts try_load_students
puts interactive_menu
