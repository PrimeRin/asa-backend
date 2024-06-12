# frozen_string_literal: true

permissions = YAML.load_file("#{Rails.root}/db/docs/permissions.yml")

permissions.each do |role, permission_hash|
  role = Role.find_by_name(role)

  permission_hash.each do |resource, actions|
    permission = role.permissions.find_or_create_by(resource: resource)
    permission.update!(actions: actions)
  end
end
