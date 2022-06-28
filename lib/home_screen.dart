import 'dart:convert';
import 'dart:io';

import 'package:azzomtest/user_module.dart';
import 'package:azzomtest/widgets/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override


  void initState() {
    //get items per page
    getPerPage();


    super.initState();
  }


  int itemsNumber = 4;
  bool showMore = false;
  bool internet = true;
  //shimmer effect var
  bool shimmer = false;

  Future<List<User>> user = getUsers();

  @override
  Widget build(BuildContext context) {

    //Screen variables : change the UI components base on screen size and ratio
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double size = MediaQuery.of(context).size.aspectRatio;


    return Scaffold(


      backgroundColor: const Color(0xff3e3963),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Waternote",
          style: TextStyle(fontWeight: FontWeight.w300,
              fontSize: 30),

        ),
        //control app bar colors
        flexibleSpace: Container(
          decoration: const BoxDecoration(

              gradient: LinearGradient(
                  colors: [

                    Color(0xff0073FF),
                    Color(0xff00D4FF),

                  ]
              )
          ),
        ),
       // backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(

            children: [
              //Holds the main home screen components
              Column(
                children: [
                  SizedBox(height: width * 0.02,),
                  //Holds the listview of the users
                  Container(
                    height: height * 0.90,
                    width: width,
                    child: FutureBuilder<List<User>>(

                        future: getUsers(),
                        builder: (context, snapshot) {
                          //Activate loading screen
                          if (snapshot.connectionState == ConnectionState.waiting)  {
                            print("is watiting");


                            shimmer = true;
                            //loading screen items
                            return Column(
                              children: [



                              // a card on loading mode
                                Row(
                                  children: [
                                    SizedBox(width: width*0.18,),
                                    Column(
                                      children: [
                                        SizedBox(height: width*0.02,),

                                        Stack(
                                          clipBehavior: Clip.none,
                                          alignment: AlignmentDirectional.centerStart,
                                          children: [

                                            //hold the shimmer effect for user name and email
                                            Container(

                                                width: width*0.75,
                                                height: width*0.30,

                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xff434273),
                                                    //Color(0xffEFEFEF),
                                                    borderRadius: BorderRadius.circular(15),
                                                    boxShadow: const [


                                                      BoxShadow(
                                                        color: Color(0xff303051),
                                                        blurRadius: 1.0,
                                                        spreadRadius: 1.0,
                                                        offset: Offset(2, 2), // shadow direction: bottom right
                                                      )

                                                    ]
                                                ),


                                                child: Column(

                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [


                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          //hold the shimmer effect for the user name
                                                          Row(

                                                            children: [
                                                              SizedBox(width: 100,),
                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(
                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.3, height: 30,)
                                                                    )

                                                                  ],
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                          SizedBox(height: 20,),

                                                          //hold the shimmer effect for the user email
                                                          Row(
                                                            children: [
                                                              SizedBox(width: 100,),



                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(

                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.4, height: 20,)
                                                                      //AFAEB6
                                                                      //textAlign:TextAlign.start ,
                                                                    ) ,


                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                    )


                                                  ],
                                                )
                                            ),

                                           // hold the shimmer effect for the user profile
                                            Positioned(
                                              left: -50,
                                              bottom:width*0.02,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(200),

                                                child: ShimmerWidget.rectangular(height :width*0.25, width: width*0.25, radius: 25) ,
                                              ),
                                            ),


                                          ],
                                        ),
                                        SizedBox(height: width*0.07,),


                                      ],
                                    ),

                                  ],
                                ),

                                // a card on loading mode
                                Row(
                                  children: [
                                    SizedBox(width: width*0.18,),
                                    Column(
                                      children: [
                                        SizedBox(height: width*0.02,),

                                        Stack(
                                          clipBehavior: Clip.none,
                                          alignment: AlignmentDirectional.centerStart,
                                          children: [

                                            //hold the shimmer effect for user name and email
                                            Container(

                                                width: width*0.75,
                                                height: width*0.30,

                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xff434273),
                                                    //Color(0xffEFEFEF),
                                                    borderRadius: BorderRadius.circular(15),
                                                    boxShadow: const [


                                                      BoxShadow(
                                                        color: Color(0xff303051),
                                                        blurRadius: 1.0,
                                                        spreadRadius: 1.0,
                                                        offset: Offset(2, 2), // shadow direction: bottom right
                                                      )

                                                    ]
                                                ),


                                                child: Column(

                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [


                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          //hold the shimmer effect for the user name
                                                          Row(

                                                            children: [
                                                              SizedBox(width: 100,),
                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(
                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.3, height: 30,)
                                                                    )

                                                                  ],
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                          SizedBox(height: 20,),

                                                          //hold the shimmer effect for the user email
                                                          Row(
                                                            children: [
                                                              SizedBox(width: 100,),



                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(

                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.4, height: 20,)
                                                                      //AFAEB6
                                                                      //textAlign:TextAlign.start ,
                                                                    ) ,


                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                    )


                                                  ],
                                                )
                                            ),

                                            // hold the shimmer effect for the user profile
                                            Positioned(
                                              left: -50,
                                              bottom:width*0.02,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(200),

                                                child: ShimmerWidget.rectangular(height :width*0.25, width: width*0.25, radius: 25) ,
                                              ),
                                            ),


                                          ],
                                        ),
                                        SizedBox(height: width*0.07,),


                                      ],
                                    ),

                                  ],
                                ),

                                // a card on loading mode
                                Row(
                                  children: [
                                    SizedBox(width: width*0.18,),
                                    Column(
                                      children: [
                                        SizedBox(height: width*0.02,),

                                        Stack(
                                          clipBehavior: Clip.none,
                                          alignment: AlignmentDirectional.centerStart,
                                          children: [

                                            //hold the shimmer effect for user name and email
                                            Container(

                                                width: width*0.75,
                                                height: width*0.30,

                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xff434273),
                                                    //Color(0xffEFEFEF),
                                                    borderRadius: BorderRadius.circular(15),
                                                    boxShadow: const [


                                                      BoxShadow(
                                                        color: Color(0xff303051),
                                                        blurRadius: 1.0,
                                                        spreadRadius: 1.0,
                                                        offset: Offset(2, 2), // shadow direction: bottom right
                                                      )

                                                    ]
                                                ),


                                                child: Column(

                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [


                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          //hold the shimmer effect for the user name
                                                          Row(

                                                            children: [
                                                              SizedBox(width: 100,),
                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(
                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.3, height: 30,)
                                                                    )

                                                                  ],
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                          SizedBox(height: 20,),

                                                          //hold the shimmer effect for the user email
                                                          Row(
                                                            children: [
                                                              SizedBox(width: 100,),



                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(

                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.4, height: 20,)
                                                                      //AFAEB6
                                                                      //textAlign:TextAlign.start ,
                                                                    ) ,


                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                    )


                                                  ],
                                                )
                                            ),

                                            // hold the shimmer effect for the user profile
                                            Positioned(
                                              left: -50,
                                              bottom:width*0.02,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(200),

                                                child: ShimmerWidget.rectangular(height :width*0.25, width: width*0.25, radius: 25) ,
                                              ),
                                            ),


                                          ],
                                        ),
                                        SizedBox(height: width*0.07,),


                                      ],
                                    ),

                                  ],
                                ),

                                // a card on loading mode
                                Row(
                                  children: [
                                    SizedBox(width: width*0.18,),
                                    Column(
                                      children: [
                                        SizedBox(height: width*0.02,),

                                        Stack(
                                          clipBehavior: Clip.none,
                                          alignment: AlignmentDirectional.centerStart,
                                          children: [

                                            //hold the shimmer effect for user name and email
                                            Container(

                                                width: width*0.75,
                                                height: width*0.30,

                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xff434273),
                                                    //Color(0xffEFEFEF),
                                                    borderRadius: BorderRadius.circular(15),
                                                    boxShadow: const [


                                                      BoxShadow(
                                                        color: Color(0xff303051),
                                                        blurRadius: 1.0,
                                                        spreadRadius: 1.0,
                                                        offset: Offset(2, 2), // shadow direction: bottom right
                                                      )

                                                    ]
                                                ),


                                                child: Column(

                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [


                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          //hold the shimmer effect for the user name
                                                          Row(

                                                            children: [
                                                              SizedBox(width: 100,),
                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(
                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.3, height: 30,)
                                                                    )

                                                                  ],
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                          SizedBox(height: 20,),

                                                          //hold the shimmer effect for the user email
                                                          Row(
                                                            children: [
                                                              SizedBox(width: 100,),



                                                              Container(

                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(

                                                                        child: ShimmerWidget.rectangular(radius: 20 , width: width*0.4, height: 20,)
                                                                      //AFAEB6
                                                                      //textAlign:TextAlign.start ,
                                                                    ) ,


                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                    )


                                                  ],
                                                )
                                            ),

                                            // hold the shimmer effect for the user profile
                                            Positioned(
                                              left: -50,
                                              bottom:width*0.02,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(200),

                                                child: ShimmerWidget.rectangular(height :width*0.25, width: width*0.25, radius: 25) ,
                                              ),
                                            ),


                                          ],
                                        ),
                                        SizedBox(height: width*0.07,),


                                      ],
                                    ),

                                  ],
                                ),






                             ],
                            );
                          }

                          //check if data has been fetched from the server
                          if( snapshot.hasData){

                          print("it's working");

                          shimmer= false;

                          final user = snapshot.data!;

                          return buildUsers(user);


                          }else
                            //check if there is an error
                            {
                          print("there is an error");

                          print(snapshot.error);
                          return
                            //move the user to the error screen
                          LottieBuilder.asset("assets/no-connection.json",

                          repeat: false,
                          );
                          }


                        }
                    ),
                  ),

                ],
              ),
              // hold the show more button
              Positioned(
                //bottom: -1,
                  right: width * 0.37,
                  top: height * 0.78,
                  child: Container(


                    width: width * 0.25,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                        ]
                    ),


                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      // BUY BUTTON
                      child: ElevatedButton(

                          child: Text(showMore ?
                          "عرض اقل  " : "عرض المزيد  ",
                              style: TextStyle(fontSize: size * 25,
                                  fontFamily: "cairo")
                          ),


                          //get the number of items per page from the server
                          onPressed: () async {
                            int theNew = await getPerPage();


                            setState(() {
                              itemsNumber = theNew;

                              showMore = !showMore;
                            });
                          },

                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff605F99),)),
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }

  //fetch the user information from the API
  static Future<List<User>> getUsers() async {



    const myurl = "https://reqres.in/api/users?page=1";
    final respone = await http.get(Uri.parse(myurl));

    final body = json.decode(respone.body);
    final data = body["data"];
    int totalpages = body["total_pages"];

    //print(body['data']);


    return data.map<User>(User.fromJson).toList();
  }



 //build users listview items
  Widget buildUsers(List<User> users) => ListView.builder(


          itemCount: showMore ? itemsNumber : 4,

          itemBuilder: (context, index) {
            //iphone=  w428 h 926 s 0.45
            //note = w;411 h 830  s 0.49
            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            double size = MediaQuery.of(context).size.aspectRatio;

            final thisUser = users[index];
            //return user card
            return Row(
              children: [
                SizedBox(width: width * 0.18,),
                Column(
                  children: [
                    SizedBox(height: width * 0.02,),

                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.centerStart,
                      children: [


                        Container(

                            width: width * 0.75,
                            height: width * 0.30,

                            decoration: BoxDecoration(
                                color: const Color(
                                    0xff434273),
                                //Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [


                                  BoxShadow(
                                    color: Color(0xff303051),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        2, 2), // shadow direction: bottom right
                                  )

                                ]
                            ),


                            child: Column(
                              //thisuser.firstname +" "+ thisuser.lastname
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      // hold user name
                                      Row(
                                        children: [
                                          SizedBox(width: 100,),
                                          Container(
                                            //color:Colors.red,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Container(
                                                  child: shimmer ? ShimmerWidget
                                                      .rectangular(radius: 20,
                                                    width: width*0.3,
                                                    height: 30,) : Text(
                                                    thisUser.firstname + " " +
                                                        thisUser.lastname,
                                                    //textAlign:TextAlign.start ,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: width * 0.06,
                                                        color: Color(
                                                            0xfffffdfe)
                                                      //FFFDFE

                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      // hold user name
                                      Row(
                                        children: [
                                          SizedBox(width: 100,),


                                          Container(

                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Container(

                                                  child: shimmer ? ShimmerWidget
                                                      .rectangular(radius: 20,
                                                    width: width*0.4,
                                                    height: 20,) : Text(
                                                    thisUser.useremail,
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xffafaeb6),
                                                        fontSize: width * 0.04),
                                                    //AFAEB6
                                                    //textAlign:TextAlign.start ,
                                                  ),
                                                )


                                              ],
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                )


                              ],
                            )
                        ),

                        //hold user picture
                        Positioned(
                          left: -50,
                          bottom: width * 0.02,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),

                            child: CachedNetworkImage(
                              imageUrl: thisUser.useravatar,
                              // width:width*0.90,
                              height: width * 0.25,
                              width: width * 0.25,
                              fit: BoxFit.cover,

                              placeholder: (context, url) =>
                                  ShimmerWidget.rectangular(height: width *
                                      0.25, width: width * 0.25, radius: 25),
                            ),
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: width * 0.07,),


                  ],
                ),

              ],
            );
          }

      );


  //fetch number of users from the API
  Future<int> getPerPage() async {
    const myurl = "https://reqres.in/api/users?page=1";
    final respone = await http.get(Uri.parse(myurl));

    final body = json.decode(respone.body);
    int perPage = body["per_page"];

    return perPage;
  }
}




