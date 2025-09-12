import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/ProfilesService/ProfilesService.dart';
import 'package:swfl/ui/auth/Login/login_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Gstprofilescreen extends ConsumerStatefulWidget {
  const Gstprofilescreen({super.key});

  @override
  ConsumerState<Gstprofilescreen> createState() => _GstprofilescreenState();
}

class _GstprofilescreenState extends ConsumerState<Gstprofilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gst Profiles"),
      ),
      body: ref.watch(gstProfileProvider).when(
          data: (data) => (data.data ?? []).isEmpty
              ? Center(child: emptyData())
              : ListView(
                  padding: Pad(all: 10),
                  children: [
                    ListView.builder(
                        itemCount: data.data?.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var gstData = data.data?[index];

                          return Column(
                            children: [
                              ElevarmTextInputField(
                                label: 'Gst Number',
                                hintText: '${gstData?.gstNumber}',
                                suffixIconAssetName: Icons.email,
                                onTapSuffix: null,
                                errorText: null,
                                isRequired: true,
                                inputFormatters: [UpperCaseTextFormatter()],
                                enabled: false,
                              ),
                          
                               ElevarmTextInputField(
                                label: 'State',
                                hintText: '${gstData?.stateName}',
                                suffixIconAssetName: Icons.location_city,
                                onTapSuffix: null,
                                errorText: null,
                                isRequired: true,
                                inputFormatters: [UpperCaseTextFormatter()],
                                enabled: false,
                              ),
                                  ElevarmTextInputField(
                                label: 'Address',
                                hintText: '${gstData?.address}',
                                suffixIconAssetName: Icons.location_city,
                                onTapSuffix: null,
                                errorText: null,
                                maxLines: 5,
                                isRequired: true,
                                inputFormatters: [UpperCaseTextFormatter()],
                                enabled: false,
                              ),
                            ],
                          );
                        })
                  ],
                ),
          error: (e, s) => Container(),
          loading: () => Center(
                child: defaultLoader(),
              )),
    );
  }
}
