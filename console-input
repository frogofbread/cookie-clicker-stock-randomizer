io.write("Enter price: ")
price = tonumber(io.read())

io.write("Enter stock ID: ")
id = tonumber(io.read())

io.write("Enter mode name: ")
modename = io.read()

io.write("Enter time till mode change: ")
ttmc = tonumber(io.read())

io.write("Enter delta: ")
delta = tonumber(io.read())

-- actual code below do not touch

delta = delta*0.97

local function random_float(min, max)
  return min + math.random() * (max - min)
end

function modeidcreator()
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

function changevalue()
  rv = 10*(id+1)+1-1
  priceadd = (rv - price)*0.01
  priceadd = priceadd + (3*random_float(-1, 1)^11)
  delta = delta + random_float(-0.05, 0.05)

  chance = math.random(1,100)
  if chance <= 15 then
    priceadd = priceadd + random_float(-1.5, 1.5)
  end

  chance = math.random(1,100)
  if chance <= 3 then
    priceadd = priceadd + random_float(-5,5)
  end

  chance = math.random(1,100)
  if chance <= 10 then
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
    priceadd = priceadd + random_float(0,5)
    delta = delta + random_float(-0.015, 0.135)
    chance = math.random(1,100)
    if chance <= 30 then
      priceadd = priceadd + random_float(-7,3)
      delta = delta + random_float(-0.05, 0.05)
    end
  elseif modeid == 4 then
    priceadd = priceadd + random_float(-5,0)
    delta = delta + random_float(-0.135, 0.015)
    chance = math.random(1,100)
    if chance <= 30 then
      priceadd = priceadd + random_float(-3,7)
      delta = delta + random_float(-0.05, 0.05)
    end
  elseif modeid == 5 then
    delta = delta + random_float(-0.15, 0.15)
    chance = math.random(1,100)
    if chance <= 50 then
      priceadd = priceadd + random_float(-5,5)
    end
    chance = math.random(1,100)
    if chance <= 20 then
      delta = random_float(-1,1)
    end
  end
end

function modechanger()
  if ttmc == 0 then
    chance = math.random()*100
    if modeid == 0 or modeid == 1 or modeid == 2 or modeid == 5 then
      if chance <= 12.5 then
        modeid = 0
        modename = "stable"
      elseif chance <= 37.5 and chance >= 12.5 then
        modeid = 1
        modename = "slow rise"
      elseif chance <= 62.5 and chance >= 37.5 then
        modeid = 2
        modename = "slow fall"
      elseif chance <= 75 and chance >= 62.5 then
        modeid = 3
        modename = "fast rise"
      elseif chance <= 87.5 and chance >= 75 then
        modeid = 4
        modename = "fast fall"
      elseif chance <= 100 and chance >= 87.5 then
        modeid = 5
        modename = "chaotic"
      end
    elseif modeid == 3 or modeid == 4 then
      if chance <= 70 then
        modeid = 5
        modename = "chaotic"
      else
        chance = math.random()*100
        if chance <= 12.5 then
          modeid = 0
          modename = "stable"
        elseif chance <= 37.5 and chance >= 12.5 then
          modeid = 1
          modename = "slow rise"
        elseif chance <= 62.5 and chance >= 37.5 then
          modeid = 2
          modename = "slow fall"
        elseif chance <= 75 and chance >= 62.5 then
          modeid = 3
          modename = "fast rise"
        elseif chance <= 87.5 and chance >= 75 then
          modeid = 4
          modename = "fast fall"
        elseif chance <= 100 and chance >= 87.5 then
          modeid = 5
          modename = "chaotic"
        end
      end
    end
    ttmc = math.random(1,70)
  end
end

-- add delta to price
price = price + delta

modeidcreator()
changevalue()
modechanger()

-- final calcs
price = price + priceadd
price = math.max(1,price)
if price < 5 then
  price = price + (5-price)/2
  if delta < 0 then
    delta = delta*0.95
  end
end

chance = math.random(1,100)
if chance <= 3 and modeid == 3 then
  modeid = 4
  modename = "fast fall"
end

ttmc = ttmc - 1

print("price: " .. price .. "\nmode: " .. modename .. "\ntime to mode change: " .. ttmc .. "\ndelta: " .. delta)
