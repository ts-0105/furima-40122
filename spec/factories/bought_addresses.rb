FactoryBot.define do
  factory :bought_address do
    post_num     { '123-4567' }
    region_id    { 2 }
    city         { 'あああ市' }
    street       { 'いいい' }
    building     { 'ううう' }
    phone_num    { '09012345678' }
    token        { 'tok_4fe8ac9036fa0d99ff498010516a' }
  end
end
