import 'dart:math';
import 'package:flutter/material.dart';
import '../models/order_item.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final OrderItem orderItem;

  OrderWidget(this.orderItem);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orderItem.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height: min(widget.orderItem.products.length * 20 + 20.0, 100.0),
              child: ListView(
                  children:
                      widget.orderItem.products.map((product) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )),
                         Text(
                           '${product.quantity}x \$${product.price}',
                           style: TextStyle(fontSize: 18,color: Colors.grey),
                         )
                        ],
                      )).toList()),
            )
        ],
      ),
    );
  }
}
