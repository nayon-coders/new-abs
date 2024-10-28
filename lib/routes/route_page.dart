import 'package:abs_office_management/data/binding/costing_binding.dart';
import 'package:abs_office_management/data/binding/employee_manage_binding.dart';
import 'package:abs_office_management/data/binding/loss_profit_binding.dart';
import 'package:abs_office_management/data/binding/partner_management_binding.dart';
import 'package:abs_office_management/data/binding/salary_manage_binding.dart';
import 'package:abs_office_management/data/binding/sales_binding.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/auth/register_screen.dart';
import 'package:abs_office_management/view/auth/welcome_screen.dart';
import 'package:abs_office_management/view/employee_management/screen/add_employee.dart';
import 'package:abs_office_management/view/employee_management/screen/employee_management.dart';
import 'package:abs_office_management/view/employee_management/screen/single_employee.dart';
import 'package:abs_office_management/view/loss_profit/loss_profit.dart';
import 'package:abs_office_management/view/partner_management/screen/partner_management.dart';
import 'package:abs_office_management/view/salery_management/screen/salary_management.dart';
import 'package:abs_office_management/view/salery_management/screen/add_paid_salary.dart';
import 'package:abs_office_management/view/settings/screen/add_employee_position_view.dart';
import 'package:abs_office_management/view/settings/screen/business_setup.dart';
import 'package:abs_office_management/view/settings/screen/change_password.dart';
import 'package:abs_office_management/view/settings/screen/creditcard_processing_fee.dart';
import 'package:abs_office_management/view/settings/screen/tax_and_state.dart';
import 'package:abs_office_management/view/settings/setting_screen.dart';
import 'package:abs_office_management/view/today_sales_management/screen/add_cost.dart';
import 'package:abs_office_management/view/today_sales_management/screen/add_food_cost.dart';
import 'package:abs_office_management/view/today_sales_management/screen/add_today_sales.dart';
import 'package:abs_office_management/view/today_sales_management/screen/manage_costing.dart';
import 'package:abs_office_management/view/today_sales_management/screen/today_sales_management.dart';
import 'package:abs_office_management/view/today_sales_management/screen/view_sales_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/binding/food_cost_binding.dart';
import '../data/binding/setting.binding.dart';
import '../data/binding/tax_binding.dart';
import '../data/middleware/auth_middleware.dart';
import '../view/auth/forgot_password/forgot_screen.dart';
import '../view/dashboard_screen/dash_board_screen.dart';
import '../view/settings/screen/online.sales.platform.dart';

class RoutePage{
  static List<GetPage<dynamic>> routes=[
    GetPage(
        name: AppRoute.welcome,
        page: ()=>const WelcomeScreen(),
        middlewares: [AuthMiddleware()]
    ),

    GetPage(
        name: AppRoute.login,
        page: ()=> LoginScreen(),
        //middlewares: [AuthMiddleware()]
    ),

    GetPage(
      name: AppRoute.register,
      page: ()=>  RegisterScreen(),
    ),
    GetPage(
      name: AppRoute.forgotEmail,
      page: ()=>  ForgotScreen(),
    ),
    GetPage(
      name: AppRoute.dashBoard,
      page: ()=>  DashBoardScreen(),
    ),

    GetPage(
      name: AppRoute.setting,
      page: ()=>  SettingScreen(),
    ),

    GetPage(
        name: AppRoute.textAndState,
        page: ()=>  TaxAndState(),
        binding: TaxBinding()
    ),

    GetPage(
      name: AppRoute.onlineSellPlatform,
      page: ()=>  OnlineSalesPlatform(),
      binding: SettingBinding()
    ),

    GetPage(
        name: AppRoute.employeePosition,
        page: ()=>  AddEmployeePositionView(),
        binding: SettingBinding()
    ),

    GetPage(
        name: AppRoute.creditCard,
        page: ()=>  CreditcardProcessingFee(),
        binding: SettingBinding()
    ),
    GetPage(
        name: AppRoute.adminPassword,
        page: ()=> ChangePassword(),
        binding: SettingBinding()
    ),
    GetPage(
          name: AppRoute.salesManageScree,
          page: ()=> TodaySalesManagement(),
          bindings: [ SalesBinding(), CostingBinding(), FoodCostBinding() ]
      ),
    GetPage(
          name: AppRoute.addTodaySalesScreen,
          page: ()=> AddTodaySales(),
          bindings: [SalesBinding(), TaxBinding()]
      ),
    GetPage(
        name: AppRoute.vieSalesReport,
        page: ()=> ViewSalesReport(),
        bindings: [SalesBinding()]
    ),
    GetPage(
        name: AppRoute.lossProfit,
        page: ()=> LossProfit(),
        binding: LossProfitBinding()
    ),
    GetPage(
        name: AppRoute.employeeManageScree,
        page: ()=> EmployeeManagement(),
        binding: EmployeeManageBinding()
    ),
    GetPage(
        name: AppRoute.addEmployeeScreen,
        page: ()=> AddEmployee(),
        binding: EmployeeManageBinding()
    ),
    GetPage(
        name: AppRoute.singleEmployeeScreen,
        page: ()=> SingleEmployee(),
        binding: EmployeeManageBinding()
    ),

    //salary management
    GetPage(
        name: AppRoute.salaryManagementScree,
        page: ()=> SalaryManagement(),
        binding: SalaryManageBinding()
    ),
    GetPage(
        name: AppRoute.addPaidSalary,
        page:()=>AddPaidSalary(),
      binding: SalaryManageBinding()
    ),

    GetPage(
        name: AppRoute.partnerManagementScreen,
        page: ()=> PartnerManagement(),
        binding: PartnerManagementBinding()
    ),
      GetPage(
            name: AppRoute.businessSetup,
            page: ()=> BusinessSetup(),
            binding: SettingBinding()
        ),
      GetPage(
                name: AppRoute.addCosting,
                page: ()=> AddCost(),
                binding: CostingBinding()
            ),
      GetPage(
                name: AppRoute.manageCostingList,
                page: ()=> ManageCosting(),
                binding: CostingBinding()
            ),
   GetPage(
        name: AppRoute.addFoodCost,
        page: ()=> AddFoodCost(),
        binding: FoodCostBinding()
    ),

  ];
}