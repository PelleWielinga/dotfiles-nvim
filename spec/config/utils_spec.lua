local utils = require("config.utils")

describe("Utils", function()
  it("shows primitive types as their type", function()
    assert.equals(utils.dump(1, ""), "1")
    assert.equals(utils.dump("a string", ""), "'a string'")
    assert.equals(utils.dump(nil, ""), "nil")
  end)

  it("shows a more complex table with indent", function()
    local expected = [[
{
  'item 1',
  'item 2',
  'nested' = {
    'value',
    'number' = 1,
  },
}]]
    local actual = {
      "item 1",
      "item 2",
      nested = {
        number = 1,
        "value"
      }
    }

    assert.equals(expected, utils.dump(actual, ""))
  end)
end)
