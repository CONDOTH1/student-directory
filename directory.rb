@students = []
@months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
require 'csv'

def student_input
  name = student_name
  cohort = student_cohort
  hobbies = student_details("hobbies")
  pob = student_details("pob")
  height = student_details("height")
  confirmation = input_check(name, cohort, hobbies, pob, height)
  return if confirmation == 'n'
  students_capture(name, cohort, hobbies, pob, height)
  puts @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
  cohort_by_months = sort_by_cohort
  @students = cohort_by_months
end

def input_check(name, cohort, hobbies, pob, height)
  puts "Thank you for your input, please check the information below:"
  puts "-----Name: #{name}, Cohort: #{cohort}, Hobbies: #{hobbies}, Place of Birth: #{pob}, Height: #{height}-----".center(500)
  puts "Are you happy with this data? (y/n)"
  puts "If yes your data will be added, otherwise you will be redirected to the main menu."
  confirmation = STDIN.gets.gsub("\n", '')
end

def student_name
  puts "Please enter the name of students"
  puts "To finish, just press enter twice"
  name = STDIN.gets.gsub("\n", '')
  while name.empty? do
    puts "Please enter a name"
    name = STDIN.gets.gsub("\n", '')
  end
  name
end

def student_cohort
  puts "Please enter the student's cohort"
  cohort = STDIN.gets.gsub("\n", '')
  cohort = Time.now.strftime("%B") if cohort.empty?
  until @months.include?(cohort.capitalize)
    puts "Spelling error, please type cohort again!"
    cohort = STDIN.gets.gsub("\n", '')
  end
  cohort
end

def student_details(string)
  puts "Please enter the students #{string}"
  string = STDIN.gets.gsub("\n", '')
  string = "undisclosed" if string.empty?
  string
end

def sort_by_cohort
  x = 0
  cohort_by_months = []
  while x < @months.count
    @students.map{|hash| cohort_by_months << hash if hash[:cohort] == @months[x]}
    x += 1
  end
  cohort_by_months
end

def students_capture(name, cohort, hobbies, pob, height)
  @students << {name: name, cohort: cohort, hobbies: hobbies, pob: pob, height: height}
end

def print_header
 puts "The students of Villains Academy".center(500)
 puts "-----------".center(500)
end

def print_students_list
  int = 0
    until int == @students.count
      puts "#{@students[int][:name]} (#{@students[int][:cohort]} cohort), Hobbies: #{@students[int][:hobbies]}, Born: #{@students[int][:pob]}, Height: #{@students[int][:height]}".center(500)
      int += 1
    end
end

 def print_footer
   puts @students.count > 1 ? "Overall, we have #{@students.count} great students".center(500) : "Overall, we have #{@students.count} great student".center(500)
end

def print_menu
    puts "1. Input the students"
    puts "2. Shows the students"
    puts "3. Save students list"
    puts "4. Load students list"
    puts "5. Appends students from file"
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
  when "5"
    append_students
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
  puts "Please provide filename below, otherwise 'students.csv' will be used."
  filename = STDIN.gets.gsub("\n", '')
  filename = "students.csv" if filename.empty?
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
          csv << [student[:name], student[:cohort], student[:hobbies], student[:pob], student[:height]]
        end
  end
    puts "Your data is saved, thank you!"
  end

  def load_students(filename = "students.csv")
  @students = []
  CSV.open(filename, :row_sep => :auto, :col_sep => ",") do |csv|
      csv.each { |a,b,c,d,e| @students <<  {name: a,cohort: b, hobbies: c, pob: d, height: e} }
    end
    puts "Files loaded, thank you!"
  end

  def append_students
  puts "Please provide filename below, otherwise 'students.csv' will be used."
  filename = STDIN.gets.gsub("\n", '')
  filename = "students.csv" if filename.empty?
  CSV.open(filename, :row_sep => :auto, :col_sep => ",") do |csv|
      csv.each { |a,b,c,d,e| @students <<  {name: a,cohort: b, hobbies: c, pob: d, height: e} }
    end
    puts "Files loaded, thank you!"
  end

  def try_load_students
    ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  end

puts try_load_students
puts interactive_menu
