## Storage Systems

The architecture uses multiple storage systems, each mapped directly to components in the diagram to support the hospital’s four goals. The OLTP database (Patient Records) stores structured transactional data such as patient details, admissions, and billing information. This supports day-to-day operations and acts as the primary source of truth.

A data lake (Raw Medical Data) stores unstructured and semi-structured data such as lab reports, imaging records, and historical treatment data. This is essential for building the readmission prediction model, as it allows large volumes of raw data to be processed during ETL and feature engineering.

The data warehouse (Reporting & Analytics) is used for generating monthly management reports. Data from the OLTP database and data lake is transformed and aggregated into the warehouse, enabling efficient queries for metrics such as bed occupancy and departmental costs.

The vector database (Semantic Search) is used to support the NLP query system shown in the diagram. Patient data is converted into embeddings and stored here, allowing doctors to perform natural language queries like checking past cardiac events through similarity search.

Finally, the time-series database (ICU Vitals) stores high-frequency real-time data from ICU monitoring devices. This system is optimized for streaming data and enables real-time processing and alert generation through the stream processing layer.

## OLTP vs OLAP Boundary

In the diagram, the OLTP system is represented by the OLTP database (Patient Records), where all real-time transactional operations such as patient updates and billing occur. This layer prioritizes consistency and fast write operations.

The OLAP system begins at the data warehouse (Reporting & Analytics), where data is moved from the OLTP database and data lake through ETL pipelines. In this layer, data is transformed and aggregated for reporting and analytical purposes.

The ETL / Feature Engineering layer shown in the diagram acts as the boundary between OLTP and OLAP systems. It separates operational workloads from analytical workloads, ensuring that reporting and machine learning tasks do not affect transactional performance. The data lake also plays a key role as an intermediate storage layer for raw data before it is processed into structured formats.

## Trade-offs

A key trade-off in this architecture is the increased complexity caused by using multiple specialized storage systems, as shown in the diagram (OLTP database, data lake, data warehouse, vector database, and time-series database). While each system is optimized for a specific purpose, managing data flow between them can be challenging and may lead to higher maintenance overhead.

To mitigate this, a centralized orchestration approach can be used to manage the ETL pipelines and stream processing workflows. This ensures consistent data movement between layers such as the data lake, warehouse, and vector database. Additionally, using managed cloud services can reduce operational complexity, while monitoring and validation tools can ensure data consistency across all systems.