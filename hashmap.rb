class HashNode
    attr_accessor :key, :value
    def initialize(key, value=nil)

        newHash = Hash.new
        @key = key
        @value = value
        newHash = {@key => @value}
    end
end



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

        ##Need to work on collision##
        raise IndexError if keyBucket.negative? || keyBucket >= @buckets.length
        x = HashNode.new(key, value)
        p x.key

        @buckets[keyBucket] = x
    end

    def get(key)
        x = hash(key)
        
        @buckets[x]
    end

end

x = HashMap.new
x.set("alex", "bajskorv")
#p x.get("alex")