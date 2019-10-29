# frozen_string_literal: true

Facter.add(:stage) do
  setcode do
    "prod"
  end
end
