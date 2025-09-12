import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swfl/Domain/ProfilesService/ProfilesService.dart';
import 'package:swfl/ui/auth/Login/login_screen.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Businessprofile extends ConsumerStatefulWidget {
  const Businessprofile({super.key});

  @override
  ConsumerState<Businessprofile> createState() => _BusinessprofileState();
}

class _BusinessprofileState extends ConsumerState<Businessprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business profile'),
      ),
      body: ref.watch(businessProfileProvider).when(
          data: (data) {
          if(data.data==null){
              return Center(child: emptyData());
            }
            return ListView(
              padding: const Pad(all: 10),
              children: [
                ElevarmTextInputField(
                  label: 'Commodity',
                  hintText: '${data.data?.commodity}',
                  suffixIconAssetName: Icons.email,
                  onTapSuffix: null,
                  errorText: null,
                  isRequired: true,
                  inputFormatters: [UpperCaseTextFormatter()],
                  enabled: false,
                ),
                ElevarmTextInputField(
                  label: 'Summary',
                  hintText: '${data.data?.summery}',
                  suffixIconAssetName: Icons.summarize,
                  onTapSuffix: null,
                  errorText: null,
                  isRequired: true,
                  inputFormatters: [UpperCaseTextFormatter()],
                  enabled: false,
                ),
                ElevarmTextInputField(
                  label: 'District',
                  hintText: '${data.data?.district}',
                  suffixIconAssetName: Icons.location_city,
                  onTapSuffix: null,
                  errorText: null,
                  isRequired: true,
                  inputFormatters: [UpperCaseTextFormatter()],
                  enabled: false,
                ),
                ElevarmTextInputField(
                  label: 'State',
                  hintText: '${data.data?.state}',
                  suffixIconAssetName: Icons.location_city,
                  onTapSuffix: null,
                  errorText: null,
                  isRequired: true,
                  inputFormatters: [UpperCaseTextFormatter()],
                  enabled: false,
                ),
              ],
            );
          },
          error: (e, s) => Container(),
          loading: () => Center(
                child: defaultLoader(),
              )),
    );
  }
}
