describe "A dummy" do
  2.times do
    3.times do
      it "is all fine" do
        true.should be_true
      end
    end

    it "is not so fine" do
      false.should be_true
    end

    5.times do
      it "is all fine" do
        true.should be_true
      end
    end
  end
end
