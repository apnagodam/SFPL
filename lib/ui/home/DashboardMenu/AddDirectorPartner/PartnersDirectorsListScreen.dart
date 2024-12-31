import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/PartnersDIrectorsService/PartnersDirectorsService.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

var isVisible = StateProvider((ref) => false);

class Partnersdirectorslistscreen extends ConsumerStatefulWidget {
  const Partnersdirectorslistscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PartnersdirectorslistscreenState();
}

class _PartnersdirectorslistscreenState
    extends ConsumerState<Partnersdirectorslistscreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? ""}') ==
                  4
              ? 'Directors'
              : int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? ""}') ==
                      3
                  ? "Partners"
                  : "",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Adaptive.sh(5)),
          child: Container(
            color: ColorsConstant.primaryColor,
            padding: const Pad(all: 10),
            child: IntrinsicHeight(
              child: Row(children: [
                Expanded(
                    child: Text(
                  "Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Phone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "PanCard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Status",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
              ]),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [directorsListLayout()],
      ),
    );
  }

  directorsListLayout() {
    return ColumnSuper(children: [
      ref.watch(directorsPartnersListProvider).when(
          data: (data) {
            return Column(
              children: [
                ListView.builder(
                  itemCount: data.data?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    color: index % 2 == 0
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                    padding: const Pad(all: 10),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text: "${data.data?[index].name ?? '--'}",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "${data.data?[index].phone ?? "--"}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text: "${data.data?[index].pancardNo ?? "--"}",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        data.data?[index].verify.toString() == "0"
                            ? Expanded(
                                child: Text.rich(
                                TextSpan(
                                    text: "Edit",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.goNamed(
                                            RoutesStrings.editDirectorPartner,
                                            extra: data.data![index]);
                                      }),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(14)),
                              ))
                            : Expanded(
                                child: Text.rich(
                                TextSpan(text: "Verified"),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsConstant.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(14)),
                              )),
                      ]),
                    ),
                  ),
                ),
                Visibility(
                    visible: (int.parse(
                            "${ref.watch(sharedUtilityProvider).getUser()?.partnerDirectorCount ?? 0}") >
                        (data.data?.length ?? 0)),
                    child: Padding(
                      padding: Pad(all: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            context.goNamed(RoutesStrings.addDirectorPartner);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsConstant.secondColorDark,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? ""}') ==
                                    4
                                ? 'Add Directors'
                                : int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? ""}') ==
                                        3
                                    ? "Add Partners"
                                    : "",
                            style: TextStyle(
                                color: Colors.white,
                                shadows: [
                                  const Shadow(
                                      color: Colors.white, blurRadius: 0.3)
                                ],
                                fontWeight: FontWeight.w700,
                                fontSize: Adaptive.sp(16)),
                          ),
                        ),
                      ),
                    ))
              ],
            );
          },
          error: (e, s) => Container(),
          loading: () => defaultLoader()),
    ]);
  }
}
