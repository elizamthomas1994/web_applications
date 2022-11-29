require "spec_helper"
require "rack/test"
require_relative '../../app'


describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /albums' do
    it 'should return the list of albums' do
      response = get('/albums')
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Albums</h1>')
      expect(response.body).to include('<a href="/albums/2">Surfer Rosa</a>')
      expect(response.body).to include('1988')
      expect(response.body).to include('<a href="/albums/3">Waterloo</a>')
      expect(response.body).to include('1974')
      expect(response.body).to include('<a href="/albums/4">Super Trouper</a>')
      expect(response.body).to include('1980')
      expect(response.body).to include('<a href="/albums/5">Bossanova</a>')
      expect(response.body).to include('1990')
      expect(response.body).to include('<a href="/albums/6">Lover</a>')
      expect(response.body).to include('2019')
      expect(response.body).to include('<a href="/albums/7">Folklore</a>')
      expect(response.body).to include('2020')
      expect(response.body).to include('<a href="/albums/8">I Put a Spell on You</a>')
      expect(response.body).to include('1965')
      expect(response.body).to include('<a href="/albums/9">Baltimore</a>')
      expect(response.body).to include('1978')
      expect(response.body).to include('<a href="/albums/10">Here Comes the Sun</a>')
      expect(response.body).to include('1971')
      expect(response.body).to include('<a href="/albums/11">Fodder on My Wings</a>')
      expect(response.body).to include('1982')
      expect(response.body).to include('<a href="/albums/12">Ring Ring</a>')
      expect(response.body).to include('1973')
    end  
  end  

  context "GET /artists" do
    it 'returns 200 OK' do
      response = get('/artists')
      expect(response.status).to eq(200)
    end

    it 'should return the list of artists' do
      response = get('/artists')
      expect(response.body).to include('<h1>Artists</h1>')
      expect(response.body).to include('<a href="/artists/1">Pixies</a>')
      expect(response.body).to include('Rock')
      expect(response.body).to include('<a href="/artists/2">ABBA</a>')
      expect(response.body).to include('Pop')
      expect(response.body).to include('<a href="/artists/3">Taylor Swift</a>')
      expect(response.body).to include('Pop')
      expect(response.body).to include('<a href="/artists/4">Nina Simone</a>')
      expect(response.body).to include('Pop')
      expect(response.body).to include('<a href="/artists/5">Kiasmos</a>')
      expect(response.body).to include('Experimental')
    end
  end  

  context "POST /albums" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/albums?id=13&title=Reputation&release_year=2017&artist_id=3')

      expect(response.status).to eq(200)
    end

    it 'outputs newly created album' do
      response = get('/albums')
     
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Albums</h1>')
      expect(response.body).to include('Surfer Rosa')
      expect(response.body).to include('Waterloo')
      expect(response.body).to include('Super Trouper')
      expect(response.body).to include('Bossanova')
      expect(response.body).to include('Lover')
      expect(response.body).to include('Folklore')
      expect(response.body).to include('I Put a Spell on You')
      expect(response.body).to include('Baltimore')
      expect(response.body).to include('Here Comes the Sun')
      expect(response.body).to include('Fodder on My Wings')
      expect(response.body).to include('Ring Ring')
      expect(response.body).to include('Reputation')
     
    end
  end

  context "POST /artists" do
    it 'returns 200 OK' do
      response = post('/artists?id=6&name=Wild Nothing&genre=indie')

      expect(response.status).to eq (200)
    end

    it 'outputs newly created artist' do
      response = get('/artists')
      expect(response.body).to include('<h1>Artists</h1>')
      expect(response.body).to include('<a href="/artists/1">Pixies</a>')
      expect(response.body).to include('Rock')
      expect(response.body).to include('<a href="/artists/2">ABBA</a>')
      expect(response.body).to include('Pop')
      expect(response.body).to include('<a href="/artists/3">Taylor Swift</a>')
      expect(response.body).to include('Pop')
      expect(response.body).to include('<a href="/artists/4">Nina Simone</a>')
      expect(response.body).to include('Pop')
      expect(response.body).to include('<a href="/artists/5">Kiasmos</a>')
      expect(response.body).to include('Experimental')
      expect(response.body).to include('<a href="/artists/6">Wild Nothing</a>')
      expect(response.body).to include('indie')
    end
  end

  context "GET /albums/:id" do
    it 'returns the HTML of album id' do
      response = get('/albums/2')
      expect(response.status).to eq (200)
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
      
    end
  end
end