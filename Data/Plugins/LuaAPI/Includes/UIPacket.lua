--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- UIPacket.lua - Payload Reader/Writer for the Lua UI Channel
------------------------------------------------------------------
-- Payload format, identical to the client-side writer/reader:
--   byte 1 / word 2 / dword 4 / qword 8   little-endian unsigned
--   float 4 / double 8                    little-endian IEEE
--   text                                  WORD length + raw bytes
--   str                                   fixed width, zero padded
--
-- float carries only ~7 significant digits: 1500000123 comes back as
-- 1500000128. Use double for real numbers and dword/qword for whole ones.
--
-- qword is exact up to 2^53 on the client, because a Lua number there is a
-- double. That covers experience, money and tick counts. Item serials use the
-- full 64 bits, so send those as two dwords or as text.
--
--   local w = UIPacket.Writer()
--   w:byte(1):dword(count):text(name)
--   UIWindow.Send(oPlayer, id, action, result, w)
--
--   local r = UIPacket.Reader(data)
--   local bankType, count = r:byte(), r:dword()
--
-- A short read yields 0 / "" instead of raising, so a truncated or
-- forged packet cannot take a handler down.
------------------------------------------------------------------

assert(string.pack, "UIPacket requires Lua 5.3+ (string.pack)")

UIPacket = {}

------------------------------------------------------------------
-- Writer
------------------------------------------------------------------

local Writer = {}
Writer.__index = Writer

local function put(self, chunk)
	self.n = self.n + 1
	self.parts[self.n] = chunk
	return self
end

function Writer:byte(v)   return put(self, string.pack("<I1", v & 0xFF)) end
function Writer:word(v)   return put(self, string.pack("<I2", v & 0xFFFF)) end
function Writer:dword(v)  return put(self, string.pack("<I4", v & 0xFFFFFFFF)) end
function Writer:qword(v)  return put(self, string.pack("<I8", v)) end
function Writer:float(v)  return put(self, string.pack("<f", v)) end
function Writer:double(v) return put(self, string.pack("<d", v)) end

function Writer:text(v)
	v = tostring(v or "")

	if #v > 0xFFFF then
		v = v:sub(1, 0xFFFF)
	end

	return put(self, string.pack("<s2", v))
end

function Writer:str(v, len)
	v = tostring(v or "")

	if #v > len then
		v = v:sub(1, len)
	end

	return put(self, v .. string.rep("\0", len - #v))
end

function Writer:build()
	return table.concat(self.parts)
end

function UIPacket.Writer()
	return setmetatable({ parts = {}, n = 0 }, Writer)
end

------------------------------------------------------------------
-- Reader
------------------------------------------------------------------

local Reader = {}
Reader.__index = Reader

function Reader:remaining()
	return #self.data - self.pos + 1
end

local function take(self, fmt, size)
	if self:remaining() < size then
		return nil
	end

	local value, nextPos = string.unpack(fmt, self.data, self.pos)
	self.pos = nextPos
	return value
end

function Reader:byte()   return take(self, "<I1", 1) or 0 end
function Reader:word()   return take(self, "<I2", 2) or 0 end
function Reader:dword()  return take(self, "<I4", 4) or 0 end
function Reader:qword()  return take(self, "<I8", 8) or 0 end
function Reader:float()  return take(self, "<f", 4) or 0.0 end
function Reader:double() return take(self, "<d", 8) or 0.0 end

function Reader:text()
	if self:remaining() < 2 then
		return ""
	end

	local len = string.unpack("<I2", self.data, self.pos)

	if self:remaining() < 2 + len then
		return ""
	end

	local value, nextPos = string.unpack("<s2", self.data, self.pos)
	self.pos = nextPos
	return value
end

function Reader:str(len)
	local value = take(self, "c" .. len, len)

	if value == nil then
		return ""
	end

	local stop = value:find("\0", 1, true)
	return stop and value:sub(1, stop - 1) or value
end

function UIPacket.Reader(data)
	return setmetatable({ data = data or "", pos = 1 }, Reader)
end
