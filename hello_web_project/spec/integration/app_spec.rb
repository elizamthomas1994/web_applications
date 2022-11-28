require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello!")
    end
  end

  context "GET to /hello" do
    it "should return 'Hello Eliza'" do
      # Send a GET request to /hello
      # with a query parameter
      # and returns a response object we can test.
      response = get("/hello", name: "Eliza")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Eliza")
    end

    it "should return 'Hello Rosa'" do
      # Send a GET request to /hello
      # with a query parameter
      # and returns a response object we can test.
      response = get("/hello", name: "Rosa")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Rosa")
    end
  end

  context "POST to /submit" do
    it "should return 'Thanks Dana, you sent this message: 'Hola amigos'" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Dana", message: "Hola amigos")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Dana, you sent this message: 'Hola amigos'")
    end

    it "should return 'Thanks Marcell, you sent this message: 'Hey everybody'" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Marcell", message: "Hey everybody")
      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Marcell, you sent this message: 'Hey everybody'")
    end
  end

  context "GET to /names" do
    it "should return a set of names: Julia, Mary, Karim" do
      # Send a GET request to /names
      # with some query parameters
      # and returns a response object we can test.
      response = get("/names", name_one: "Julia", name_two: "Mary", name_three: "Karim")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end

    it "should return a set of names: Eliza, Rosa, James" do
      # Send a GET request to /names
      # with some query parameters
      # and returns a response object we can test.
      response = get("/names", name_one: "Eliza", name_two: "Rosa", name_three: "James")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Eliza, Rosa, James")
    end
  end

  context 'post/sort-names' do
    it 'should return an array of sorted names' do
      response = post('/sort-names', names:"Joe,Alice,Zoe")
      expect(response.status).to eq(200)
      expect(response.body).to eq 'Alice, Joe, Zoe'
    end
    it 'should return an array of different sorted names' do
      response = post('/sort-names', names:"Bob,Zara,Stevie")
      expect(response.status).to eq(200)
      expect(response.body).to eq 'Bob, Stevie, Zara'
    end
  end  
end
