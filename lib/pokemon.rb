class Pokemon
    attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = ("INSERT INTO pokemon (name, type) VALUES (?, ?)")

    db.execute(sql, name, type)
    id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    pokemon_row = db.execute(sql, id).first
    Pokemon.new(id: pokemon_row[0], name: pokemon_row[1], type: pokemon_row[2], db: db)
  end

end
