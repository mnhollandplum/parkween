FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    role { 1 }
    email { "abc@example.com" }
    token { "abc123 " }
    google_client_id { "1234" }
  end
end
