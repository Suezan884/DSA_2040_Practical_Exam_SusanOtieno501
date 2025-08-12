## Why chose Star schema over Snowflake schema?
In a Star schema, the design is simpler and more intuitive, which makes it easier for users to understand and query the data. The denormalized structure of the Star schema allows for faster query performance since fewer joins are required compared to a Snowflake schema. This is particularly beneficial in data warehousing environments where read operations are more common than write operations.
The Star schema also provides better support for analytical queries, as it allows for straightforward aggregation and summarization of data. The fact that dimension tables are not normalized means that they can be more easily understood and navigated by business users, which is a key advantage in many reporting and analysis scenarios.
Additionally, the Star schema is often more efficient in terms of storage and performance, as it reduces the complexity of the database design and minimizes the number of joins needed in queries. This can lead to improved performance in data retrieval, especially for large datasets commonly found in data warehousing applications.

## SQL Create Table Statements

CREATE TABLE CustomerDim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) ,
    Customer_Gender VARCHAR(10),
    Customer_Location VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE ProductDim (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) ,
    Product_Category VARCHAR(50),
    Product_Price DECIMAL(10, 2),
    Product_Description TEXT
);

CREATE TABLE TimeDim (
    Time_ID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month VARCHAR(20),
    Quarter VARCHAR(20),
    Year INT
);

CREATE TABLE SalesFact (
    Sale_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Time_ID INT,
    Quantity INT,
    Sales_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES CustomerDim(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES ProductDim(Product_ID),
    FOREIGN KEY (Time_ID) REFERENCES TimeDim(Time_ID)
);

