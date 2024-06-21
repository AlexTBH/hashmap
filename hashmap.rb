class HashNode
    attr_accessor :data
    def initialize(key_value_pair)
        @data = key_value_pair
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

    def checking_bucket
        p @buckets
    end
     
    def set(key, value)
        keyBucket = hash(key)

        ##Need to work on collision##
        raise IndexError if keyBucket.negative? || keyBucket >= @buckets.length
        x = HashNode.new({key => value})

        @buckets[keyBucket] = x
    end

    def get(key)
        x = hash(key)

        if @buckets[x]
            @buckets[x].data[key]
        else
            nil
        end
    end

    def has?(key)
        x = hash(key)

        if @buckets[x]
            true
          else
            false
        end   
    end

    def remove(key)
        x = hash(key)

        if @buckets[x]
            p @buckets[x].data[key]
            
            @buckets[x] = nil
        else
            nil
        end


    end
end

x = HashMap.new
x.set("alex", "bajskorv")
p x.get("alex")
x.set("alex", "hejdå")
#x.checking_bucket
x.remove("alex")
p x.get("alex")
#x.checking_bucket
