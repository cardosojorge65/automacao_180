

describe "POST/ signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Pitty", email: "pitty@bom.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      payload = { name: "Joao da Silva", email: "joao@ig.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])
      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end

    it "deve retornar 409" do
      expect(@result.code).to eql 409
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  examples = [
    {
      title: "nome em branco",
      payload: { name: "", email: "ze@hotmail.com", password: "123456" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "sem o campo nome",
      payload: { email: "ze@hotmail.com", password: "123456" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "email em branco",
      payload: { name: "Jose da Silva", email: "", password: "123456" },
      code: 412,
      error: "required email",
    },
    {
      title: "sem o campo email",
      payload: { name: "Jose da Silva", password: "123456" },
      code: 412,
      error: "required email",
    },
    {
      title: "senha em branco",
      payload: { name: "Jose da Silva", email: "ze@hotmail.com", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "senha em branco",
      payload: { name: "Jose da Silva", email: "ze@hotmail.com" },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida id do usuario" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
