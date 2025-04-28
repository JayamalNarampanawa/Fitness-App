import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});
//UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home.jpeg"), 
            fit: BoxFit.cover,
          ),
        ),
        //title
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Terms and Conditions",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //content
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SingleChildScrollView(
                  child: Text(
                    '''These terms and conditions outline the rules and regulations for the use of maxburn page Website. By accessing this website, we assume you accept these terms and conditions in full. Do not continue to use maxburn page website if you do not accept all the terms and conditions stated on this page.

The following terminology is applicable to these Terms and Conditions, Privacy Statement and Disclaimer Notice and any or all Agreements:

"Client", "You" and "Your" that refers to you, the person accessing this website and accepting the Company's terms and conditions shall wholly be compared to the Company.
"The Company", "Ourselves", "We", "Our" and "Us" this means the main company "Company you buy with couponand support" or in other words "Party", "Parties", or "Us" this may be the Client and ourselves or it could be one of us.
All terms refer to the offer, acceptance, and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate matter if any use of the above terminology or other words is the result of that information. The activities carried out through formal meetings with a fixed duration or any other means verbal, by the exchange of commodities and services which are known by their new company (stated).

The action should incorporate the provisions of the Company's stated services/products as provided by the prevailing law of. Whether the user is in a singular, plural, capitalization or not he/she/they, will be interchangeable and thus referring to the same thing.

Cookies
We employ the use of cookies. By using maxburn page website you consent to the use of cookies in accordance with maxburn page privacy policy. Most of the modern day interactive web sites use cookies to enable us to retrieve user details for each visit.

Cookies are used in some areas of our site to enable the functionality of this area and ease of use for those people visiting. Some of our affiliate/advertising partners may also use cookies.

License
Unless otherwise stated, maxburn page and/or it’s licensors own the intellectual property rights for all material on maxburn pages. All intellectual property rights are reserved. You may view and/or print pages from WEBSITE LINK for your own personal use subject to restrictions set in these terms and conditions.

You must not:
Republish material from WEBSITE LINK
Sell, rent or sub-license material from WEBSITE LINK
Reproduce, duplicate or copy material from WEBSITE LINK
Redistribute content from CeylonPages (unless content is specifically made for redistribution).
User Comments
Certain organizations may link to our website without prior approval, including government agencies, search engines, news outlets, and online directories. These links must not be misleading, falsely imply endorsement, or be out of context. We may also approve links from consumer groups, charity organizations, business associations, internet portals, law and consulting firms, and educational institutions if they meet our criteria. Links must not harm our reputation, come from organizations with poor records, or be misleading. Approved links should align with general resource information or editorial content.

Reservation of Rights
We reserve the right at any time and in its sole discretion to request that you remove all links or any link to our Web site. You agree to immediately remove all links to our Web site upon such request. We also reserve the right to amend these terms and conditions and its linking policy at any time. By continuing to link to our Web site, you agree to be bound to and abide by these linking terms and conditions.

Removal of links from our website
If you find any link on our Web site or any linked web site objectionable for any reason, you may contact us about this. We will consider requests to remove links but will have no obligation to do so or to respond directly to you. Whilst we endeavor to ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we commit to ensuring that the website remains available or that the material on the website is kept up to date.

Content Liability
We shall have no responsibility or liability for any content appearing on your Web site. You agree to indemnify and defend us against all claims arising out of or based upon your Website. No link(s) may appear on any page on your Web site or within any context containing content or materials that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.

Disclaimer
We exclude all warranties and guarantees related to our website as much as the law allows, including those about quality, fitness for purpose, and reasonable care. However, this disclaimer does not limit or exclude liability for death, personal injury from negligence, fraud, or anything else that cannot legally be limited or excluded.

Are subject to the preceding paragraph
Govern all liabilities arising under the disclaimer or in relation to the subject matter of this disclaimer, including liabilities arising in contract, in tort (including negligence) and for breach of statutory duty. To the extent that the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature
Credit & Contact Information If you have any questions or queries regarding any of our terms, please contact us by emailing maxburn@gmali.com''',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Back", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
