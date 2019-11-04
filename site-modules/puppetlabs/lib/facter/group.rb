# frozen_string_literal: true

Facter.add(:group) do
  setcode do
    "pgtomcat"
  end
end
