class Student
    @@all = []
    attr_reader :first_name
    
    def initialize(first_name)
        @first_name = first_name
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end 

    def self.find_student(first_name)
        @@all.find {|student| student.first_name == first_name}
    end 

    def grade_percentage 
        my_tests = BoatingTest.all.select {|test| test.student == self}
        passed = my_tests.select {|test| test.status == "passed"}
        ( passed.size.to_f / my_tests.size.to_f )*100
    end 

end
