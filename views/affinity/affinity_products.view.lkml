view: affinity_products {
  derived_table: {
    explore_source: events {
      column: product__colors { field: colors.tbl_products__colors }
      column: product__description { field: products.description }
      column: product__images { field: images.tbl_products__images }
      column: product__language_code { field: products.language_code }
      column: product__price { field: products.price }
      column: product__id { field: products.id }
      column: product__title { field: products.title }
      column: product__sizes { field: sizes.tbl_products__sizes }
      column: product__type { field: products.type }
      column: product__cost { field: products.cost }
    }
  }
  dimension: product__colors {
    label: "Colors"
    description: ""
  }
  dimension: product__description {
    label: "Description"
    description: ""
  }
  dimension: product__images {
    label: "Images"
    description: ""
  }
  dimension: product__language_code {
    label: "Language Code"
    description: ""
  }
  dimension: product__price {
    label: "Price"
    description: ""
    type: number
  }
  dimension: product__id {
    label: "ID"
    description: ""
  }
  dimension: product__title {
    label: "Title"
    description: ""
  }
  dimension: product__sizes {
    label: "Sizes"
    description: ""
  }
  dimension: product__type {
    label: "Type"
    description: ""
  }
  dimension: product__cost {
    label: "Cost"
    description: ""
    type: number
  }
}
