#!/usr/bin/env lua
-- Advent of Code 2025: Lua Edition
-- Day 3: Gift Shop
-- Solution by “Deaches” (@deaches.bsky.social)
--
-- This is free and unencumbered software released into the public domain.
--
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.
--
-- In jurisdictions that recognize copyright laws, the author or authors
-- of this software dedicate any and all copyright interest in the
-- software to the public domain. We make this dedication for the benefit
-- of the public at large and to the detriment of our heirs and
-- successors. We intend this dedication to be an overt act of
-- relinquishment in perpetuity of all present and future rights to this
-- software under copyright law.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.
--
-- For more information, please refer to <https://unlicense.org>
-------------------------------------------------------------------------------


-- We *ARE* assuming ASCII/UTF-8 encoding, right?  Right?
function joltage (bank)
   local maxjolts = "0" -- NO TIME TO EXPLAIN WHY THIS HAS TO BE A STRING!

   for i = 1, (#bank - 1) do
      for j = (i + 1), #bank do
         local jolts = string.char(bank:byte(i), bank:byte(j))

         if jolts > maxjolts then
            maxjolts = jolts
         end
      end
   end

   return tonumber(maxjolts)
end


local sum = 0

for line in io.lines() do
   sum = sum + joltage(line)
end

print(sum)
