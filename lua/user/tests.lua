local user = require('user.lib.helpers')

user.bind_key('n', ',tf', ':w<CR>:TestFile<CR>')
user.bind_key('n', ',ta', ':wa<CR>:TestSuite<CR>')
user.bind_key('n', ',tl', ':w<CR>:TestLast<CR>')
