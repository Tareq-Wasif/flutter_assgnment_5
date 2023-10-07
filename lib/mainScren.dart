import 'package:flutter/material.dart';

class ShopingCart extends StatefulWidget {
  const ShopingCart({Key? key}) : super(key: key);

  @override
  State<ShopingCart> createState() => _ShopingCartState();
}

class _ShopingCartState extends State<ShopingCart> {
  void checkout() {
    // Show Snackbar with congratulatory message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Your order has been placed.'),
      ),
    );
  }

  List<String> productSize = ['L', 'S', 'M'];
  List<String> productColor = ['Red', 'White', 'Black'];
  List<String> productName = ['Shirt', 'T-Shirt', 'Pant'];
  List<int> productPrice = [400, 200, 800];
  List<String> productImage = [
    'https://images.othoba.com/images/thumbs/0473268_mens-full-sleeve-casual-shirt.jpeg',
    'https://rukminim1.flixcart.com/image/850/1000/kiow6fk0-0/t-shirt/s/h/l/l-white-t-shirt-for-mens-and-boys-amayra-enterprises-original-imafyfzfgc5cfcdn.jpeg?q=90',
    'https://www.kablewala.com.bd/images/detailed/251/42d971615af73182ce764273e41fe1aa.jpg'
  ];
  List<int> productCounts = [1, 1, 1]; // Initialize with default quantities

  int calculateTotalAmount() {
    int totalAmount = 0;
    for (int i = 0; i < productName.length; i++) {
      totalAmount += productCounts[i] * productPrice[i];
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        //title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Our Product List',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 120,
                          width: 90,
                          image: NetworkImage(productImage[index]),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productName[index],
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                  ),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Text('Option 1'),
                                        ),
                                        PopupMenuItem(
                                          child: Text('Option 2'),
                                        ),
                                        PopupMenuItem(
                                          child: Text('Option 3'),
                                        ),
                                      ];
                                    },
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Color:${productColor[index]}    Size:${productSize[index]}"),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            productCounts[index]++;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.add, color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text('${productCounts[index]}'),
                                      SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            productCounts[index]--;
                                            if (productCounts[index] <= 1) {
                                              productCounts[index] = 1;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.remove, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${productPrice[index].toString()}',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount : ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "\$${calculateTotalAmount()}",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: checkout,
              child: Text('Check Out'),
            ),
          )
        ],
      ),
    );
  }
}