import 'package:flutter/material.dart';
import 'Student/sign_in_screen.dart';
import 'Student/sign_up_screen_1.dart';
import 'Student/sign_up_screen_2.dart';
import 'Student/dashboard_screen.dart';
import 'Student/Settings/settings_screen.dart';
import 'Student/Settings/change_password_screen.dart';
import 'Student/Settings/feedback_screen.dart';
import 'Student/Settings/terms_conditions_screen.dart';
import 'Student/Profile/profile_screen.dart';
import 'Student/Profile/edit_name_screen.dart';
import 'Student/Profile/edit_email_screen.dart';
import 'Student/Profile/edit_address_screen.dart';
import 'Student/room_selection_screen.dart';
import 'Student/room_allocation_form_screen.dart';
import 'Student/food_screen.dart';
import 'Student/mess_attendance_screen.dart';
import 'Student/mess_sheet_screen.dart';
import 'Student/hostel_issues_screen.dart';
import 'Student/hostel_issues_confirmation_screen.dart';
import 'Student/health_issues_screen.dart';
import 'Student/payment_selection_screen.dart';
import 'Student/hostel_fine_payment_screen.dart';
import 'Student/mess_bill_payment_screen.dart';
import 'Student/outings_leave_screen.dart';
import 'Student/notifications_screen.dart';
import 'Student/tasks_screen.dart'; // Fixed typo: tasks_screen.dart to task_screen.dart
import 'Maintainer/sign_in_screen.dart' as MaintainerSignIn;
import 'Maintainer/sign_up_screen.dart' as MaintainerSignUp;
import 'Maintainer/role_selection_screen.dart';
import 'Maintainer/ComplaintOfficer/complaint_officer_dashboard_screen.dart';
import 'Maintainer/ComplaintOfficer/tasks_completed_screen.dart';
import 'Maintainer/ComplaintOfficer/current_issues_screen.dart';
import 'Maintainer/Dispensar/dispensar_dashboard_screen.dart';
import 'Maintainer/Dispensar/tasks_completed_screen.dart' as DispensarTasksCompleted;
import 'Maintainer/Dispensar/current_issues_screen.dart' as DispensarCurrentIssues;
import 'Maintainer/RT/residential_tutor_dashboard_screen.dart';
import 'Maintainer/RT/leaving_permission_screen.dart';
import 'Maintainer/RT/room_allocation_screen.dart';
import 'Maintainer/RT/room_allocation_form_screen.dart' as MaintainerRoomAllocationForm;
import 'Maintainer/MessWorker/mess_worker_dashboard_screen.dart';
import 'Maintainer/MessWorker/menu_screen.dart';
import 'Maintainer/MessWorker/mess_sheet_screen.dart' as MaintainerMessSheetScreen;
import 'Maintainer/MessWorker/mess_bill_screen.dart';
import 'Maintainer/MaintainerProfile/profile_screen.dart' as MaintainerProfile;
import 'Maintainer/MaintainerProfile/edit_name_screen.dart' as MaintainerEditName;
import 'Maintainer/MaintainerProfile/edit_email_screen.dart' as MaintainerEditEmail;
import 'Maintainer/MaintainerProfile/edit_address_screen.dart' as MaintainerEditAddress;
import 'Maintainer/MaintainerSettings/settings_screen.dart' as MaintainerSettings;
import 'Maintainer/MaintainerSettings/change_password_screen.dart' as MaintainerChangePassword;
import 'Maintainer/MaintainerSettings/feedback_screen.dart' as MaintainerFeedback;
import 'Maintainer/MaintainerSettings/terms_conditions_screen.dart' as MaintainerTermsConditions;
import 'Maintainer/maintainer_notifications_screen.dart';
import 'splash_screen.dart';
import 'onboarding_screen.dart';
import 'login_selection_screen.dart';

void main() {
  runApp(const HostelApp());
}

