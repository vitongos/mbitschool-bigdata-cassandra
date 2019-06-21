CREATE KEYSPACE products 
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2 };

USE products;

CREATE TABLE catalog (
    name text,
    description text,
    variants list< frozen < tuple <text, text > > >,
    promotions set< frozen <tuple <text, int > > >,
    rates list< int >,
    stock set< frozen <tuple <text, text, text, int > > >,
    prices set< frozen <tuple <text, text, text, decimal > > >,
    PRIMARY KEY (name)
);

COPY catalog (
  name, 
  description, 
  variants, 
  promotions, 
  rates, 
  stock, 
  prices
) 
FROM '/cassandra/data/products.csv' 
WITH DELIMITER = ';'
AND HEADER = true;
