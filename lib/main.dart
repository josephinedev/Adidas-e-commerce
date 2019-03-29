import 'package:flutter/material.dart';
import 'package:adidas_shoes_ecommerce/utils.dart';
import 'package:adidas_shoes_ecommerce/data.dart';

void main() => runApp(MaterialApp(home: MyApp(),
    debugShowCheckedModeBanner: false,
));
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF696D77),
            Color(0xFF292c36)
          ],
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp)
          ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation:0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                size: screenAwareSize(20.0, context),
            ),
                onPressed: (){}
          ),
            title: Text('Energy Cloud',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareSize(18.0, context),
              fontFamily: 'Montserrat-Bold'),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.favorite,
                  size: screenAwareSize(20.0, context),
                    color: Colors.white,
                  ),
                  onPressed:(){}
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              ProductScreenTopPart(),
              ProductScreenBottomPart()
            ],

          ),));
  }
}

class ProductScreenTopPart extends StatefulWidget{
  @override
  _ProductScreenTopPartState createState() => new _ProductScreenTopPartState();
}
class _ProductScreenTopPartState extends State< ProductScreenTopPart>{
  @override
  Widget build(BuildContext context) {

    return new Container(
      width: double.infinity,
      height: screenAwareSize(190.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset('assets/adidas2.png',
                width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover),

      ),
              Padding(
                  padding: EdgeInsets.only(top: 60.0,right: 35.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: screenAwareSize(50.0, context),
                  height: screenAwareSize(50.0, context),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle),
                  child: Image.asset('assets/360.png'),
                ),
              )
              )
            ]
              ),
              Positioned(
                left: screenAwareSize(18, context),
                bottom: screenAwareSize(15, context),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Rating",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Monserrat-SemiBold"
                  ),
                  ),
                  SizedBox(
                    height: screenAwareSize(8.0, context),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 8.0,),
                      Icon(Icons.star, color: Color(0XFFFFE600)),
                      SizedBox(
                        width: screenAwareSize(5.0, context),
                      ),
                      Text("4.5", style: TextStyle( color: Color(0xFFFFE600)),),
                      SizedBox(
                        width: screenAwareSize(5.0, context),
                      ),
                      Text("(378 People)",style: TextStyle(color: Colors.white, fontSize:14.0) )
                    ],
                  )
                ],
              ),
              )
            ],
          )
      );
  }
}

