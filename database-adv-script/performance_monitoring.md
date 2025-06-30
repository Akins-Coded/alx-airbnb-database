## EXPLAIN ANALYZE results:

 - Index scan on bookings instead of sequential scan.

 - Hash joins replaced nested loops.

 - Total execution time reduced to 320 ms.

Conclusion
Adding indexes on the foreign key columns in the bookings table significantly improved query performance by enabling efficient index scans and better join strategies. The total execution time was reduced by approximately 62%, improving responsiveness and reducing server load.
