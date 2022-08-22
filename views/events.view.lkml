# # Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: events {
#   hidden: yes

#   join: events__experiment {
#     view_label: "Events: Experiment"
#     sql: LEFT JOIN UNNEST(${events.experiment}) as events__experiment ;;
#     relationship: one_to_many
#   }

#   join: events__page_categories {
#     view_label: "Events: Page Categories"
#     sql: LEFT JOIN UNNEST(${events.page_categories}) as events__page_categories ;;
#     relationship: one_to_many
#   }

#   join: events__result__item_list__item_list_element {
#     view_label: "Events: Result Item List Item List Element"
#     sql: LEFT JOIN UNNEST(${events.result__item_list__item_list_element}) as events__result__item_list__item_list_element ;;
#     relationship: one_to_many
#   }

#   join: events__object__item_list__item_list_element {
#     view_label: "Events: Object Item List Item List Element"
#     sql: LEFT JOIN UNNEST(${events.object__item_list__item_list_element}) as events__object__item_list__item_list_element ;;
#     relationship: one_to_many
#   }

#   join: events__result__order__accepted_offer {
#     view_label: "Events: Result Order Accepted Offer"
#     sql: LEFT JOIN UNNEST(${events.result__order__accepted_offer}) as events__result__order__accepted_offer ;;
#     relationship: one_to_many
#   }
# }

# view: events {
#   sql_table_name: `retail-shared-demos.retail.events`
#     ;;

#   dimension: action_type {
#     type: string
#     sql: ${TABLE}.action_type ;;
#   }

#   dimension: agent__ip_address {
#     type: string
#     sql: ${TABLE}.agent.ip_address ;;
#     group_label: "Agent"
#     group_item_label: "IP Address"
#   }

#   dimension: agent__session_id {
#     type: string
#     sql: ${TABLE}.agent.session_id ;;
#     group_label: "Agent"
#     group_item_label: "Session ID"
#   }

#   dimension: agent__user_agent {
#     type: string
#     sql: ${TABLE}.agent.user_agent ;;
#     group_label: "Agent"
#     group_item_label: "User Agent"
#   }

#   dimension: agent__user_id {
#     type: string
#     sql: ${TABLE}.agent.user_id ;;
#     group_label: "Agent"
#     group_item_label: "User ID"
#   }

#   dimension: agent__user_pseudo_id {
#     type: string
#     sql: ${TABLE}.agent.user_pseudo_id ;;
#     group_label: "Agent"
#     group_item_label: "User Pseudo ID"
#   }

#   dimension: attribution_token {
#     type: string
#     sql: ${TABLE}.attribution_token ;;
#   }

#   dimension: experiment {
#     hidden: yes
#     sql: ${TABLE}.experiment ;;
#   }

#   dimension: filter {
#     type: string
#     sql: ${TABLE}.filter ;;
#   }

#   dimension: object__item_list__item_list_element {
#     hidden: yes
#     sql: ${TABLE}.object__item_list.item_list_element ;;
#     group_label: "Object Item List"
#     group_item_label: "Item List Element"
#   }

#   dimension: object__product__sku {
#     type: string
#     sql: ${TABLE}.object__product.sku ;;
#     group_label: "Object Product"
#     group_item_label: "SKU"
#   }

#   dimension: page_categories {
#     hidden: yes
#     sql: ${TABLE}.page_categories ;;
#   }

#   dimension: page_title {
#     type: string
#     sql: ${TABLE}.page_title ;;
#   }

#   dimension: query {
#     type: string
#     sql: ${TABLE}.query ;;
#   }

#   dimension: referrer_url {
#     type: string
#     sql: ${TABLE}.referrer_url ;;
#   }

#   dimension: result__item_list__item_list_element {
#     hidden: yes
#     sql: ${TABLE}.result__item_list.item_list_element ;;
#     group_label: "Result Item List"
#     group_item_label: "Item List Element"
#   }

