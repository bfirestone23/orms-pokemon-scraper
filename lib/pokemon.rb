require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db 

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name 
        @type = type 
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"

        result = db.execute(sql, id).flatten 
        Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
    end

end
