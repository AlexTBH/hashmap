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
            value = @buckets[x].data[key]
            @buckets[x] = nil
            value
        else
            nil
        end
    end

    def length
        amountKeys = 0

        for i in @buckets
            if i != nil
                amountKeys += 1
            end
        end
        amountKeys
    end

    def clear
        @buckets.each_with_index do |val, idx|
            if val != nil
                @buckets[idx] = nil
            end
        end
    end

    def keys
        arr = []

        @buckets.each_with_index do |val, idx|
            if val != nil
                arr << @buckets[idx].data.keys
            end
        end
        arr
    end

    def values
        arr = []

        @buckets.each_with_index do |val, idx|
            if val != nil
                arr << @buckets[idx].data.values
            end
        end
        arr 
    end

    def entries
        arr = []

        @buckets.each_with_index do |val, idx|
            if val != nil
                arr << @buckets[idx].data
            end
        end
        arr
    end

end

x = HashMap.new
x.set("alex", "bajskorv")
x.get("alex")
x.set("alex", "hejdå")
#x.checking_bucket
x.remove("alex")
x.get("alex")
x.set("alex", "bajskorv")
x.length
x.clear
x.checking_bucket
x.set("alex", "bajskorv")
x.set("aalex", "bajskorv")
x.set("aleex", "bajskorv")
p x.keys
p x.values
p x.entries