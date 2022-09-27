view: affinity {
  label: "Affinity"
  derived_table: {
    # datagroup_trigger: ecommerce_etl
    sql: SELECT
          product_a_id
          , product_b_id
          , joint_user_freq
          , joint_order_freq
          , top1.prod_freq AS product_a_freq
          , top2.prod_freq AS product_b_freq
        FROM
        (
        SELECT
          up1.prod_id AS product_a_id
          , up2.prod_id AS product_b_id
          , COUNT(*) AS joint_user_freq
        FROM ${user_order_product.SQL_TABLE_NAME} AS up1
          LEFT JOIN ${user_order_product.SQL_TABLE_NAME} AS up2
            ON up1.user_id = up2.user_id
            AND up1.prod_id <> up2.prod_id
          GROUP BY product_a_id, product_b_id
        ) AS juf
    LEFT JOIN
      (
      SELECT
        op1.prod_id AS oproduct_a_id
        , op2.prod_id AS oproduct_b_id
        , COUNT(*) AS joint_order_freq
      FROM ${user_order_product.SQL_TABLE_NAME} op1
        LEFT JOIN ${user_order_product.SQL_TABLE_NAME} op2
          ON op1.order_id = op2.order_id
          AND op1.prod_id <> op2.prod_id
        GROUP BY oproduct_a_id, oproduct_b_id
      ) AS jof
      ON jof.oproduct_a_id = juf.product_a_id
      AND jof.oproduct_b_id = juf.product_b_id
    LEFT JOIN ${total_order_product.SQL_TABLE_NAME} top1
      ON top1.prod_id = juf.product_a_id
    LEFT JOIN ${total_order_product.SQL_TABLE_NAME} top2
      ON top2.prod_id = juf.product_b_id
    ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [detail*]
  }

  dimension: product_a_id {
    label: "Product A ID"
    sql: ${TABLE}.product_a_id ;;
  }

  dimension: product_b_id {
    label: "Product B ID"
    sql: ${TABLE}.product_b_id ;;
  }

  dimension: joint_user_freq {
    label: "Joint User Frequency"
    description: "The number of users who have purchased both product a and product b"
    type: number
    sql: ${TABLE}.joint_user_freq ;;
  }

  dimension: joint_order_freq {
    label: "Joint Order Frequency"
    description: "The number of orders that include both product a and product b"
    type: number
    sql: ${TABLE}.joint_order_freq ;;
  }

  dimension: product_a_freq {
    label: "Product A Frequency"
    description: "The total number of times product a has been purchased"
    type: number
    sql: ${TABLE}.product_a_freq ;;
  }

  dimension: product_b_freq {
    label: "Product B Frequency"
    description: "The total number of times product b has been purchased"
    type: number
    sql: ${TABLE}.product_b_freq ;;
  }

  dimension: user_affinity {
    label: "User Affinity"
    hidden: yes
    type: number
    sql: 1.0*${joint_user_freq}/NULLIF((${product_a_freq}+${product_b_freq})-(${joint_user_freq}),0) ;;
    value_format_name: percent_2
  }

  dimension: order_affinity {
    label: "Order Affinity"
    hidden: yes
    type: number
    sql: 1.0*${joint_order_freq}/NULLIF((${product_a_freq}+${product_b_freq})-(${joint_order_freq}),0) ;;
    value_format_name: percent_2
  }

  measure: avg_user_affinity {
    label: "Affinity Score (by User History)"
    description: "Percentage of users that bought both products weighted by how many times each product sold individually"
    type: average
    sql: 100.0 * ${user_affinity} ;;
    value_format_name: decimal_2
  }

  measure: avg_order_affinity {
    label: "Affinity Score (by Order Basket)"
    description: "Percentage of orders that contained both products weighted by how many times each product sold individually"
    type: average
    sql: 100.0 * ${order_affinity} ;;
    value_format_name: decimal_2
  }

  measure: combined_affinity {
    label: "Combined Affinity"
    type: number
    sql: ${avg_user_affinity} + ${avg_order_affinity} ;;
  }

  set: detail {
    fields: [product_a_id,product_b_id,user_affinity,order_affinity]
  }
}



#############################################
#Table that aggregates the products purchased by user and order id

# If necessary, uncomment the line below to include explore_source.
# include: "base.model.lkml"

# If necessary, uncomment the line below to include explore_source.
# include: "base.model.lkml"

explore: user_order_product {}
view: user_order_product {
  derived_table: {
    explore_source: events {
      column: user_id {field: events.visitor_id}
      column: prod_id { field: product_details.product__id }
      column: order_id {field: events.purchase_transaction__id}
      filters: {
        field: events.is_purchase_complete
        value: "Yes"
      }
    }
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: user_id {
    label: "User ID"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: prod_id {
    label: "Prod ID"
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: order_id {
    label: "Order ID"
    type: number
    sql: ${TABLE}.order_id ;;
  }
}

#################################################
#Table to count the total times a product id has been purchased

# If necessary, uncomment the line below to include explore_source.
# include: "base.model.lkml"

view: total_order_product  {
  derived_table: {
    explore_source: events {
      column: prod_id { field: product_details.product__id }
      column: prod_freq {field: events.count}
      filters: {
        field: events.is_purchase_complete
        value: "Yes"
      }
    }
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: prod_id {
    label: "Prod ID"
    sql: ${TABLE}.prod_id ;;
  }

  dimension: prod_freq {
    label: "Prod Freq"
    type: number
    sql: ${TABLE}.prod_freq ;;
  }
}
