import 'package:flutter/material.dart';

class SuccessStoryCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String courseType;
  final Color courseColor;
  final String description;

  const SuccessStoryCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.courseType,
    required this.courseColor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

  
  final cardWidth = screenWidth * 0.49;
  final padding = screenWidth * 0.04;
  final fontSizeTitle = screenWidth * 0.04;
    final fontSizeSubTitle = screenWidth * 0.03;
    final fontSizeDesc = screenWidth * 0.03;

    return Container(
      height: screenHeight*0.19,
      width: cardWidth,
      margin: EdgeInsets.all(padding / 2),
      padding: EdgeInsets.all(padding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: screenWidth * 0.02,
            offset: Offset(screenWidth * 0.005, screenWidth * 0.01),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
           Container(
  height: screenHeight * 0.060,
  width: screenWidth * 0.13,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(imageUrl), 
      fit: BoxFit.cover,
    ),
  ),
),
             
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeTitle)),
                    Text(
                      courseType,
                      style: TextStyle(
                        fontSize: fontSizeSubTitle,
                        color: courseColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight*0.01,),
          Text(
            description,
            style: TextStyle(fontSize: fontSizeDesc, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
