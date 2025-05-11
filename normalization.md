### Database Normalization to 3NF

After reviewing the initial schema, it appears to be largely in 3NF. Let's break down why and consider any potential adjustments.

**First Normal Form (1NF):**

* **Rule:** Each column must contain atomic (indivisible) values, and there should be no repeating groups of columns.
* **Analysis:** The current schema adheres to 1NF. Each column in every table holds a single value, and there are no repeating groups. For example, a user has one `first_name` and one `last_name`, not multiple names in a single field.

**Second Normal Form (2NF):**

* **Rule:** The table must be in 1NF, and all non-key attributes must be fully functionally dependent on the entire primary key.
* **Analysis:**
    * In the `User` table, all non-key attributes (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`) are directly dependent on the primary key `id`.
    * In the `Property` table, all non-key attributes (`host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`) are directly dependent on the primary key `id`. The `host_id` is a foreign key referencing the `User` table.
    * In the `Booking` table, all non-key attributes (`property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`) are directly dependent on the primary key `id`. `property_id` and `user_id` are foreign keys.
    * In the `Payment` table, all non-key attributes (`booking_id`, `amount`, `payment_date`, `payment_method`) are directly dependent on the primary key `id`. `booking_id` is a foreign key.
    * In the `Review` table, all non-key attributes (`property_id`, `user_id`, `rating`, `comment`, `created_at`) are directly dependent on the primary key `id`. `property_id` and `user_id` are foreign keys.
    * In the `Message` table, all non-key attributes (`sender_id`, `recipient_id`, `message_body`, `sent_at`) are directly dependent on the primary key `id`. `sender_id` and `recipient_id` are foreign keys.
* **Conclusion:** The current schema appears to satisfy 2NF.

**Third Normal Form (3NF):**

* **Rule:** The table must be in 2NF, and all non-key attributes must be non-transitively dependent on the primary key. This means that no non-key attribute should depend on another non-key attribute.
* **Analysis:**
    * In the `User` table, all non-key attributes are directly dependent on `id` and not on each other.
    * In the `Property` table, all non-key attributes are directly dependent on `id`.
    * In the `Booking` table, all non-key attributes are directly dependent on `id`. The `total_price` might be calculated based on `start_date`, `end_date`, and `pricepernight` from the `Property` table. However, in this schema, `total_price` is stored directly in the `Booking` table. While it could be argued that this introduces potential redundancy (if `pricepernight` changes, existing bookings' `total_price` might become inconsistent if not updated), storing it directly can also optimize query performance for booking retrieval. For strict 3NF, we might consider calculating this on the fly or having a mechanism to update it. However, for practical purposes and given the current design, it doesn't strictly violate 3NF as `total_price` is an attribute of the specific booking event.
    * In the `Payment` table, all non-key attributes are directly dependent on `id`.
    * In the `Review` table, all non-key attributes are directly dependent on `id`.
    * In the `Message` table, all non-key attributes are directly dependent on `id`.

**Potential Considerations and Minor Adjustments (for stricter 3NF):**

While the current schema is largely in 3NF, one could argue about the `total_price` in the `Booking` table. If we wanted to be extremely strict with 3NF, we might consider removing `total_price` and calculating it in queries based on the `start_date`, `end_date`, and the `pricepernight` from the associated `Property` at the time of booking (which would require potentially storing historical `pricepernight` or accepting the current price). However, this adds complexity to querying and might not be the most practical approach for this scenario.

**Conclusion:**

The provided database schema is already well-normalized, likely meeting the requirements of 3NF. The direct storage of `total_price` in the `Booking` table is a design decision that, while potentially introducing some redundancy in a highly theoretical sense, can be practical for performance and representing the agreed-upon price at the time of booking. No significant structural changes are strictly necessary to achieve 3NF based on the provided schema.
