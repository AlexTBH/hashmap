
class HashMap
    
    def initialize
        @buckets = Array.new(16)
    end

    def hash(key)
        hash_code = 0
        prime_number = 31
           
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        
        ##Create function later that changes the value for modulo if the buckets grows##
        hash_code % 16
    end
     
    def set(key, value)
        keyBucket = hash(key)

        raise IndexError if keyBucket.negative? || keyBucket >= @buckets.length
        @buckets[keyBucket] = {key => value}
        
    end
end

x = HashMap.new
p x.set("alex", "bajskorv")