class ProductScreenBottomPart extends StatefulWidget{
  @override
  _ProductScreenBottomPartState createState() =>
      new _ProductScreenBottomPartState();
}
class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded= false;
  int currentSizeIndex = 0;
  int currentColorIndex= 0;
  int _counter =0;

  void _increase(){
    setState(() {
      _counter++;
    });
  }
  void _decrease(){
    setState(() {
      _counter--;
    });

  }
  void _expand(){
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }
  List<Widget> colorSelector(){
    List<Widget> colorItemList = new List();
    for (var i=0; i < colors.length; i++)
      {
        colorItemList.add(colorItem(colors[i],i == currentColorIndex, context,(){
          setState(() {
            currentColorIndex=i;
          });
        }));
      }
       return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenAwareSize(18, context)),
          child: Text('Product Description',
            style: TextStyle(color: Color(0xFF949598),
              fontSize: screenAwareSize(10.0, context),
            ),
          ) ,
        ),
        SizedBox(
          height: screenAwareSize(8, context),
        ),
        Padding(padding: EdgeInsets.only(left: screenAwareSize(26, context), right: screenAwareSize(18, context)),
        child: AnimatedCrossFade(firstChild: Text(desc,maxLines: 2, style: TextStyle(
            color: Colors.white,
            fontSize: screenAwareSize(10, context)
        ),
        ),
          secondChild: Text(
            desc,
//            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareSize(10, context)
          ),
          ),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
        ),
        Padding(padding: EdgeInsets.only(
          left: screenAwareSize(26, context),
           right: screenAwareSize(18, context),
        ),
          child:  GestureDetector(
            onTap:_expand ,
            child: Text(isExpanded ? "less" : "more..",
            style: TextStyle(
              color: Color(0xFFFB382F), fontWeight: FontWeight.w700
            ),
            ) ,
          ) ,
        ),
      SizedBox(
        height: screenAwareSize(12, context),
      ),
      Padding(padding: EdgeInsets.only(
          left: screenAwareSize(15, context),
          right: screenAwareSize(75, context)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Size", style: TextStyle(
              color: Color(0xFF949598),
              fontSize: screenAwareSize(10, context)
          ),),
          Text("Quantity", style: TextStyle(
              color: Color(0xFF949598),
              fontSize: screenAwareSize(10, context)
          ),)
        ],
      ) ,
      ),
        SizedBox(
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: screenAwareSize(20, context), right: screenAwareSize(10, context)),
          child:    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
              height: screenAwareSize(38, context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: sizeNumList.map((item){
                    var index = sizeNumList.indexOf(item);

                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          currentSizeIndex = index;
                        });

                      },
                      child: sizeItem(item, index == currentSizeIndex, context),
                    );
                  }).toList(),
                ),
          ),
              Padding(
                  padding: EdgeInsets.all(12.0),
                child: Container(
                width: screenAwareSize(100, context),
                height: screenAwareSize(30, context),
                decoration: BoxDecoration(
                  color: Color(0xFF525663),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                        flex: 3,
                        child: GestureDetector(
                          onTap: _decrease,
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Text("-", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),),
                            ),
                          ),
                        ),
                    ),
                    divider(),
                    Flexible(
                      flex: 3,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: double.infinity,
                          child: Center(
                            child: Text(_counter.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    divider(),
                    Flexible(
                      flex: 3,
                      child: GestureDetector(
                        onTap: _increase,
                        child: Container(
                          height: double.infinity,
                          child: Center(
                            child: Text("+", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: screenAwareSize(18, context)),
          child: Text("Select color", style: TextStyle(
              color: Color(0xFF949598),
              fontSize: screenAwareSize(10, context)
          ),),
        ),
        SizedBox(
          height: screenAwareSize(8.0, context),
        ),
        Container(
          width: double.infinity,
          height: screenAwareSize(34.0, context),
          child: Row(
            children: colorSelector(),
          ),
        ),
        SizedBox(
          height: screenAwareSize(8.0, context),
        ),
        Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20, context)),
          child: Text("Price",style: TextStyle(
            color: Color(0xFF949598),
          ),),
        ),
        Container(
          width: double.infinity,
          height: screenAwareSize(120, context),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: screenAwareSize(22, context)),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: screenAwareSize(18, context)),
                      child: Row(
                        children: <Widget>[
                          Text("\$", style: TextStyle(
                            color: Colors.white,
                            fontSize: screenAwareSize(26.0, context)
                          ),),
                          SizedBox(width: screenAwareSize(2.0, context),),
                          Text("80", style: TextStyle(
                              color: Colors.white,
                              fontSize: screenAwareSize(30.0, context)
                          ),),
                        ],
                      ),
                    ),
                 SizedBox(
                   height: screenAwareSize(10, context),
                 ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    MaterialButton(
                      color: Color(0xFFFB382F),
                      padding: EdgeInsets.symmetric(vertical: screenAwareSize(14, context),horizontal: screenAwareSize(0.0, context)),
                      onPressed: (){},
                      child:Align(
                        alignment: Alignment.centerLeft,
                          child:Padding(
                         padding: EdgeInsets.only(
                             left:screenAwareSize(35, context)
                         ),
                              child: Text("Add to Cart",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(15, context)
                                ),)
                      ),

                      ),
                    ),
                  ],
                ) ,
              ),
              Positioned(
                right: -40.0,
                  top: -25,
                  bottom: -35.0,
                  child: Image.asset("assets/cart.png",
                  width: screenAwareSize(190, context),
                    height: screenAwareSize(155.0, context),
                    fit: BoxFit.cover,
                  )
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}

Widget colorItem(Color color,bool isSelected, BuildContext context, VoidCallback _ontab){
  return GestureDetector(
    onTap: _ontab,
    child: Padding(
        padding: EdgeInsets.only(left: screenAwareSize(10, context)),
      child: Container(
        width: screenAwareSize(30, context),
        height: screenAwareSize(30, context),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: isSelected ? [
           BoxShadow(
             color: Colors.black.withOpacity(.8),
             blurRadius: 10.0,
             offset: Offset(0.0, 10.0)
           )
          ]:[]
        ),
        child: ClipPath(
          clipper: MClipper(),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: screenAwareSize(20, context)),
              height: double.infinity,
              color: color,
            ),
        ),
      ),
    ),
  );
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 12.0),
    child: Container(
      width: screenAwareSize(30, context),
      height: screenAwareSize(30, context),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0
            )
          ]
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
  );
}
class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path= new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2 );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }
}


Widget divider(){
   return Padding(
     padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
     child:Container(
       width: 0.8,
       color: Colors.black,
     ) ,
   );
}