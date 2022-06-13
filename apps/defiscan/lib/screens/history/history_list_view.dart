import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:defiscan/theme/app_theme.dart';
import 'package:defiscan/models/history.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView(
      {Key key,
        this.accountData,
        this.animationController,
        this.animation,
        this.callback})
      : super(key: key);

  final VoidCallback callback;
  final HistoryListData accountData;
  final AnimationController animationController;
  final Animation<double> animation;

  String getTime (String dateTime){
    DateTime time = DateTime.parse(dateTime);
    return timeago.format(time);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: callback,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              color: AppTheme.buildLightTheme()
                                  .backgroundColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8, bottom: 8, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              accountData.account ?? '',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                              ),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Text(
                                                '${accountData.address}' ,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    overflow: TextOverflow.ellipsis
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                accountData.username.contains('eth') ? Icon(Icons.verified_user, size: 13,) : Text(''),
                                                Text(
                                                  '${accountData.username}' ,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    // color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 3),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                // Icon(
                                                //   FontAwesomeIcons.arrowAltCircleRight,
                                                //   size: 12,
                                                //   color: AppTheme
                                                //       .buildLightTheme()
                                                //       .primaryColor,
                                                // ),
                                                Expanded(
                                                  child: Text(
                                                    '${accountData.balance ?? ''}',
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      // fontWeight: FontWeight.w600,
                                                      // color: AppTheme.buildLightTheme().primaryColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  getTime(accountData.timestamp),
                                                  // '${accountData!.timestamp}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: AppTheme.buildLightTheme().primaryColor,
                                                    fontSize: 20,
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
                          ],
                        ),
                        // Positioned(
                        //   top: 185,
                        //   right: 8,
                        //   child: Material(
                        //     color: Colors.transparent,
                        //     child: InkWell(
                        //       borderRadius: const BorderRadius.all(
                        //         Radius.circular(32.0),
                        //       ),
                        //       onTap: () {},
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Icon(
                        //           Icons.favorite_border,
                        //           color: AppTheme.buildLightTheme()
                        //               .primaryColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}