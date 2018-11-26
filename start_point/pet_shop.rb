def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  return shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount_sold)
  return shop[:admin][:pets_sold] += amount_sold
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  pets = []
    for pet in shop[:pets]
      if pet[:breed] == breed
      pets.push(breed)
      end
    end
  return pets
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
    return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
    shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, pet)
  return shop[:pets].push(pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  return customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  end
  return false
end

# def sell_pet_to_customer(shop, pet, customer)
#   return if pet.nil?
#   if customer[:cash] > pet[:price]
#      customer[:pets] << pet         # this will add the pet to the customer's inventory
#      shop[:pets].delete(pet)        # this will remove the pet from the shop's inventory
#      customer[:cash] -= pet[:price]           # this will update the customer's cash total
#      shop[:admin][:total_cash] += pet[:price] # this will update the shop's cash total
#      shop[:admin][:pets_sold] += 1  # this will update the total number of pet's sold
#   end
# end

def sell_pet_to_customer(shop, pet, customer)
  return if pet.nil?
    if customer_can_afford_pet(customer, pet)
         add_pet_to_customer(customer, pet)
         remove_pet_by_name(shop, pet[:name])
         remove_customer_cash(customer, pet[:price])
         add_or_remove_cash(shop, pet[:price])
         increase_pets_sold(shop, 1)
    end
end
