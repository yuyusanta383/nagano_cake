class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!
  #顧客のマイページ
  def show
    @customer = current_customer
  end
  #顧客の情報編集画面
  def edit
    @customer = current_customer
  end
  #顧客の更新情報更新
  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to public_customer_path
  end
  #退会の確認画面
  def update_confirm
  end
  #顧客の退会処理(ステータスの更新)
  def st_update
    current_customer.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    redirect_to public_root_path
  end
  
  
  private
  
  def customer_params
   params.require(:customer).permit(:first_name, :last_name, :first_name_kana,:last_name_kana, :postal_code,:phone_number,:address,:email,:is_deleted)
    
  end
end
