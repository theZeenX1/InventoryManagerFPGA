# InventoryManagerFPGA
APR-2023 FPGA Project
TEAM:
Harshith Ranga 21ECB0A47
Vikram Dev 21ECB0A48
Rohan Gunjal 21ECB0A49
Somil Maldhani 21ECB0A72
##################################
Aim: To implement Inventory Management system using FPGA Artix – 7 4DDR and perform necessary operations to display working of the project.
##################################
Project Details:
This project uses direct hardware interference to address the challenges of space management and classification. During the current economic expansion, both the quantity and scale of new commercial warehouses have increased dramatically; e-commerce, or online shopping, has been a driving factor of this upsurge. Every quarter, more and larger inventories are put up, and as a result,
their administration has become an important aspect of the planning for these warehouses. Using Verilog, A quicker and more effective way to organise the inventory is guaranteed. The FPGA will be a low-cost, less power-hungry storage organiser alternative to software, making it a competitive product in the market.
Considering the fact that administration of the warehouses is crucial, we
have implemented simple yet efficient methodologies for better outcomes and sustainable development. Three levels of abstraction have been used while developing. The project first encounters a password checking module, followed with product ID encoder and then Location Finder with displaying the count of the units of a unique product ID.
To maintain the integrity of the warehouse management system, security
must be unbreakable. Hence, any user must verify their identify with 8 Bit long decimal number password. On the account of failure after trying thrice, the respective authorities are alarmed and unless a Master Password is entered and verified, management system is not granted access.
To avail a unique product its designated location, its product ID is
entered into the module and its respective floor is allotted based on its priority and followed by its section, sub section and shelf. These operations are performed in the Product ID Encoder Module.
After the location of the product is accessed, one can start adding or
subtracting items based on the number of orders. Since priority is given to certain items these items are added and removed from the shelfs primarily and then algorithm is continued for the other products. After updating the current values of the quantity of the products, these are displayed on the console and both the underflowing and overflowing cases are also defined for extreme
cases. These operations are dealt in Location Finder, Display Modules.
According to the warehouse parameters, the warehouse essentially contains three floors with the bottom most floor given more priority for removal or addition of items for easier access. In each floor there are 5 Sections which are further into 5 Sub Sections. In each of the 5 Sub Sections, there are 5 Shelfs and, in each shelf, it has 5 containers. Hence, a shelf can withhold a total of 75 units of a unique product.
By these calculations, the full capacity of the warehouse is to store 125
Unique Products and 9375 total units of all the products. Considering the quantity of the number of products, warehouse
operations can be performed on huge scale. Addition or Subtraction of the products from their respective locations needs to be undergone smoothly with
less power consuming tactics for a sustainable development.
