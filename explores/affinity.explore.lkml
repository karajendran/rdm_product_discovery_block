include: "/views/affinity/affinity.view.lkml"
include: "/views/affinity/affinity_products.view.lkml"
include: "/views/tbl_products.view.lkml"

# If necessary, uncomment the line below to include explore_source.
# include: "events.explore.lkml"

explore: affinity {
  label: "Affinity Analysis"

  always_filter: {
    filters: {
      field: affinity.product_b_id
      value: "-NULL"
    }
  }

  join: product_a {
    from: affinity_products
    type: left_outer
    view_label: "Product A Details"
    relationship: many_to_one
    sql_on: ${affinity.product_a_id} = ${product_a.product__id} ;;
  }

    # join: product_a_price_info {
    #   from: tbl_products__price_info
    #   sql: LEFT JOIN UNNEST(${product_a.price_info}) as tbl_events__product_details ;;
    #   relationship: one_to_many
    # }

  join: product_b {
    from: affinity_products
    type: left_outer
    view_label: "Product B Details"
    relationship: many_to_one
    sql_on: ${affinity.product_b_id} = ${product_b.product__id} ;;
  }

    # join: product_b_price_info {
    #   from: tbl_products__price_info
    #   sql: LEFT JOIN UNNEST(${product_b.price_info}) as tbl_events__product_details ;;
    #   relationship: one_to_many
    # }
}
