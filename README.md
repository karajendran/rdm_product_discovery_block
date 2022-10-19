### What does this Block do for me?

**(1) Understand your business** - Quickly and easily assess the state of your retail business in terms of revenue, order value, purchases, and more.

**(2) Understand customer behavior** - See conversion and abandonment rates, top searched products and categories, top viewed products and categories, and more.

**(3) Assess product performance** - Identify trending products to promote more aggressively.

**(4) Assess search performance** - Assess the performance of Google Retail Search and its impact on your business. See the add-to-carts, purchases, and total sales that were generated from customer searches. See top search terms,  total number of searches, and more.


### Block Structure

**Dashboards** - Due to the nature in which this data is displayed, this Block only exposes Dashboards as starting points for exploration, rather than using individual "Explore" pages. Start from a dashboard, then drill into any tile to start free-form exploration.


### Implementation Instructions / Customizations ##

* **Connection and Permission**
    - For information about prerequisites, Looker set-up, connecting to Google BigQuery, and creating a materialized view for sales, see [Get dashboards that show key performance indicators](https://cloud.google.com/retail/docs/get-dashboards-that-show-kpis) in the Google Retail API documentation.



* **Installation**
    - **Marketplace** Installation via the Looker Marketplace will prompt configuration of the Looker BigQuery connection desired for use with this block.

* **Customization**
    - **Refinements** This block uses refinements for customization. For more information on using refinements to customize marketplace blocks, please see [this documentation] (https://docs.looker.com/data-modeling/marketplace/customize-blocks).

 * **[Optional] Change daily PDT trigger** - The default PDT trigger (00:00 UTC) is not selected for any particular timezone, so you may want to offset it so that it does not trigger during your peak hours.

 * **[Optional] Unhide Explores** - Explores are hidden by default.


### How do I optimize the performance of my database?

Check our [Looker Discourse article](https://discourse.looker.com/t/optimizing-redshift-performance-with-lookers-redshift-block/4110) for an overview of common performance issues, and suggestions to resolve them.
