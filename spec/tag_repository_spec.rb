require 'tag_repository'

def reset_tags_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_tags_test' })
  connection.exec(seed_sql)
end

describe TagRepository do
  before(:each) do 
    reset_tags_table
  end

  it 'returns a array of tags when given a post id' do
    repo = TagRepository.new
    tags = repo.find_by_post(2)
    expect(tags[0].id).to eq '1'
    expect(tags[0].name).to eq 'coding'
    expect(tags[1].id).to eq '4'
    expect(tags[1].name).to eq 'ruby'
  end

end