#!/usr/bin/env lua
-- Advent of Code 2025: Lua Edition
-- Day 2: Gift Shop
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


function digits (num, base)
   local digits = {}
   local base   = base or 10

   while num > 0 do
      local digit, rem = (num % base), (num // base)
      num = rem
      table.insert(digits, digit)
   end

   return digits
end


function isinvalid (num)
   local ds  = digits(num)
   local len = #ds

   -- Invalid IDs will have an even number of digits since they repeat twice.
   if (#ds % 2) > 0 then
      return false
   end

   local halfway = len // 2

   for i = 1, halfway do
      if ds[i] ~= ds[halfway + i] then
         return false
      end
   end

   return true
end


-----


local sum = 0
local input = io.read("a")
-- local input = [[11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
-- 1698522-1698528,446443-446449,38593856-38593862,565653-565659,
-- 824824821-824824827,2121212118-2121212124]]

for start, stop in input:gmatch("([1-9]*%d+)-([1-9]*%d+)") do
   for i = tonumber(start), tonumber(stop) do
      if isinvalid(i) then
         sum = sum + i
      end
   end
end

print(sum)
