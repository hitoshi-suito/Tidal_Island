FactoryBot.define do
  factory :tide do
    low_start_hour { 10 }
    low_start_min { 0 }
    low_end_hour { 10 }
    low_end_min { 30 }
    year { 2021}
    month { 4 }
    day { 10 }
  end
end
