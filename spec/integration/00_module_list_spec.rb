# frozen_string_literal: true

require "spec_helper"
require "puppet/face"
require "puppet/module_tool"

describe "puppet module list" do
  it "should not contain any invalid modules" do
    result = Puppet::Face[:module, :current].list(modulepath: "./modules")
    output = Puppet::Face[:module, :current].get_action(:list).when_rendering(:console).call(result, {})
    expect(output).not_to match(/invalid/)
  end
end
