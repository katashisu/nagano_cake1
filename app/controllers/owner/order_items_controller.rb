class Owner::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    # making_statusが製作中ならば、order_statusを作成中へ自動更新
    if order_item.making_status == "製作中"
       order_item.order.update(order_status:"作成中" )
    end
    # 注文した商品全てのmaking_statusが製作完了ならば、order_statusを発送準備中へ自動更新
    # all?{|ブロック変数| 条件}で全ての条件が一致すると自動更新する設定
    if order_item.order.order_items.all?{|order_item|order_item.making_status == "製作完了"}
       order_item.order.update(order_status:"発送準備中" )
    end
    redirect_to owner_order_path(order_item.order_id)
  end

private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
