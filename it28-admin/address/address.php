<?php
require_once 'address_config.php';

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $streetAddress = $_POST['streetAddress'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $postalCode = $_POST['postalCode'];
    $country = $_POST['country'];

    // Insert data into database
    $sql = "INSERT INTO addresses (street_address, city, state, postal_code, country) 
            VALUES (:street_address, :city, :state, :postal_code, :country)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':street_address', $streetAddress);
    $stmt->bindParam(':city', $city);
    $stmt->bindParam(':state', $state);
    $stmt->bindParam(':postal_code', $postalCode);
    $stmt->bindParam(':country', $country);

    try {
        $stmt->execute();
        header("Location: success.php");
        exit();
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Address Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Enter Full Address</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="streetAddress">Street Address:</label>
        <input type="text" id="streetAddress" name="streetAddress"><br>

        <label for="city">City:</label>
        <input type="text" id="city" name="city"><br>

        <label for="state">State:</label>
        <input type="text" id="state" name="state"><br>

        <label for="postalCode">Postal Code:</label>
        <input type="text" id="postalCode" name="postalCode"><br>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country"><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
