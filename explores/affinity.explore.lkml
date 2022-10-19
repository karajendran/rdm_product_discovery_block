include: "/views/affinity/affinity.view.lkml"
include: "/views/tbl_products.view.lkml"

view: tbl_products_a {
  extends: [tbl_products]
  dimension: cost {
    type: number
    sql: ${product_a_price_info.tbl_products__price_info}.cost ;;
  }
}

view: tbl_products_b {
  extends: [tbl_products]
  dimension: cost {
    type: number
    sql: ${product_b_price_info.tbl_products__price_info}.cost ;;
  }
}

explore: affinity {
  label: "Affinity Analysis"

  always_filter: {
    filters: {
      field: affinity.product_b_id
      value: "-NULL"
    }
  }

  join: product_a {
    from: tbl_products_a
    type: left_outer
    view_label: "Product A Details"
    relationship: many_to_one
    sql_on: ${affinity.product_a_id} = ${product_a.id} ;;
  }

    join: product_a_price_info {
      from: tbl_products__price_info
      sql: LEFT JOIN UNNEST(${product_a.price_info}) as tbl_events__product_details ;;
      relationship: one_to_many
    }

  join: product_b {
    from: tbl_products_b
    type: left_outer
    view_label: "Product B Details"
    relationship: many_to_one
    sql_on: ${affinity.product_b_id} = ${product_b.id} ;;
  }

    join: product_b_price_info {
      from: tbl_products__price_info
      sql: LEFT JOIN UNNEST(${product_b.price_info}) as tbl_events__product_details ;;
      relationship: one_to_many
    }
}
