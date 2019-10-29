# frozen_string_literal: true

Facter.add(:fake_domain) do
  setcode do
    "pgtomcat.mycompany.org"
  end
end
