class ComplexNumber
  attr_reader :real, :imaginary

  @@sum_count=0
  @@multiply_count=0
  @@sum_bulk_count=0
  @@multiply_bulk_count=0

  def initialize(real, imaginary)
    @real = real
    @imaginary = imaginary
  end

  def add(other)
    @@sum_count += 1 
    new_real = real + other.real 
    new_imaginary = imaginary + other.imaginary
    ComplexNumber.new(new_real, new_imaginary)
  end


  def multiply(other)
    @@multiply_count += 1
    new_real = real * other.real - imaginary * other.imaginary
    new_imaginary = imaginary * other.real + real * other.imaginary
    ComplexNumber.new(new_real, new_imaginary)
  end

  def self.bulk_add(other)
        @@sum_bulk_count += 1
        new_real = 0
        new_imaginary = 0 

        other.each do |i|
            
        new_real += i.real
        new_imaginary += i.imaginary
        end
        
        ComplexNumber.new(new_real,new_imaginary)
    end

  def self.bulk_multiply(other)
        @@multiply_bulk_count=1
        ms=other[0]
        for i in 1...other.length
           ms = ms.multiply(other[i]) 
        end
        ms
  end 

  def self.get_status
    puts "@@sum_count: #{@@sum_count} "
    puts "@@multiply_count: #{@@multiply_count} "
    puts "@@sum_bulk_count: #{@@sum_bulk_count} "
    puts "@@multiply_bulk_count: #{@@multiply_bulk_count} "
  end

  def display 
    puts "#{@real} + #{@imaginary}i"
  end 

end

cn1=ComplexNumber.new(2,2)
cn2=ComplexNumber.new(3,3)
cn3=ComplexNumber.new(1,1)



cn1.add(cn2).display
cn2.add(cn3).display
cn2.add(cn2).display

cn1.multiply(cn2).display

arr = [cn1,cn2,cn3]

ComplexNumber.bulk_add(arr).display
ComplexNumber.bulk_multiply(arr).display

ComplexNumber.get_status