#   dimension: result__order__accepted_offer {
#     hidden: yes
#     sql: ${TABLE}.result__order.accepted_offer ;;
#     group_label: "Result Order"
#     group_item_label: "Accepted Offer"
#   }

#   dimension: result__order__order_number {
#     type: string
#     sql: ${TABLE}.result__order.order_number ;;
#     group_label: "Result Order"
#     group_item_label: "Order Number"
#   }

#   dimension: result__order__revenue__currency {
#     type: string
#     sql: ${TABLE}.result__order.revenue.currency ;;
#     group_label: "Result Order Revenue"
#     group_item_label: "Currency"
#   }

#   dimension: result__order__revenue__value {
#     type: number
#     sql: ${TABLE}.result__order.revenue.value ;;
#     group_label: "Result Order Revenue"
#     group_item_label: "Value"
#   }

#   dimension: result__order__shipping_rate__currency {
#     type: string
#     sql: ${TABLE}.result__order.shipping_rate.currency ;;
#     group_label: "Result Order Shipping Rate"
#     group_item_label: "Currency"
#   }

#   dimension: result__order__shipping_rate__value {
#     type: number
#     sql: ${TABLE}.result__order.shipping_rate.value ;;
#     group_label: "Result Order Shipping Rate"
#     group_item_label: "Value"
#   }

#   dimension: result__order__tax__currency {
#     type: string
#     sql: ${TABLE}.result__order.tax.currency ;;
#     group_label: "Result Order Tax"
#     group_item_label: "Currency"
#   }

#   dimension: result__order__tax__value {
#     type: number
#     sql: ${TABLE}.result__order.tax.value ;;
#     group_label: "Result Order Tax"
#     group_item_label: "Value"
#   }

#   dimension_group: start {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.start_time ;;
#   }

#   dimension: url {
#     type: string
#     sql: ${TABLE}.url ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: []
#   }
# }

# view: events__experiment {
#   drill_fields: [experiment_id]

#   dimension: experiment_id {
#     primary_key: yes
#     type: string
#     sql: experiment_id ;;
#   }

#   dimension: events__experiment {
#     type: string
#     hidden: yes
#     sql: events__experiment ;;
#   }

#   dimension: experiment_value {
#     type: string
#     sql: experiment_value ;;
#   }
# }

# view: events__page_categories {
#   dimension: events__page_categories {
#     type: string
#     sql: events__page_categories ;;
#   }
# }

# view: events__result__item_list__item_list_element {
#   dimension: item__sku {
#     type: string
#     sql: ${TABLE}.item.sku ;;
#     group_label: "Item"
#     group_item_label: "SKU"
#   }

#   dimension: position {
#     type: number
#     sql: ${TABLE}.position ;;
#   }
# }

# view: events__object__item_list__item_list_element {
#   dimension: item__includes_object__amount_of_good {
#     type: number
#     sql: ${TABLE}.item.includes_object.amount_of_good ;;
#     group_label: "Item Includes Object"
#     group_item_label: "Amount of Good"
#   }

#   dimension: item__includes_object__type_of_good__sku {
#     type: string
#     sql: ${TABLE}.item.includes_object.type_of_good.sku ;;
#     group_label: "Item Includes Object Type of Good"
#     group_item_label: "SKU"
#   }

#   dimension: position {
#     type: number
#     sql: ${TABLE}.position ;;
#   }
# }

# view: events__result__order__accepted_offer {
#   dimension: includes_object__amount_of_good {
#     type: number
#     sql: ${TABLE}.includes_object.amount_of_good ;;
#     group_label: "Includes Object"
#     group_item_label: "Amount of Good"
#   }

#   dimension: includes_object__type_of_good__sku {
#     type: string
#     sql: ${TABLE}.includes_object.type_of_good.sku ;;
#     group_label: "Includes Object Type of Good"
#     group_item_label: "SKU"
#   }
# }
