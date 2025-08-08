import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Shopping App',
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),

            /// Row of images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Local image (add to assets/images/)
                Image.asset(
                  'assets/images/sopping.jpeg',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),

                /// Network image
                Image.network(
                  'https://www.freepik.com/premium-vector/smartphone-with-shop-canopy-store-awning-mobile-phone-mockup-realistic-vector-illustration-phone-shopping-cart-packages_38883486.htm#fromView=keyword&page=1&position=7&uuid=64bbfed2-a6e3-4aa4-a00e-5911886719dd&query=Online+Shopping+Png', // يمكنك تغيير الرابط
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Custom styled text
            const Text(
              'Welcome to the Best Shop!',
              style: TextStyle(
                fontFamily: 'Suwannaphum',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
