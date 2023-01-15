import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


final player=AudioPlayer();

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    Center(child: screen1()),
    Center(child: screen2()),
    Center(child: screen3()),
    Center(child: screen4()),
  ];
  int _previousIndex=0;
  int _currentindex=0;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('訂單系統',style:TextStyle(fontWeight: FontWeight.w700,)),backgroundColor: Colors.pink[100]),
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.pink[100],
          selectedItemColor: Colors.pink[500],
          selectedFontSize: 12.0,
          unselectedItemColor: Colors.pink[200],
          unselectedFontSize: 12.0,
          iconSize: 40.0,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline),
              label: '新增',),//account_circle_outlined
            BottomNavigationBarItem(icon: Icon(Icons.airport_shuttle),
              label: '待出貨',),//account_balance_rounded
            BottomNavigationBarItem(icon: Icon(Icons.turned_in),
              label: '已完成',),//access_time_sharp
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),
              label: '營運表現',),//account_balance_wallet_rounded
          ],
    onTap: (index) { setState(() {
    _previousIndex=_currentindex;
    _currentindex=index;
    if (index==0) {
        if (_previousIndex == _currentindex) player.resume();
    };
    if (index==1) {
        if (_previousIndex == _currentindex) player.resume();
    };
    if (index==2) {
        if (_previousIndex == _currentindex) player.resume();
    };
    if (index==3) {
        if (_previousIndex == _currentindex) player.resume();
    };
    {
         player.stop();
    }
    });
    },
        ),
      ),
    );
  }
}
class NumberControllerWidget extends StatefulWidget {
  //高度
  final double height;//输入框的宽度 总体宽度为自适应
  final double width;//按钮的宽度
  final double iconWidth;//默认输入框显示的数量
  final String numText;//点击加号回调 数量
  final ValueChanged addValueChanged;//点击减号回调 数量
  final ValueChanged removeValueChanged;//点击减号任意一个回调 数量
  final ValueChanged updateValueChanged;

  NumberControllerWidget({
    this.height = 30,
    this.width = 40,
    this.iconWidth = 40,
    this.numText = '0',
    required this.addValueChanged,
    required this.removeValueChanged,
    required this.updateValueChanged,
  });
  @override
  _NumberControllerWidgetState createState() => _NumberControllerWidgetState();
}

class _NumberControllerWidgetState extends State<NumberControllerWidget> {
  var textController= new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.textController.text = widget.numText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1,color: Colors.black12)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //减号
              CoustomIconButton(icon: Icons.remove,isAdd: false),
              //输入框
              Container(
                width: widget.width,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1,color: Colors.black12),
                        right: BorderSide(width: 1,color: Colors.black12)
                    )
                ),
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12
                  ),
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 0,top: 2,bottom: 2,right: 0),
                    border: const OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              //加号
              CoustomIconButton(icon: Icons.add,isAdd: true),
            ],
          ),
        )
      ],
    );
  }

  Widget CoustomIconButton({required IconData icon,required bool isAdd}){
    return Container(
      width: 20,
      height: 20,
      child:IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(icon,size: 15,),
        onPressed: (){
          var num = int.parse(textController.text);
          if(!isAdd&&num ==0)return;
          if(isAdd){
            num ++;
            if(widget.addValueChanged !=null)widget.addValueChanged(num);
          }
          else{
            num --;
            if(widget.removeValueChanged !=null)widget.removeValueChanged(num);
          }
          textController.text = '$num';
          if(widget.updateValueChanged !=null)widget.updateValueChanged(num);
        },
      ),
    );
  }

}

class screen1 extends StatelessWidget {
  @override
  int g1=0,g2=0,g3=0,c1=0,c2=0,c3=0,c4=0,a=0;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),

              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("水蜜芭樂",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),

              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  g1=num;
                },
                removeValueChanged: (num){
                  g1=num;
                },
                updateValueChanged: (num){
                  g1=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("紅寶石芭樂",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  g2=num;
                },
                removeValueChanged: (num){
                  g2=num;
                },
                updateValueChanged: (num){
                  g2=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),

              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("翠玉芭樂",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  g3=num;
                },
                removeValueChanged: (num){
                  g3=num;
                },
                updateValueChanged: (num){
                  g3=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),

              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("甘味辣醬",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  c1=num;
                },
                removeValueChanged: (num){
                  c1=num;
                },
                updateValueChanged: (num){
                  c1=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),

              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("蒜味辣醬",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  c2=num;
                },
                removeValueChanged: (num){
                  c2=num;
                },
                updateValueChanged: (num){
                  c2=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),

              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("原味小魚醬",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  c3=num;
                },
                removeValueChanged: (num){
                  c3=num;
                },
                updateValueChanged: (num){
                  c3=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),

              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("辣味小魚醬",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  c4=num;
                },
                removeValueChanged: (num){
                  c4=num;
                },
                updateValueChanged: (num){
                  c4=num;
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              Container(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),width: 190,
                child: Text("其他",
                    style: TextStyle(fontFamily: '華康',fontSize:35,
                      fontWeight:FontWeight.bold,color: Colors.lightGreen[900],)),
              ),
              NumberControllerWidget(
                numText: '0',
                addValueChanged: (num){
                  a=num;
                },
                removeValueChanged: (num){
                  a=num;
                },
                updateValueChanged: (num){
                  a=num;
                },
              )
            ],
          ),
        ]),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

    );
  }
}
