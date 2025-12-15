import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formfun_flutter_test/widgets/scroll_blur.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFE8E8E3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: 8.0,
            top: 16.0,
            right: 8.0,
            bottom: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 0.5,
            children: <Widget>[
              Text(
                'Here\'s your landing page:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                  fontFamily: 'AktivGrotesk',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 285,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ColoredBox(
                    color: Color(0xFFF1F1EF),
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(
                        left: 8.0,
                        top: 16.0,
                        right: 8.0,
                        bottom: 16.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 2.5,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                height: 190,
                                width: 340,
                                'assets/images/ff_website.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset('assets/images/icon_html.svg'),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Form&Fun Landing Page',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontFamily: 'AktivGrotesk',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                          ),
                                    ),
                                    Text(
                                      'HTML',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Color(0xFF808080),
                                            fontFamily: 'AktivGrotesk',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                          ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF0E0F10),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'View',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Color(0xFFFAFAFA),
                                          fontFamily: 'AktivGrotesk',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SingleScrollerWithBlur(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras at odio quam. Etiam sed lorem id ligula egestas ornare non ac mauris. Proin non sagittis justo. Sed id viverra est. Integer enim sem, scelerisque vitae tristique sit amet, ullamcorper vel arcu. Nullam mollis posuere turpis, ac dignissim quam sodales eget. Aenean congue fringilla pretium. Morbi volutpat fringilla luctus. Donec et ligula sit amet mauris sodales tristique a ac quam. Donec vel libero a libero laoreet eleifend a ut nisi. Donec ut sem in orci gravida mattis eget ut nibh. Ut faucibus sollicitudin magna, ac sollicitudin ex tristique at. Pellentesque vehicula nisl et augue commodo, id bibendum urna tristique. Morbi in malesuada libero. Nullam rhoncus ex quis urna fringilla euismod vel imperdiet justo. Quisque condimentum cursus facilisis. Donec ex sem, efficitur sed sagittis ac, accumsan mattis libero. Pellentesque vulputate eget odio vel convallis. Proin malesuada pulvinar felis, sed lobortis sem porttitor ac. Vivamus molestie vehicula orci, efficitur rutrum nulla semper ac. Phasellus ut ligula tortor. In augue est, elementum a sodales eu, sodales id lectus. Sed ac luctus leo. Nullam a nulla pellentesque, scelerisque dolor in, mattis turpis.',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color(0xFF0E0F10),
                    fontFamily: 'AktivGrotesk',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              SizedBox(
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ColoredBox(
                    color: Color(0xFFFFFFFF),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/ff_logo.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Form&Fun',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontFamily: 'AktivGrotesk',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                  ),
                            ),
                            Text(
                              'formandfun.co',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    color: Color(0xFF808080),
                                    fontFamily: 'AktivGrotesk',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontStyle: FontStyle.normal,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
