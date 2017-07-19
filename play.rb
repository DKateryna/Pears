students = [1,2,3,4,5,6,7,8,9,10]
    result = Array.new



while !students.empty?
        ar = Array.new
       ar.push(students.shift, students.shift)
       result.push(ar)
    end

  p result
