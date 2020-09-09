require 'client-api'


describe "api_get" do

  before { @api = ClientApi::Api.new}
  it "GET request" do

    @api.get('/api/users')
    expect(@api.status).to eq(200)
    expect(@api.code).to eq(200)
    expect(@api.message).to eq('OK')
  end
  it "POST request" do
    @api.post('/api/users', {"name": "kiberleab"})
    expect(@api.status).to eq(201)
  end
  it "DELETE request" do
    @api.delete('/api/users/3')
    expect(@api.status).to eq(204)
  end
  it "PUT request" do
    @api.put('/api/users/2', {"data": {"email": "kiberleab@mail.com", "first_name": "kiberleab", "last_name": "eniyew"}})
    expect(@api.status).to eq(200)
  end
  it "PATCH request" do
    @api.patch('/api/users/2', {"data": {"email": "kiberleab@mail.com", "first_name": "kiberleab", "last_name": "eniyew"}})
    expect(@api.status).to eq(200)
  end
end