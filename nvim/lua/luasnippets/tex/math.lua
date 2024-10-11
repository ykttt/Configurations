

-- luasnippets/tex/math.lua


local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local linebegin = require('luasnip.extras.expand_conditions').line_begin
local getv = function(args, parent)     -- Get the string selected in visual mode
        if (#parent.snippet.env.LS_SELECT_RAW > 0) then
                return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
        else  -- If LS_SELECT_RAW is empty, return a blank insert node
                return sn(nil, i(1))
        end
end

return {
        s({trig = '([^%a])ff', wordTrig = false, regTrig = true},
                fmta(
                        [[ <>\frac{<>}{<>} ]],
                        {
                                f(function(_, snip) return snip.captures[1] end),
                                i(1),
                                i(2),
                        }
                )
        ),
        s({trig = '([^%a])mm', wordTrig = false, regTrig = true},
                fmta(
                        [[ <>$<>$ ]],
                        {
                                f(function(_, snip) return snip.captures[1] end),
                                d(1, getv),
                        }
                )
        ),
}, {
        s(';a', t('\\alpha')),
        s(';b', t('\\beta')),
        s(';c', t('\\gamma')),
}
