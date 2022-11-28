1. Design the Route Signature
You'll need to include:

Returns a series of names:
Method: GET
Path: /names
Query paramaeters:
  name1 (string)
  name2 (string)
  name3 (string)

2. Design the Response
The route might return different responses, depending on the result.

When query param 'name1' is 'Julia', 'name2' is 'Mary' and 'name3' is 'Karim':
```
Julia, Mary, Karim
```

When query param 'name1' is 'Rosa', 'name2' is 'James' and 'name3' is 'Marcell':
```
Rosa, James, Marcell
```

</html>

3. Write Examples
Replace these with your own design.

# Request:

GET /names?name1=Julia&name2=Mary&name3=Karim

# Expected response:

Julia, Mary, Karim
# Request:

GET /names?name1=Rosa&name2=James&name3=Marcell

# Expected response:

Rosa, James, Marcell

4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /name" do
    it 'returns 200 OK' do
      response = get('/names?name1=Julia&name2=Mary&name3=Karim')
      expected_response = Julia, Mary, Karim

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end
end

5. Implement the Route
Write the route and web server code to implement the route behaviour.