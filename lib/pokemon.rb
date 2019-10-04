class Pokemon
    attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = ("INSERT INTO pokemon (name, type) VALUES (?, ?)"

    db.execute(sql, name, type)
    id = db.exectue("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end
