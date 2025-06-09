import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_bloc.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_state.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';
import 'package:resume/src/feature0ne_introduction/widget/url_lancer.dart';
import 'package:resume/utils/app_text_style.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:resume/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../widget/into_body_url.dart';
import 'image/database_manager.dart';
import '../widget/intro_body.dart';
import 'image/image_view.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'masrafianam@gmail.com',
      query:
          'subject=Email Subject&body=Email Body', //add subject and body here if you want
    );

    final url = params.toString();
    if (await canLaunch(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhoneDialer() async {
    final Uri params = Uri(
      scheme: 'tel',
      path: '+8801717374348',
    );

    final url = params;
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        if (state is IntroLoaded) {
          List<IntroModel> data = state.mydata;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              'Hi,',
                              style: AppTextStyle.nameStyle()
                                  .copyWith(fontSize: 30, color: CALYPSO_COLOR),
                            ),
                          ),
                          // Text(
                          //   "I am ${data[index].name}",
                          //   style: AppTextStyle.nameStyle(),
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: 'I am ',
                                  style: AppTextStyle.nameStyle().copyWith(
                                      fontSize: 20, color: PRIMARY_COLOR),
                                ),
                                TextSpan(
                                  text: '${data[index].name}',
                                  style: AppTextStyle.nameStyle().copyWith(
                                      fontSize: 30, color: TITLECOLOR),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Senior Mobile Application Engineer",
                            style: AppTextStyle.nameStyle().copyWith(
                                color: DEFAULT_TEXT_COLOR,
                                fontSize: 25,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    if (await canLaunchUrl(
                                        Uri.parse(data[index].github))) {
                                      await launchUrl(
                                          Uri.parse(data[index].github));
                                    } else {
                                      throw 'Could not launch ${data[index].github}';
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/github.png',
                                    height: 30,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    if (await canLaunchUrl(
                                        Uri.parse(data[index].linkedIn))) {
                                      await launchUrl(
                                          Uri.parse(data[index].linkedIn));
                                    } else {
                                      throw 'Could not launch ${data[index].linkedIn}';
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/linkedin.png',
                                    height: 25,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: _launchEmail,
                                  child: Image.asset(
                                    'assets/email.png',
                                    height: 25,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: _launchPhoneDialer,
                                  child: Image.asset(
                                    'assets/phone.png',
                                    height: 30,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ImageView(),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    ],
                  ),

                  // GestureDetector(
                  // onTap: _launchPhoneDialer,
                  // child: IntroBody(head: 'Mobile',title: data[index].mobile,)),
                  // GestureDetector(
                  // onTap: _launchEmail,
                  // child: IntroBody(head: 'Email',title: data[index].email,),
                  // ),
                  // IntroBodyUrl(head: 'Skype',title: data[index].skype,),
                  // IntroBodyUrl(head: 'Linkedin',title: data[index].linkedIn,),
                ],
              );
            },
          );
        } else if (state is IntroLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
