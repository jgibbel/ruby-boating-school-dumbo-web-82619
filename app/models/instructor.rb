class Instructor
    @@all = []
    attr_reader :name 

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def pass_student(student, test_name)
        find_test = BoatingTest.all.find {|test| test.student == student && test.name == test_name}
        if find_test 
            find_test.status = "passed"
        else BoatingTest.new(student, test_name, "passed", self)
        end 
        
    end 

    def fail_student(student, test_name)
        find_test = BoatingTest.all.find {|test| test.student == student && test.name == test_name}
        if find_test
            find_test.status = "failed"
        else BoatingTest.new(student, test_name, "failed", self)
        end 
    end 

end

