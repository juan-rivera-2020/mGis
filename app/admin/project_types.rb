ActiveAdmin.register ProjectType do
  menu priority: 5

  permit_params do
    permitted = [:name]
    permitted
  end

end
