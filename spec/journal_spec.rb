RSpec.describe Journal do
  it "has a version number" do
    expect(Journal::VERSION).not_to be nil
  end

  it "does something useful" do
    instance = Journal::Instruct.new
    expect(instance.is_a? Journal::Instruct).to be(true)
  end

  it  "accepts arguments" do
    cmd = Journal::Input.new(["today", "journal entry"])
  end
end
