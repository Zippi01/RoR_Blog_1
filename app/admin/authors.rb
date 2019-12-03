ActiveAdmin.register Author do
  permit_params do
    permitted = %i[first_name last_name gender birthday email banned]
  end
end
