- dashboard: search_session_details
  title: Search Session Details
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LILFOF2CC0z7Oi771Cm1tQ
  elements:
  - title: Search Session Details
    name: Search Session Details
    model: base
    explore: events
    type: single_value
    fields: [events.count_of_search_query]
    filters:
      sessions.includes_search_events: 'Yes'
    limit: 500
    dynamic_fields: [{args: [sessions.count_with_search_events], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: sessions.count_with_search_events,
        label: Percent change from previous - Sessions Count with Search Events, source_field: sessions.count_with_search_events,
        table_calculation: percent_change_from_previous_sessions_count_with_search_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 4bPndRlz1o, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    single_value_title: Unique Search Queries
    value_format: 0.00,"K"
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#FBBC04",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Count of unique search queries (not case sensitive) by users. '
    listen:
      Date Range: events.current_date_range
    row: 1
    col: 0
    width: 6
    height: 2
  - title: Average Search Queries - Purchase vs No Purchase
    name: Average Search Queries - Purchase vs No Purchase
    model: base
    explore: events
    type: looker_column
    fields: [sessions.average_search_queries_per_session, purchase]
    pivots: [purchase]
    sorts: [purchase desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: 'if(${sessions.includes_purchase_event},"Session
          Had Purchase","Session Did Not Have Purchase")', label: Purchase, value_format: !!null '',
        value_format_name: !!null '', dimension: purchase, _kind_hint: dimension,
        _type_hint: string, id: cVDQT03bGh}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.average_search_queries_per_session,
            id: Yes - sessions.average_search_queries_per_session, name: Yes Purchase
              Event}, {axisId: sessions.average_search_queries_per_session, id: No
              - sessions.average_search_queries_per_session, name: No Purchase Event}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    hide_legend: false
    trellis_rows: 1
    series_types: {}
    series_colors:
      sessions.average_search_queries_per_session: "#FBBC04"
      Yes - sessions.average_search_queries_per_session: "#FBBC04"
      No - sessions.average_search_queries_per_session: "#DADCE0"
      Session Did Not Have Purchase - sessions.average_search_queries_per_session: "#DADCE0"
      Session Had Purchase - sessions.average_search_queries_per_session: "#FBBC04"
    series_labels:
      No - sessions.average_search_queries_per_session: No Purchase Event
      Yes - sessions.average_search_queries_per_session: Yes Purchase Event
      Session Did Not Have Purchase - sessions.average_search_queries_per_session: Session
        Did Not Have Purchase
    label_color: [black]
    reference_lines: []
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: This shows how many searches are used on average in sessions with and
      without a purchase event.
    listen:
      Date Range: events.event_date
    row: 16
    col: 16
    width: 8
    height: 6
  - title: Sessions Include Search (Yes/No)
    name: Sessions Include Search (Yes/No)
    model: base
    explore: events
    type: looker_pie
    fields: [sessions.includes_search_events, sessions.count_of_sessions]
    fill_fields: [sessions.includes_search_events]
    sorts: [sessions.count_of_sessions desc 0]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    start_angle: -50
    end_angle:
    series_colors:
      'No': "#DADCE0"
      'Yes': "#FBBC04"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: How many sessions include at least one search event?
    listen:
      Date Range: events.event_date
    row: 1
    col: 6
    width: 6
    height: 6
  - title: Query Word Cloud
    name: Query Word Cloud
    model: base
    explore: events
    type: looker_wordcloud
    fields: [events.search_query, events.count_of_sessions]
    filters:
      events.search_query: "-NULL,-S"
    sorts: [events.count_of_sessions desc 0]
    limit: 25
    column_limit: 50
    color_application: undefined
    rotation: false
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Most commons search queries used on your site.
    listen:
      Date Range: events.event_date
    row: 1
    col: 12
    width: 12
    height: 6
  - title: Avg Time Search to Page View
    name: Avg Time Search to Page View
    model: base
    explore: events
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [session_event_sequences.average_time_browsing_results]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    arm_length: 11
    arm_weight: 35
    spinner_length: 151
    spinner_weight: 32
    target_length: 10
    target_gap: 10
    target_weight: 25
    range_min: 0
    range_max: 100
    value_label_type: value
    value_label_font: 12
    value_formatting: '#.## "Seconds"'
    value_label_override: Avg. Time Browsing Search Results
    value_label_padding: 58
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 5
    spinner_type: spinner
    fill_color: "#DADCE0"
    background_color: "#DADCE0"
    spinner_color: "#202124"
    range_color: "#282828"
    gauge_fill_type: segment
    fill_colors: ["#34A853", "#FBBC04", "#EA4335"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 50
    range_x: 0.7
    range_y: 1
    target_label_padding: 1.06
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: 'Average number of seconds between a search and a subsequent detail
      page view for a product. '
    listen:
      Date Range: events.event_date
    row: 8
    col: 0
    width: 6
    height: 5
  - title: Search Sessions
    name: Search Sessions
    model: base
    explore: events
    type: single_value
    fields: [sessions.count_with_search_events, events.period]
    filters:
      sessions.includes_search_events: 'Yes'
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{args: [sessions.count_with_search_events], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: sessions.count_with_search_events,
        label: Percent change from previous - Sessions Count with Search Events, source_field: sessions.count_with_search_events,
        table_calculation: percent_change_from_previous_sessions_count_with_search_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 4bPndRlz1o}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    single_value_title: Search Sessions
    value_format: 0.00,"K"
    comparison_label: vs. Previous Period
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of sessions that included a search event.
    listen:
      Date Range: events.current_date_range
    row: 3
    col: 0
    width: 6
    height: 2
  - title: Search to Page View Time vs Conversion
    name: Search to Page View Time vs Conversion
    model: base
    explore: events
    type: looker_area
    fields: [session_event_sequences.average_time_browsing_results, sessions.overall_conversion,
      sessions.session_start_week]
    fill_fields: [sessions.session_start_week]
    filters:
      sessions.includes_search_events: 'Yes'
    sorts: [sessions.session_start_week desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: session_event_sequences.average_time_browsing_results,
            id: session_event_sequences.average_time_browsing_results, name: Average
              Time Browsing Results}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sessions.overall_conversion, id: sessions.overall_conversion,
            name: Overall Conversion}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: "#.#"
    series_types: {}
    series_colors:
      session_event_sequences.average_time_browsing_results: "#DADCE0"
      sessions.overall_conversion: "#FBBC04"
    series_labels: {}
    label_color: [black, transparent]
    label_rotation: -30
    trend_lines: [{color: "#EA4335", label_position: right, order: 3, period: 7, regression_type: linear,
        show_label: true, series_index: 1, label_type: string, label: Search to Page
          View Time Trend}, {color: "#34A853", label_position: right, order: 3, period: 7,
        regression_type: linear, series_index: 2, show_label: true, label_type: string,
        label: Conversion Trend}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the average time between searches and product page
      views over time its correlation with converting customers. '
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 8
    col: 6
    width: 18
    height: 7
  - title: Conversion Rate by Search Attempts
    name: Conversion Rate by Search Attempts
    model: base
    explore: events
    type: looker_column
    fields: [searches, sessions.overall_conversion]
    filters:
      searches: "<=15,NOT NULL"
    sorts: [searches]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: 'round(${session_event_sequences.events_between_search_and_page_view},0)',
        label: Searches, value_format: !!null '', value_format_name: !!null '', dimension: searches,
        _kind_hint: dimension, _type_hint: number, id: YnsEwdItOc}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Average Conversion Percentage, orientation: left, series: [{
            axisId: sessions.overall_conversion, id: sessions.overall_conversion,
            name: Overall Conversion}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Number of Searches Before Product View
    series_types: {}
    series_colors:
      sessions.overall_conversion: "#FBBC04"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This chart shows how likely often customers convert based on how many
      searches they executed in a session.
    listen:
      Date Range: events.event_date
    row: 16
    col: 6
    width: 10
    height: 6
  - title: Search Events
    name: Search Events
    model: base
    explore: events
    type: single_value
    fields: [events.period, events.count_of_search_events]
    filters:
      sessions.includes_search_events: 'Yes'
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{args: [sessions.count_with_search_events], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: sessions.count_with_search_events,
        label: Percent change from previous - Sessions Count with Search Events, source_field: sessions.count_with_search_events,
        table_calculation: percent_change_from_previous_sessions_count_with_search_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 4bPndRlz1o, is_disabled: true}, {args: [events.count_of_search_events],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: events.count_of_search_events, label: Percent change from previous
          - Events Count of Search Events, source_field: events.count_of_search_events,
        table_calculation: percent_change_from_previous_events_count_of_search_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: UYybALPL11}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    single_value_title: Search Events
    value_format: 0.00,"K"
    comparison_label: vs. Previous Period
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of total search events across all sessions in date range.
    listen:
      Date Range: events.current_date_range
    row: 5
    col: 0
    width: 6
    height: 2
  - title: Search-to-Page View Rate
    name: Search-to-Page View Rate
    model: base
    explore: events
    type: single_value
    fields: [session_event_sequences.click_through_rate, events.period]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [session_event_sequences.click_through_rate], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: session_event_sequences.click_through_rate,
        label: Percent change from previous - Search Session Event Details Clickthrough
          Rate (CTR), source_field: session_event_sequences.click_through_rate, table_calculation: percent_change_from_previous_search_session_event_details_clickthrough_rate_ctr,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: KUBhZ4g7tX}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    single_value_title: Search-to-Page View Rate
    comparison_label: vs. Previous Period
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: How often searches lead to immediate subsequent product page view.
    listen:
      Date Range: events.current_date_range
    row: 18
    col: 0
    width: 6
    height: 2
  - title: Search-to-Purchase
    name: Search-to-Purchase
    model: base
    explore: events
    type: single_value
    fields: [events.period, session_event_sequences.purchase_rate_per_search]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [session_event_sequences.click_through_rate], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: session_event_sequences.click_through_rate,
        label: Percent change from previous - Search Session Event Details Clickthrough
          Rate (CTR), source_field: session_event_sequences.click_through_rate, table_calculation: percent_change_from_previous_search_session_event_details_clickthrough_rate_ctr,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: KUBhZ4g7tX, is_disabled: true}, {args: [session_event_sequences.purchase_rate_per_search],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: session_event_sequences.purchase_rate_per_search, label: Percent
          change from previous - Search Session Event Details Purchase Rate Per Search
          Query, source_field: session_event_sequences.purchase_rate_per_search, table_calculation: percent_change_from_previous_search_session_event_details_purchase_rate_per_search_query,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: t6fmjjwLqq}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    single_value_title: Search-to-Purchase Freq.
    comparison_label: vs. Previous Period
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: How often searches lead to a purchase event.
    listen:
      Date Range: events.current_date_range
    row: 20
    col: 0
    width: 6
    height: 2
  - name: "<b>Overview</b>"
    type: text
    title_text: "<b>Overview</b>"
    subtitle_text: This dashboard dives deeper into sessions that included search
      events.
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 1
  - title: Search Session Conversion Rate
    name: Search Session Conversion Rate
    model: base
    explore: events
    type: single_value
    fields: [sessions.overall_conversion, events.period]
    filters:
      sessions.includes_search_events: 'Yes'
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [sessions.overall_conversion], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: sessions.overall_conversion, label: Percent
          change from previous - Sessions Overall Conversion, source_field: sessions.overall_conversion,
        table_calculation: percent_change_from_previous_sessions_overall_conversion,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: kianmzlijm}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    single_value_title: Conversion Rate
    comparison_label: vs. Previous Period
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Count of sessions that result in a purchase divided by total count
      of sessions.
    listen:
      Date Range: events.current_date_range
    row: 13
    col: 0
    width: 6
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: "<b> How long are people browsing search results? How does that\
      \ affect conversion?</b>"
    body_text: ''
    row: 7
    col: 0
    width: 24
    height: 1
  - title: Searches Before Page View
    name: Searches Before Page View
    model: base
    explore: events
    type: single_value
    fields: [session_event_sequences.average_events_between_search_and_page_view]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Searches Before Product View
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#FBBC04",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Average search queries before a product page view is clicked.
    listen:
      Date Range: events.current_date_range
    row: 16
    col: 0
    width: 6
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: "<b> How many search attempts do users have before finding a product\
      \ to view?</b>"
    body_text: ''
    row: 15
    col: 0
    width: 24
    height: 1
  - title: Event to Next Event Sankey
    name: Event to Next Event Sankey
    model: base
    explore: events
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [session_event_sequences.event_type, session_event_sequences.count, bounce_1]
    filters:
      session_event_sequences.event_type: "-NULL"
    sorts: [session_event_sequences.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(is_null(${session_event_sequences.next_event_type}),"Bounce",${session_event_sequences.next_event_type})',
        label: Bounce, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: bounce, _type_hint: string, id: iNC881EksJ, is_disabled: true},
      {category: dimension, expression: 'if(is_null(${session_event_sequences.next_event_type}),"bounce",${session_event_sequences.next_event_type})',
        label: Bounce, value_format: !!null '', value_format_name: !!null '', dimension: bounce_1,
        _kind_hint: dimension, _type_hint: string, id: wc5GlZKxuy}]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#4285F4", "#EA4335", "#FBBC04", "#34A853", "#5F6368", "#DADCE0",
      "#202124"]
    label_type: name
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: 'The left side of the Sankey is an event type and the right side is
      the immediate subsequent event type. '
    listen:
      Date Range: events.event_date
    row: 23
    col: 11
    width: 13
    height: 10
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: "<b> What do people do immediately after a search?</b>"
    body_text: ''
    row: 22
    col: 0
    width: 24
    height: 1
  - title: Event After Search
    name: Event After Search
    model: base
    explore: events
    type: looker_bar
    fields: [session_event_sequences.event_type, session_event_sequences.count, bounce_1]
    filters:
      session_event_sequences.event_type: search
    sorts: [session_event_sequences.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(is_null(${session_event_sequences.next_event_type}),"Bounce",${session_event_sequences.next_event_type})',
        label: Bounce, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: bounce, _type_hint: string, id: iNC881EksJ, is_disabled: true},
      {category: dimension, expression: 'if(is_null(${session_event_sequences.next_event_type}),"bounce",if(${session_event_sequences.next_event_type}
          = "search","another search",${session_event_sequences.next_event_type}))',
        label: Bounce, value_format: !!null '', value_format_name: !!null '', dimension: bounce_1,
        _kind_hint: dimension, _type_hint: string, id: wbyKsELxjY}, {category: table_calculation,
        label: Percent of Search Session Event Details Count, value_format: !!null '',
        value_format_name: percent_2, calculation_type: percent_of_column_sum, table_calculation: percent_of_search_session_event_details_count,
        args: [session_event_sequences.count], _kind_hint: measure, _type_hint: number,
        id: xtlwdlD9ij}, {category: table_calculation, expression: 'if(${bounce_1}
          = "bounce",${percent_of_search_session_event_details_count},0)', label: Bounce
          Per, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: bounce_per, _type_hint: number, id: vRCeQS49hn}, {category: table_calculation,
        expression: 'if(${bounce_1} != "bounce",${percent_of_search_session_event_details_count},0)',
        label: No Bounce Eer, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: no_bounce_eer, _type_hint: number,
        id: yLlojdnPsx}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: percent_of_search_session_event_details_count,
            id: percent_of_search_session_event_details_count, name: Percent of Search
              Session Event Details Count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_types: {}
    series_colors:
      percent_of_search_session_event_details_count: "#FBBC04"
      bounce_per: "#EA4335"
      no_bounce_eer: "#DADCE0"
    series_labels: {}
    label_color: [black]
    color_range: ["#4285F4", "#EA4335", "#FBBC04", "#34A853", "#5F6368", "#DADCE0",
      "#202124"]
    label_type: name
    defaults_version: 1
    hidden_fields: [session_event_sequences.count, session_event_sequences.event_type,
      percent_of_search_session_event_details_count]
    hidden_points_if_no: []
    note_state: collapsed
    note_display: hover
    note_text: This shows the distribution of event types that come immediately following
      a search.
    listen:
      Date Range: events.event_date
    row: 23
    col: 0
    width: 11
    height: 5
  - title: Event After Page View
    name: Event After Page View
    model: base
    explore: events
    type: looker_bar
    fields: [session_event_sequences.event_type, session_event_sequences.count, bounce_1]
    filters:
      session_event_sequences.event_type: detail-page-view
    sorts: [session_event_sequences.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(is_null(${session_event_sequences.next_event_type}),"Bounce",${session_event_sequences.next_event_type})',
        label: Bounce, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: bounce, _type_hint: string, id: iNC881EksJ, is_disabled: true},
      {category: dimension, expression: 'if(is_null(${session_event_sequences.next_event_type}),"bounce",${session_event_sequences.next_event_type})',
        label: Bounce, value_format: !!null '', value_format_name: !!null '', dimension: bounce_1,
        _kind_hint: dimension, _type_hint: string, id: OHVGBsZTGo}, {category: table_calculation,
        label: Percent of Search Session Event Details Count, value_format: !!null '',
        value_format_name: percent_2, calculation_type: percent_of_column_sum, table_calculation: percent_of_search_session_event_details_count,
        args: [session_event_sequences.count], _kind_hint: measure, _type_hint: number,
        id: xtlwdlD9ij}, {category: table_calculation, expression: 'if(${bounce_1}
          = "bounce",${percent_of_search_session_event_details_count},0)', label: Bounce
          Per, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: bounce_per, _type_hint: number, id: vRCeQS49hn}, {category: table_calculation,
        expression: 'if(${bounce_1} != "bounce",${percent_of_search_session_event_details_count},0)',
        label: No Bounce Eer, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: no_bounce_eer, _type_hint: number,
        id: yLlojdnPsx}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: percent_of_search_session_event_details_count,
            id: percent_of_search_session_event_details_count, name: Percent of Search
              Session Event Details Count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_types: {}
    series_colors:
      percent_of_search_session_event_details_count: "#FBBC04"
      bounce_per: "#EA4335"
      no_bounce_eer: "#DADCE0"
    series_labels: {}
    label_color: [black]
    color_range: ["#4285F4", "#EA4335", "#FBBC04", "#34A853", "#5F6368", "#DADCE0",
      "#202124"]
    label_type: name
    defaults_version: 1
    hidden_fields: [session_event_sequences.count, session_event_sequences.event_type,
      percent_of_search_session_event_details_count]
    hidden_points_if_no: []
    note_state: collapsed
    note_display: hover
    note_text: This shows the distribution of event types that come immediately following
      a detailed page view.
    listen:
      Date Range: events.event_date
    row: 28
    col: 0
    width: 11
    height: 5
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 180 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: base
    explore: events
    listens_to_filters: []
    field: events.current_date_range
