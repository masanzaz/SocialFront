import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/presentation/components/widgets/ImagePreviewScreen.dart';
import 'package:dating/src/presentation/features/dashboard/dashbord_view.dart';
import 'package:dating/src/presentation/features/discover/discover_view.dart';
import 'package:dating/src/presentation/features/enableNotification/enable_notification_view.dart';
import 'package:dating/src/presentation/features/enterMobile/enter_mobile_view.dart';
import 'package:dating/src/presentation/features/gender/gender_selection_view.dart';
import 'package:dating/src/presentation/features/interest/interest_view.dart';
import 'package:dating/src/presentation/features/intro/intro_view.dart';
import 'package:dating/src/presentation/features/itsMatch/its_match_view.dart';
import 'package:dating/src/presentation/features/matches/matches_view.dart';
import 'package:dating/src/presentation/features/message/message_view.dart';
import 'package:dating/src/presentation/features/otp/otp_view.dart';
import 'package:dating/src/presentation/features/personDetail/person_detail_view.dart';
import 'package:dating/src/presentation/features/profile/profile_view.dart';
import 'package:dating/src/presentation/features/searchFriend/search_friends_view.dart';
import 'package:dating/src/presentation/features/signIn/sign_in_view.dart';
import 'package:flutter/cupertino.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return cupertinoPageRoute(IntroView(), settings);
      case AppRoutes.signIn:
        return cupertinoPageRoute(SignInView(), settings);
      case AppRoutes.enterMobile:
        return cupertinoPageRoute(EnterMobileView(), settings);
      case AppRoutes.otp:
        return cupertinoPageRoute(OtpView(), settings);
      case AppRoutes.profile:
        return cupertinoPageRoute(ProfileView(), settings);
      case AppRoutes.gender:
        return cupertinoPageRoute(GenderSelectionView(), settings);
      case AppRoutes.interest:
        return cupertinoPageRoute(InterestView(), settings);
      case AppRoutes.searchFriends:
        return cupertinoPageRoute(SearchFriendsView(), settings);
      case AppRoutes.enableNotification:
        return cupertinoPageRoute(EnableNotificationView(), settings);
      case AppRoutes.dashboard:
        return cupertinoPageRoute(DashBoardView(), settings);
      case AppRoutes.discover:
        return cupertinoPageRoute(DiscoverView(), settings);
      case AppRoutes.matches:
        return cupertinoPageRoute(MatchesView(), settings);
      case AppRoutes.messages:
        return cupertinoPageRoute(MessageView(), settings);
      case AppRoutes.itsMatch:
        return cupertinoPageRoute(ItsMatchView(), settings);
      case AppRoutes.personDetail:
        return cupertinoPageRoute(PersonDetailView(), settings);
      case AppRoutes.imagePreview:
        return cupertinoPageRoute(
            ImagePreviewScreen(image: settings.arguments as String), settings);
      default:
        return cupertinoPageRoute(IntroView(), settings);
    }
  }

  static CupertinoPageRoute cupertinoPageRoute(
      Widget materialPage, RouteSettings settings) =>
      CupertinoPageRoute(builder: (_) => materialPage, settings: settings);
}