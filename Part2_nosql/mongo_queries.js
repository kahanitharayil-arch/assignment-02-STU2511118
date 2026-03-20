// Connect to products collection
const products = db.products;


// OP1: insertMany() — insert all 3 documents from sample_documents.json
products.insertMany([
    {
        _id: "ELEC1001",
        name: "Samsung 55-inch 4K Smart TV",
        category: "Electronics",
        brand: "Samsung",
        price: 45999,
        specifications: {
            resolution: "4K UHD",
            display_type: "LED",
            screen_size: "55 inches",
            voltage: "220-240V"
        },
        warranty: {
            period_years: 2,
            type: "Manufacturer"
        },
        features: ["Smart TV", "WiFi", "Bluetooth", "HDR10"],
        stock: 25
    },

    {
        _id: "CLOT2001",
        name: "Men's Cotton Casual Shirt",
        category: "Clothing",
        brand: "Levis",
        price: 1999,
        sizes_available: ["S", "M", "L", "XL"],
        colors_available: ["Blue", "Black", "White"],
        material: "100% Cotton",
        care_instructions: {
            wash: "Machine wash",
            temperature: "30C",
            iron: "Medium heat"
        },
        stock: 120
    },

    {
        _id: "GROC3001",
        name: "Organic Almond Milk",
        category: "Groceries",
        brand: "Urban Platter",
        price: 350,
        expiry_date: new Date("2024-12-20"),
        nutrition: {
            calories: 60,
            protein_g: 2,
            fat_g: 2.5,
            carbohydrates_g: 8
        },
        ingredients: ["Almonds", "Water", "Sea Salt"],
        storage: {
            type: "Refrigerated",
            temperature: "4C"
        },
        stock: 80
    }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
products.find({
    category: "Electronics",
    price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
products.find({
    category: "Groceries",
    expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
products.updateOne(
    { _id: "ELEC1001" },
    { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field
products.createIndex({ category: 1 });

/*
Reason:
Creating an index on the "category" field improves query performance because
many queries filter products by category (e.g., Electronics, Clothing, Groceries).
The index allows MongoDB to quickly locate matching documents instead of scanning
the entire collection.
*/