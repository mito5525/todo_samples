create_table 'users' do |t|
  t.int :id, primary_key: true, extra: 'auto_increment'
  t.varchar :name, null: false
  t.datetime :created_at
  t.datetime :updated_at
end

create_table 'tasks' do |t|
  t.int :id, primary_key: true, extra: 'auto_increment'
  t.int :user_id, null: false
  t.int :category_id, null: false
  t.varchar :title, null: false
  t.datetime :created_at
  t.datetime :updated_at

  t.foreign_key 'user_id', reference: 'users', reference_column: 'id'
end
