class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new {|hash, k| hash[k] = []}
  end

    def name 
        @name
    end

    def slogan
        @slogan
    end
    
    def teachers
        @teachers
    end
    
    def students
        @students
    end

    def hire(teach)
        @teachers << teach
    end

    def enroll(stud)
        if @students.length < @student_capacity
            @students << stud
            return true
        else 
            return false

        end
    end

    def enrolled?(stud)
        if @students.include?(stud)
            return true
        else
            return false
        end
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(str, grade)
        if !@students.include?(str)
            return false
        end
        @grades[str] << grade
        return true

    end

    def num_grades(stud)
        return @grades[stud].length
    end

    def average_grade(str)
        if !enrolled?(str) || @grades[str].length == 0
            return nil
        end
        
        sum = 0

        @grades[str].each do |ele|
            sum += ele
        end
        return sum / @grades[str].length
    end

end
