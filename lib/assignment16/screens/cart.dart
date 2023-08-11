import 'package:flutter/material.dart';
import 'package:flutter_assignment/assignment16/provider/productprovider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final cartitems = context.watch<ProductProvider>().cart;
num total=0;
    for (var item in cartitems) {total = total + (item.price * item.count);}


    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(

      title: Text('My Cart ',style: Theme.of(context).textTheme.displayLarge),

        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 50,0),
            child: Text('Items ${cartitems.length}',style: Theme.of(context).textTheme.bodySmall,)
          ),
        ],
      ),

    SliverList(
    delegate: SliverChildBuilderDelegate(
        childCount:cartitems.length,
    (context, index) =>
      Card(
    child: ListTile(

    leading: CircleAvatar(
    backgroundImage: NetworkImage(cartitems[index].image),),
    title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(cartitems[index].name,style: Theme.of(context).textTheme.bodyMedium),
    Text('Rs ${cartitems[index].price}/-',style: Theme.of(context).textTheme.bodyMedium),


    ],
    ),
    trailing:
    Wrap(
      children: [
        TextButton(
            onPressed: () {
              context.read<ProductProvider>().addToList(cartitems[index]);
            },
            child: Icon(Icons.add)),
        Text(' ${cartitems[index].count}',style: Theme.of(context).textTheme.bodyMedium),
        TextButton(
            onPressed: () {
              context.read<ProductProvider>().removeFromList(cartitems[index]);
            },
            child: Icon(Icons.minimize)),
      ],
    ),
    ),
    )

    )),

    SliverToBoxAdapter(

    child:Container(
    margin: EdgeInsets.all(5),
    height: 90,
color: Colors.green,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
        ' Total Amount : ${total}',style: Theme.of(context).textTheme.bodyMedium,
        ),
        ElevatedButton(onPressed: (){},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>( Colors.white),
          ),
          child: Text(
          ' Pay Now',style: Theme.of(context).textTheme.bodyMedium,
        ),)
      ],
    ),
    ),),

       ]

    ),
   );
  }
}