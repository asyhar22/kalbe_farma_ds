/* START */


-- [1] Berapa rata-rata umur customer jika dilihat dari marital statusnya ?
SELECT "Marital Status" , AVG(Age) as "Umur Rata-rata",
	CASE
		WHEN "Marital Status"  = "" THEN "Status tidak diisi"
		WHEN "Marital Status"  = "Married" THEN "Menikah"
		WHEN "Marital Status"  = "Single" THEN "Tidak Menikah"
	END AS "Ket."
FROM Customer c 
GROUP BY "Marital Status" 


-- [2] Berapa rata-rata umur customer jika dilihat dari gender nya ?
SELECT "Gender" , AVG(Age) as "Umur Rata-rata",
	CASE
		WHEN "Gender" = 0 THEN "Wanita"
		WHEN "Gender" = 1 THEN "Pria"
	END AS "Ket."
FROM Customer c 
GROUP BY Gender


-- [3] Tentukan nama store dengan total quantity terbanyak!
SELECT StoreName, SUM(Qty) as "Total Quantity"
FROM "Transaction" t 
LEFT JOIN "Store" s ON t.StoreID = s.StoreID
GROUP BY StoreName
ORDER BY "Total Quantity" DESC 
LIMIT 1


-- [4] Tentukan nama produk terlaris dengan total amount terbanyak!
SELECT "Product Name" , TotalAmount 
FROM "Transaction" t 
LEFT JOIN Product p ON t.ProductID = p.ProductID 
GROUP BY "Product Name" 
ORDER BY TotalAmount DESC 
LIMIT 1


/* END */