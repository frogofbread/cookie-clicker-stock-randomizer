price = io.read()
price = tonumber(price)
modename = io.read()
ttmc = io.read()
ttmc = tonumber(ttmc)
delta = io.read()
delta = tonumber(delta)
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
function modechanger()
  chance = math.random() * 100
  if ttmc == 0 then
    if modeid == 3 or modeid == 4 then
      chaoticmodechanger()
    end
    if chance > 0 and chance <= 12.5 then
      modeid = 0
      modename = "stable"
      delta = delta - 5
    elseif chance > 12.5 and chance <= 37.5  then
      modeid = 1
      modename = "slow rise"
      delta = delta - 1
    elseif chance > 37.5 and chance <= 62.5 then
      modeid = 2
      modename = "slow fall"
      delta = delta - 1
    elseif chance > 62.5 and chance <= 75 then
      modeid = 3
      modename = "fast rise"
      delta1 = delta - 0.015
      delta2 = delta + 0.135
      delta = delta1 + math.random() * (delta2 - delta1)
    elseif chance > 75 and chance <= 87.5 then
      modeid = 4
      modename = "fast fall"
      delta1 = delta - 0.135
      delta2 = delta + 0.015
      delta = delta1 + math.random() * (delta2 - delta1)
    elseif chance > 87.5 then
      modeid = 5
      modename = "chaotic"
      delta1 = delta - 0.15
      delta2 = delta + 0.15
      delta = delta1 + math.random() * (delta2 - delta1)
    end
  ttmc = math.random(1, 10)
  end
end
function chaoticmodechanger()
  if modeid == 3 or modeid == 4 then
    chance = math.random() * 100
    if chance <= 70 then
      modeid = 5
      modename = "chaotic"
      ttmc = math.random(1,10)
    else
      modechanger()
    end
  else
    modechanger()
  end
end
function changevalue()
  if modeid == 0 then
    modename = "stable"
    price1 = price - 0.025
    price2 = price + 0.025
    price = price1 + math.random() * (price2 - price1)
  elseif modeid == 1 then
    modename = "slow rise"
    price1 = price - 0.005
    price2 = price + 0.045
    price = price1 + math.random() * (price2 - price1)
  elseif modeid == 2 then
    modename = "slow fall"
    price1 = price - 0.045
    price2 = price + 0.005
    price = price1 + math.random() * (price2 - price1)
  elseif modeid == 3 then
    modename = "fast rise"
    price1 = price
    price2 = price + 5
    price = price1 + math.random() * (price2 - price1)
    chance = math.random() * 100
    if chance >= 30 then
      price1 = price - 3
      price2 = price + 7
      price = price1 + math.random() * (price2 - price1)
      delta1 = delta -0.05
      delta2 = delta + 0.05
      delta = delta1 + math.random() * (delta2 - delta1)
    end
  elseif modeid == 4 then
    modename = "fast fall"
    price1 = price - 5
    price2 = price
    price = price1 + math.random() * (price2 - price1)
    chance = math.random() * 100
    if chance >= 30 then
      price1 = price - 7
      price2 = price + 3
      price = price1 + math.random() * (price2 - price1)
    end
  elseif modeid == 5 then
    modename = "chaotic"
    if chance >= 50 then
      price1 = price - 5
      price2 = price + 5
      price = price1 + math.random() * (price2 - price1)
    end
    if chance >= 20 then
      delta1 = delta - 1
      delta2 = delta + 1
      delta = delta1 + math.random() * (delta2 - delta1)
    end
  end
  chance = math.random() * 100
  if chance <= 3 and modeid == 3 then
    modeid = 4
    modename = "fast fall" 
  end
  ttmc = ttmc - 1
  price = price + (price * (delta/100))
end
modeidcreator()
changevalue()
modechanger()
price = math.max(0.01, price)
-- make sure price can't go below 0
--final calcs here
delta1 = delta - 0.05
delta2 = delta + 0.05
delta = delta1 + math.random() * (delta2 - delta1)
chance = math.random() * 100
if chance <= 15 then
  price1 = price - 1.5
  price2 = price + 1.5
  price = price1 + math.random() * (price2 - price1)
end
chance = math.random() * 100
if chance <= 3 then
  price1 = price - 5
  price2 = price - 5
  price = price1 + math.random() * (price2 - price1)
end
chance = math.random() * 100
if chance <= 10 then
  delta1 = delta - 0.15
  delta2 = delta + 0.15
  delta = delta1 + math.random() * (delta2 - delta1)
end
print("price: " .. price.. "\nmode: " .. modename .."\ntime to mode change: "..ttmc.."\ndelta: " .. delta)
--print the variables
