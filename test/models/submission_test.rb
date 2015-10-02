require "test_helper"

describe Submission do
  let(:submission) { Submission.create(
                                       user_id:  1,
                                       reps:     5,
                                       weight:   5 
                                      )}
  let(:invalid) { Submission.new }
  let(:default) { submissions :default }
  let(:kg) { users :default }
  let(:pounds) { users :american }

  it "must be valid" do
    value(submission).must_be :valid?
  end

  it "must calculate tonnage" do
    default.calculate_tonnage.must_equal 50
  end

  describe "must be able to convert weights" do
    it "must convert to kg" do
      weight = 10 * 2.20462262
      default.converted_weight(kg).must_equal weight.round(2)
    end

    it "must convert to pounds" do
      default.converted_weight(pounds).must_equal 10
    end

    it "must round to 2 decimals when uneven" do
      # 5 characters including the dot
      default.converted_weight(kg).to_s.length.must_equal 5
    end

    it "must drop decimals (round) when even number" do
      default.converted_weight(pounds).to_s.length.must_equal 2
    end

  end
end
