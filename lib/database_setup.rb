if ENV['ENVIRONMENT'] == 'test'
  connection = PG.connect(dbname: 'bunker_test')
else
  connection = PG.connect(dbname: 'bunker')
end
