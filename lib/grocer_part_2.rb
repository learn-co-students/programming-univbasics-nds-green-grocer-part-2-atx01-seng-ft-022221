require_relative './part_1_solution.rb'
require "pry"
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    item_info=find_item_by_name_in_collection(coupon[:item], cart)
    item_with_coupon=find_item_by_name_in_collection(coupon[:item]+" W/COUPON", cart)
    if item_with_coupon and item_info[:count] >= coupon[:num]
      item_info[:count] -= coupon[:num]
      item_with_coupon[:count] += coupon[:num]
    elsif item_info and item_info[:count] >= coupon[:num]
  cart << {
    :item => coupon[:item]+ " W/COUPON",
    :price => (coupon[:cost]/coupon[:num]),
    :clearance => item_info[:clearance],
    :count => coupon[:num]
  }
  item_info[:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |items|
    if items[:clearance]
      items[:price]*= 0.8
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  consolidated_cart=consolidate_cart(cart)
  cart_with_coupons=apply_coupons(consolidated_cart, coupons)
  final=apply_clearance(cart_with_coupons)
  
  total=0
  final.each do |items|
    total+=items[:price]*items[:count]
  end
  total.round(2)
if total >100
  total*=0.9
end
total.round(2)
end
