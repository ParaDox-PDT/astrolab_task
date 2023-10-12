import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/product/product_bloc.dart';
import 'package:flutter_defualt_project/data/models/product/product_model.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/home/subscreens/add_product/widgets/universal_textfield.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: Column(
                    children: [
                      UniversalTextField(
                          title: "Product Name",
                          controller: nameController,
                          textInputType: TextInputType.text),
                      20.ph,
                      UniversalTextField(
                        title: "Product Count",
                        controller: countController,
                        textInputType: TextInputType.number,
                        maskFormatter: maskFormatter,
                      ),
                      20.ph,
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.c_7CB1FF.withOpacity(0.05)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.read<ProductBloc>().qrCode,
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, RouteNames.qr);
                                },
                                icon: Icon(Icons.qr_code),
                                color: AppColors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      60.ph,
                      ElevatedButton(
                          onPressed: () {
                            if (nameController.text.isNotEmpty &&
                                countController.text.isNotEmpty &&
                                context.read<ProductBloc>().qrCode.isNotEmpty) {
                              context.read<ProductBloc>().add(ProductAddEvent(
                                  productModel: ProductModel(
                                      name: nameController.text,
                                      createdAt: DateTime.now().toString(),
                                      count: int.parse(countController.text),
                                      qrCode:
                                          context.read<ProductBloc>().qrCode)));
                            } else {
                              showErrorMessage(
                                  message: "Something wrong", context: context);
                            }
                          },
                          child: Text("ADD product"))
                    ],
                  ))
            ],
          );
        },
        listener: (context, state) {
          if (state is ProductQrCodeChange) {
            setState(() {});
          }
          if (state is ProductSuccessAdd) {
            context.read<ProductBloc>().add(ProductQrCodeChange(qrCode: ""));
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Product success add")));
          }
        },
      ),
    );
  }
}
