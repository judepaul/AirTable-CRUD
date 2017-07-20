Airrecord.api_key = "key73lMf5wN14uuRM"

class PhoneDetail < Airrecord::Table
  self.base_key = "appMJszyeSTtY7dwL"
  self.table_name = "ph_details"
  
  def self.last
     all.last
   end
   
   def self.update params
     unless params[:rec_id].blank?
       phone_detail = PhoneDetail.find(params[:rec_id])
       phone_detail[:name] = params[:name]
       phone_detail[:processor] = params[:processor]
       phone_detail[:storage] = params[:storage].to_i
       phone_detail[:battery] = params[:battery].to_i
       phone_detail[:display] = params[:display].to_f
       phone_detail.save
     end
   end
   
end
