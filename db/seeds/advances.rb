# frozen_string_literal: true

advances = [
  { advance_type: 'salary_advance', status: 'dispatched', amount: '200.23', verified_by: 'Finance',
    confirmed_by: 'DAF Director', dispatch_by: 'Finance', creator: 'Employee' },
  { advance_type: 'other_advance', status: 'pending', amount: '250', verified_by: nil, confirmed_by: nil,
    dispatch_by: nil, creator: 'Employee' },
  { advance_type: 'in_country_tour_advance', status: 'pending', amount: '250', verified_by: nil, confirmed_by: nil,
    dispatch_by: nil, creator: 'Employee' },
  { advance_type: 'ex_country_tour_advance', status: 'pending', amount: '250', verified_by: nil, confirmed_by: nil,
    dispatch_by: nil, creator: 'Employee' }
]

def user_uuid(role_name)
  role = Role.find_by(name: role_name)
  return nil unless role

  User.find_by(role_id: role.id).id
end

advances.each do |advance_attributes|
  creator = User.find_by(role_id: Role.find_by(name: advance_attributes[:creator]).id)
  if creator
    advance = creator.advances.find_or_initialize_by(advance_type: advance_attributes[:advance_type])

    advance.update!(status: advance_attributes[:status], amount: advance_attributes[:status])

    advance.verified_by = user_uuid(advance_attributes[:verified_by]) if advance_attributes[:verified_by]

    advance.confirmed_by = user_uuid(advance_attributes[:confirmed_by]) if advance_attributes[:confirmed_by]

    advance.dispatch_by = user_uuid(advance_attributes[:dispatch_by]) if advance_attributes[:dispatch_by]
    advance.save!
  else
    puts 'Advance Creator not found., Seed both Role and Users first'
  end
end
puts 'Advances seeding completed........'
