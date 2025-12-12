import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Here\'s your landing page:',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black,
                fontFamily: 'AktivGrotesk',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        'assets/images/ff_website.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icon_html.svg',
                        height: 32,
                        width: 32,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Form&Fun Landing Page',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Color(0xFF0E0F10),
                                  fontFamily: 'AktivGrotesk',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'HTML',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Color(0xFF808080),
                                  fontFamily: 'AktivGrotesk',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0E0F10),
                        ),
                        child: Text(
                          'View',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Color(0xFFFAFAFA),
                                fontFamily: 'AktivGrotesk',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras at odio quam. '
                            'Etiam sed lorem id ligula egestas ornare non ac mauris. Proin non sagittis justo. '
                            'Sed id viverra est. Integer enim sem, scelerisque vitae tristique sit amet, ullamcorper vel arcu. '
                            'Nullam mollis posuere turpis, ac dignissim quam sodales eget. '
                            'Aenean congue fringilla pretium. Morbi volutpat fringilla luctus. '
                            'Donec et ligula sit amet mauris sodales tristique a ac quam. '
                            'Donec vel libero a libero laoreet eleifend a ut nisi. '
                            'Donec ut sem in orci gravida mattis eget ut nibh. '
                            'Ut faucibus sollicitudin magna, ac sollicitudin ex tristique at.'
                            'Pellentesque vehicula nisl et augue commodo, id bibendum urna tristique. '
                            'Morbi in malesuada libero. Nullam rhoncus ex quis urna fringilla euismod vel imperdiet justo. '
                            'Quisque condimentum cursus facilisis. Donec ex sem, efficitur sed sagittis ac, accumsan mattis libero. '
                            'Pellentesque vulputate eget odio vel convallis. Proin malesuada pulvinar felis, sed lobortis sem porttitor ac. '
                            'Vivamus molestie vehicula orci, efficitur rutrum nulla semper ac. '
                            'Phasellus ut ligula tortor. In augue est, elementum a sodales eu, sodales id lectus. Sed ac luctus leo. '
                            'Nullam a nulla pellentesque, scelerisque dolor in, mattis turpis.',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Colors.black,
                                  fontFamily: 'AktivGrotesk',
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Stack(
        alignment: AlignmentGeometry.center,
        fit: StackFit.expand,
        children: [
          SizedBox(height: 10),
          
          SizedBox(height: 10),
          SizedBox(
            width: 360,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/images/ff_website.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/images/icon_html.svg',
                      height: 32,
                      width: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Form&Fun Landing Page',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Color(0xFF0E0F10),
                                fontFamily: 'AktivGrotesk',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'HTML',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Color(0xFF808080),
                                fontFamily: 'AktivGrotesk',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0E0F10),
                      ),
                      child: Text(
                        'View',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Color(0xFFFAFAFA),
                              fontFamily: 'AktivGrotesk',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras at odio quam. '
                    'Etiam sed lorem id ligula egestas ornare non ac mauris. Proin non sagittis justo. '
                    'Sed id viverra est. Integer enim sem, scelerisque vitae tristique sit amet, ullamcorper vel arcu. '
                    'Nullam mollis posuere turpis, ac dignissim quam sodales eget. '
                    'Aenean congue fringilla pretium. Morbi volutpat fringilla luctus. '
                    'Donec et ligula sit amet mauris sodales tristique a ac quam. '
                    'Donec vel libero a libero laoreet eleifend a ut nisi. '
                    'Donec ut sem in orci gravida mattis eget ut nibh. '
                    'Ut faucibus sollicitudin magna, ac sollicitudin ex tristique at.'
                    'Pellentesque vehicula nisl et augue commodo, id bibendum urna tristique. '
                    'Morbi in malesuada libero. Nullam rhoncus ex quis urna fringilla euismod vel imperdiet justo. '
                    'Quisque condimentum cursus facilisis. Donec ex sem, efficitur sed sagittis ac, accumsan mattis libero. '
                    'Pellentesque vulputate eget odio vel convallis. Proin malesuada pulvinar felis, sed lobortis sem porttitor ac. '
                    'Vivamus molestie vehicula orci, efficitur rutrum nulla semper ac. '
                    'Phasellus ut ligula tortor. In augue est, elementum a sodales eu, sodales id lectus. Sed ac luctus leo. '
                    'Nullam a nulla pellentesque, scelerisque dolor in, mattis turpis.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                      fontFamily: 'AktivGrotesk',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
*/
