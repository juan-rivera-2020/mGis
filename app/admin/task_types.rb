ActiveAdmin.register TaskType do
  menu priority: 9
  actions :all, except: [:show]

  permit_params do
    permitted = [:name]
    permitted
  end

  controller do
    def index
      super do |format|
        format.json { send_data collection.to_json, type: :json, disposition: "attachment" }
      end
    end
  end

  filter :name
  filter :created_at
  filter :updated_at
  remove_filter :tasks
  
end
