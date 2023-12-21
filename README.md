# InventoryManagerFPGA

**APR-2023 FPGA Project**

## Team
- Harshith Ranga 21ECB0A47
- Vikram Dev 21ECB0A48
- Rohan Gunjal 21ECB0A49
- Somil Maldhani 21ECB0A72

---

## Aim
To implement an Inventory Management system using FPGA Artix-7 4DDR and perform necessary operations to display the working of the project.

---

## Project Details
This FPGA project addresses the challenges of space management and classification in warehouses through direct hardware interference. The goal is to create an efficient inventory management system using Verilog on the FPGA Artix-7 4DDR. The project aims to provide a cost-effective, low-power alternative to traditional software solutions, making it a competitive product in the market.

During the current economic expansion, the demand for larger commercial warehouses has increased, driven by the growth of e-commerce. As a result, efficient inventory administration has become crucial for these warehouses. The project employs three levels of abstraction to organize inventory effectively.

1. **Password Checking Module:**
   - Users must verify their identity with an 8-bit long decimal number password.
   - After three failed attempts, the system alerts the authorities.
   - Access to the management system is granted only after entering and verifying a Master Password.

2. **Product ID Encoder:**
   - Allocates a designated location to a unique product based on its priority.
   - Utilizes floor, section, subsection, and shelf for efficient storage.

3. **Location Finder, Display Modules:**
   - Adds or subtracts items based on the number of orders.
   - Prioritizes certain items for efficient shelf management.
   - Updates product quantities, displaying them on the console.
   - Defines underflowing and overflowing cases for extreme scenarios.

### Warehouse Configuration
- Three floors, with the bottommost floor given more priority.
- Each floor contains 5 sections, each further divided into 5 subsections.
- In each of the 5 subsections, there are 5 shelves, and each shelf has 5 containers.
- Each shelf can hold a total of 75 units of a unique product.

### Warehouse Capacity
- Stores 125 unique products.
- Total capacity for all products: 9375 units.

### Sustainability Focus
- Emphasizes smooth and power-efficient addition or subtraction of products.
- Designed for sustainable development with minimal power consumption.

---

## Conclusion
The Inventory Manager FPGA project provides an innovative solution for warehouse management, leveraging the power of FPGA technology. Its efficient methodologies ensure the seamless organization and administration of inventories, addressing the challenges posed by the ever-expanding commercial warehousing sector.
