value = 0.0
-- the current stock price
id = 0
-- the stock ID, determined by order shown in index
modename = "stable"
-- the current mode of stock, PLEASE DO ALL LOWERCASE OR ELSE IT WILL BREAK
ttmc = 0
-- the time until the mode will change
delta = 0.0
-- the background value that increases OR decreases price over time

-- actual code below do not touch

delta = delta*0.97

local function random_float(min, max)
  return min + math.random() * (max - min)
end

function modetoid() -- changes the mode name to mode ID
  if modename == "stable" then
    modeid = 0
  elseif modename == "slow rise" then
    modeid = 1
  elseif modename == "slow fall" then
    modeid = 2
  elseif modename == "fast rise" then
    modeid = 3
  elseif modename == "fast fall" then
    modeid = 4
  elseif modename == "chaotic" then
    modeid = 5
  end
end

function updatevalue()
  rv = 10*(id+1)+1-1
  valueadd = (rv - value)*0.01
  valueadd = valueadd + (3*random_float(-1, 1)^11)
  delta = delta + random_float(-0.05, 0.05)
  rng = math.random(1,100)
  if rng <= 15 then
    valueadd = valueadd + random_float(-1.5, 1.5)
  end
  rng = math.random(1,100)
  if rng <= 3 then
    valueadd = valueadd + random_float(-5,5)
  end
  rng = math.random(1,100)
  if rng <= 10 then
    delta = delta + random_float(-0.15, 0.15)
  end
  if modeid == 0 then
    delta = delta - (delta*0.05)
    delta = delta + random_float(-0.025, 0.025)
  elseif modeid == 1 then
    delta = delta - (delta*0.01)
    delta = delta + random_float(-0.005, 0.045)
  elseif modeid == 2 then
    delta = delta - (delta*0.01)
    delta = delta + random_float(-0.045, 0.005)
  elseif modeid == 3 then
    valueadd = valueadd + random_float(0,5)
    delta = delta + random_float(-0.015, 0.135)
    rng = math.random(1,100)
    if rng <= 30 then
      valueadd = valueadd + random_float(-7,3)
      delta = delta + random_float(-0.05, 0.05)
    end
  elseif modeid == 4 then
    valueadd = valueadd + random_float(-5,0)
    delta = delta + random_float(-0.135, 0.015)
    rng = math.random(1,100)
    if rng <= 30 then
      valueadd = valueadd + random_float(-3,7)
      delta = delta + random_float(-0.05, 0.05)
    end
  elseif modeid == 5 then
    delta = delta + random_float(-0.15, 0.15)
    rng = math.random(1,100)
    if rng <= 50 then
      valueadd = valueadd + random_float(-5,5)
    end
    rng = math.random(1,100)
    if rng <= 20 then
      delta = random_float(-1,1)
    end
  end
end

function modechanger()
  if ttmc == 0 then
    rng = math.random()*100
    if modeid == 0 or modeid == 1 or modeid == 2 or modeid == 5 then
      if rng <= 12.5 then
        modeid = 0
        modename = "stable"
      elseif rng <= 37.5 and rng >= 12.5 then
        modeid = 1
        modename = "slow rise"
      elseif rng <= 62.5 and rng >= 37.5 then
        modeid = 2
        modename = "slow fall"
      elseif rng <= 75 and rng >= 62.5 then
        modeid = 3
        modename = "fast rise"
      elseif rng <= 87.5 and rng >= 75 then
        modeid = 4
        modename = "fast fall"
      elseif rng <= 100 and rng >= 87.5 then
        modeid = 5
        modename = "chaotic"
      end
    elseif modeid == 3 or modeid == 4 then
      if rng <= 70 then
        modeid = 5
        modename = "chaotic"
      else
        rng = math.random()*100
        if rng <= 12.5 then
          modeid = 0
          modename = "stable"
        elseif rng <= 37.5 and rng >= 12.5 then
          modeid = 1
          modename = "slow rise"
        elseif rng <= 62.5 and rng >= 37.5 then
          modeid = 2
          modename = "slow fall"
        elseif rng <= 75 and rng >= 62.5 then
          modeid = 3
          modename = "fast rise"
        elseif rng <= 87.5 and rng >= 75 then
          modeid = 4
          modename = "fast fall"
        elseif rng <= 100 and rng >= 87.5 then
          modeid = 5
          modename = "chaotic"
        end
      end
    end
    ttmc = math.random(1,70)
  end
end

-- add delta to value
value = value + delta

modetoid()
updatevalue()
modechanger()

-- final calcs
value = value + valueadd
value = math.max(1,value)
if value < 5 then
  value = value + (5-value)/2
  if delta < 0 then
    delta = delta*0.95
  end
end
rng = math.random(1,100)
if rng <= 3 and modeid == 3 then
  modeid = 4
  modename = "fast fall"
end
ttmc = ttmc - 1
-- print everything

print("price: " .. value .. "\nmode: " .. modename .. "\ntime to mode change: " .. ttmc .. "\ndelta: " .. delta)
