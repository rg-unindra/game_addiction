import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_addiction/core/models/user.dart';
import 'package:game_addiction/core/provider/user_provider.dart';
import 'package:game_addiction/core/utils/constans.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';
import 'package:game_addiction/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FormIdentityPage extends ConsumerStatefulWidget {
  const FormIdentityPage({super.key});

  @override
  ConsumerState<FormIdentityPage> createState() => _FormIdentityPageState();
}

class _FormIdentityPageState extends ConsumerState<FormIdentityPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            leading: const DefaultBackButton(),
            flexibleSpace: SizedBox.expand(
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF6967C3),
                            Color(0xFF7837CE),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/bg_identity.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    width: size.width - 40,
                    child: SizedBox(
                      height: 24,
                      width: size.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(context.responsiveDoubleR(30)),
                          ),
                          color: theme.scaffoldBackgroundColor.withOpacity(.2),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 30,
                      width: size.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(context.responsiveDoubleR(30)),
                          ),
                          color: theme.scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Gemdic",
                      style: GoogleFonts.yesevaOne(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Masukkan Data Diri",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14).r(context),
            sliver: SliverToBoxAdapter(
              child: DefaultTextField(
                controller: _nameController,
                labelText: "Nama",
                hintText: "Masukkan Nama",
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14).r(context),
            sliver: SliverToBoxAdapter(
              child: DefaultTextField(
                labelText: "Usia",
                hintText: "Masukkan usia",
                controller: _ageController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r(context),
            sliver: SliverToBoxAdapter(
              child: DefaultButton(
                text: "Selanjutnya",
                onTap: () {
                  ref.read(userProvider.notifier).addUser(
                        User(
                          name: _nameController.text,
                          age: int.parse(_ageController.text),
                        ),
                      );
                  context.goNamed(Constans.question);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}