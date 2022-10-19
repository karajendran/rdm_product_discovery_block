# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: tbl_products {
  hidden: yes

  join: tbl_products__sizes {
    view_label: "Tbl Products: Sizes"
    sql: LEFT JOIN UNNEST(${tbl_products.sizes}) as tbl_products__sizes ;;
    relationship: one_to_many
  }

  join: tbl_products__images {
    view_label: "Tbl Products: Images"
    sql: LEFT JOIN UNNEST(${tbl_products.images}) as tbl_products__images ;;
    relationship: one_to_many
  }

  join: tbl_products__brands {
    view_label: "Tbl Products: Brands"
    sql: LEFT JOIN UNNEST(${tbl_products.brands}) as tbl_products__brands ;;
    relationship: one_to_many
  }

  join: tbl_products__colors {
    view_label: "Tbl Products: Colors"
    sql: LEFT JOIN UNNEST(${tbl_products.colors}) as tbl_products__colors ;;
    relationship: one_to_many
  }

  join: tbl_products__categories {
    view_label: "Tbl Products: Categories"
    sql: LEFT JOIN UNNEST(${tbl_products.categories}) as tbl_products__categories ;;
    relationship: one_to_many
  }

  join: tbl_products__conditions {
    view_label: "Tbl Products: Conditions"
    sql: LEFT JOIN UNNEST(${tbl_products.conditions}) as tbl_products__conditions ;;
    relationship: one_to_many
  }

  join: price_info {
    from: tbl_products__price_info
    view_label: "Tbl Products: Price Info"
    sql: LEFT JOIN UNNEST(${tbl_products.price_info} as tbl_products__price_info ;;
    relationship: one_to_many
  }
}

view: tbl_products {
  sql_table_name: `retail-shared-demos.retail.tbl_products`
    ;;
  drill_fields: [id]

  dimension: id {
    label: "Product ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: count_of_unique_products {
    type: count_distinct
    sql: ${id} ;;
  }

  dimension: brands {
    hidden: yes
    sql: ${TABLE}.brands ;;
  }

  dimension: categories {
    hidden: yes
    sql: ${TABLE}.categories ;;
  }

  dimension: price_info {
    hidden: yes
    sql: ${TABLE}.price_info ;;
  }

  dimension: colors {
    # hidden: yes
    sql: ${TABLE}.colors ;;
  }

  dimension: conditions {
    hidden: yes
    sql: ${TABLE}.conditions ;;
  }

  dimension: cost {
    type: number
    sql: ${price_info.tbl_products__price_info}.cost ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
    value_format_name: usd_0
  }

  dimension: currency_code {
    type: string
    sql: currency_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: expire_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.expire_time ;;
  }

  dimension: gtin {
    hidden: yes
    type: string
    sql: ${TABLE}.gtin ;;
  }

  dimension: images {
    # hidden: yes
    sql: ${TABLE}.images ;;
  }

  dimension: language_code {
    type: string
    sql: ${TABLE}.language_code ;;
  }

  dimension: price {
    type: number
    sql: price ;;
  }

  measure: average_price {
    type: average
    sql: ${price} ;;
    value_format_name: usd_0
  }

  dimension_group: price_effecitve {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: price_effecitve_time ;;
  }

  dimension_group: price_expire {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: price_expire_time ;;
  }

  dimension: primary_product_id {
    hidden: yes
    type: string
    sql: ${TABLE}.primary_product_id ;;
  }

  dimension: result {
    hidden: yes
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: sizes {
    # hidden: yes
    sql: ${TABLE}.sizes ;;
  }

  dimension: title {
    label: "Product Name"
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uri {
    hidden: yes
    type: string
    sql: ${TABLE}.uri ;;
  }

  measure: count {
    label: "Count of Products"
    type: count
    drill_fields: [id]
  }
}

view: tbl_products__sizes {
  dimension: tbl_products__sizes {
    type: string
    sql: tbl_products__sizes ;;
  }
}

view: tbl_products__images {
  dimension: tbl_products__images {
    type: string
    sql: tbl_products__images ;;
  }
}

view: tbl_products__brands {
  dimension: tbl_products__brands {
    view_label: "Products"
    label: "Brand"
    type: string
    sql: tbl_products__brands ;;
  }

  measure: count_of_unique_brands {
    view_label: "Products"
    type: count_distinct
    sql: ${tbl_products__brands} ;;
  }
}

view: tbl_products__colors {
  dimension: tbl_products__colors {
    type: string
    sql: tbl_products__colors ;;
  }
}

view: tbl_products__categories {
  dimension: tbl_products__categories {
    view_label: "Products"
    label: "Category"
    type: string
    sql: tbl_products__categories ;;
  }
  measure: count_of_unique_categories {
    view_label: "Products"
    type: count_distinct
    sql: ${tbl_products__categories} ;;
  }
}

view: tbl_products__conditions {
  dimension: tbl_products__conditions {
    type: string
    sql: tbl_products__conditions ;;
  }
}

view: tbl_products__price_info {
  dimension: tbl_products__price_info {
    hidden: yes
    type: string
    sql: tbl_products__price_info ;;
  }
}