class HostelApp extends StatelessWidget {
  const HostelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UETT Hostel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login_selection': (context) => const LoginSelectionScreen(),
        '/student/sign_in': (context) => const SignInScreen(),
        '/student/sign_up_1': (context) => const SignUpScreen1(),
        '/student/sign_up_2': (context) => const SignUpScreen2(),
        '/student/dashboard': (context) => const DashboardScreen(),
        '/student/settings': (context) => const SettingsScreen(),
        '/student/settings/change_password': (context) => const ChangePasswordScreen(),
        '/student/settings/feedback': (context) => const FeedbackScreen(),
        '/student/settings/terms_conditions': (context) => const TermsConditionsScreen(),
        '/student/profile': (context) => const ProfileScreen(),
        '/student/profile/edit_name': (context) => const EditNameScreen(),
        '/student/profile/edit_email': (context) => const EditEmailScreen(),
        '/student/profile/edit_address': (context) => const EditAddressScreen(),
        '/student/room_selection': (context) => const RoomSelectionScreen(),
        '/student/room_allocation_form': (context) => const RoomAllocationFormScreen(),
        '/student/food': (context) => const FoodScreen(),
        '/student/mess_attendance': (context) => const MessAttendanceScreen(),
        '/student/mess_sheet': (context) => MessSheetScreen(),
        '/student/hostel_issues': (context) => const HostelIssuesScreen(),
        '/student/hostel_issues_confirmation': (context) => const HostelIssuesConfirmationScreen(),
        '/student/health_issues': (context) => const HealthIssuesScreen(),
        '/student/payment_selection': (context) => const PaymentSelectionScreen(),
        '/student/hostel_fine_payment': (context) => const HostelFinePaymentScreen(),
        '/student/mess_bill_payment': (context) => const MessBillPaymentScreen(),
        '/student/outings_leave': (context) => const OutingsLeaveScreen(),
        '/student/notifications': (context) => const NotificationsScreen(),
        '/student/task': (context) => const TaskScreen(),
        '/maintainer/sign_in': (context) => const MaintainerSignIn.SignInScreen(),
        '/maintainer/sign_up': (context) => const MaintainerSignUp.SignUpScreen(),
        '/maintainer/role_selection': (context) => const MaintainerRoleSelectionScreen(),
        '/maintainer/complaint_officer/dashboard': (context) => const ComplaintOfficerDashboardScreen(),
        '/maintainer/complaint_officer/tasks_completed': (context) => const TasksCompletedScreen(),
        '/maintainer/complaint_officer/current_issues': (context) => const CurrentIssuesScreen(),
        '/maintainer/dispensar/dashboard': (context) => const DispensarDashboardScreen(),
        '/maintainer/dispensar/tasks_completed': (context) => const DispensarTasksCompleted.DispensarTasksCompletedScreen(),
        '/maintainer/dispensar/current_issues': (context) => const DispensarCurrentIssues.DispensarCurrentIssuesScreen(),
        '/maintainer/residential_tutor/dashboard': (context) => const ResidentialTutorDashboardScreen(),
        '/maintainer/residential_tutor/leaving_permission': (context) => const LeavingPermissionScreen(),
        '/maintainer/residential_tutor/room_allocation': (context) => const RoomAllocationScreen(),
        '/maintainer/residential_tutor/room_allocation_form': (context) => const RoomAllocationFormScreen(),
        '/maintainer/mess_worker/dashboard': (context) => const MessWorkerDashboardScreen(),
        '/maintainer/mess_worker/menu': (context) => const MenuScreen(),
        '/maintainer/mess_worker/mess_sheet': (context) => MaintainerMessSheetScreen.MaintainerMessSheetScreen(),
        '/maintainer/mess_worker/mess_bill': (context) => MessBillScreen(),
        '/maintainer/profile': (context) => const MaintainerProfile.MaintainerProfileScreen(),
        '/maintainer/profile/edit_name': (context) => const MaintainerEditName.EditNameScreen(),
        '/maintainer/profile/edit_email': (context) => const MaintainerEditEmail.EditEmailScreen(),
        '/maintainer/profile/edit_address': (context) => const MaintainerEditAddress.EditAddressScreen(),
        '/maintainer/settings': (context) => const MaintainerSettings.MaintainerSettingsScreen(),
        '/maintainer/settings/change_password': (context) => const MaintainerChangePassword.MaintainerChangePasswordScreen(),
        '/maintainer/settings/feedback': (context) => const MaintainerFeedback.MaintainerFeedbackScreen(),
        '/maintainer/settings/terms_conditions': (context) => const MaintainerTermsConditions.MaintainerTermsConditionsScreen(),
        '/maintainer/notifications': (context) => const MaintainerNotificationsScreen(),
      },
    );
  }
}