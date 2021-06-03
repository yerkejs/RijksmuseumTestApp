import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yerke_test_app/core/presentation/color_utils.dart';
import 'package:yerke_test_app/core/presentation/error_ui_handler.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/cubit/details_screen_cubit.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/widgets/details_footer.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/widgets/details_header.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/widgets/details_info.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/widgets/details_items_view.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

import '../../../locator.dart';
import 'cubit/details_screen_status.dart';

class DetailScreen extends StatelessWidget {
  
  /// MARK: - Props

  /// Object Number of the art object, used to load details using it 
  final String objectNumber;
  
  /// MARK: - Constructor

  DetailScreen({
    required this.objectNumber
  });

  /// MARK: - UI 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Art object"),
      ),
      body: SafeArea(
        child: BlocProvider<DetailsScreenCubit>(
          create: (_) => sl<DetailsScreenCubit>()..loadArtObjectDetails(objectNumber),
          child: BlocConsumer<DetailsScreenCubit, DetailsScreenState>(
            listener: (_, DetailsScreenState state) {
              state.status.maybeWhen(
                failure: (String? errorMessage) {
                  ErrorHandler.showErrorUI(context, error: errorMessage!);
                  Navigator.of(context).pop();
                },
                orElse: () {}
              );
            },
            builder: (BuildContext context, DetailsScreenState state) {
              if (state.status == DetailsScreenStatus.loading()) {
                return Center(child: CircularProgressIndicator(),);
              }

              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DetailsHeader(
                        title: state.artObjectDetailed?.title ?? "",
                        headerImage: state.artObjectDetailed?.webImage,
                      ),
                      DetailsInfoWidget(
                        subtitle: state.artObjectDetailed?.subtitle ?? "",
                        description: state.artObjectDetailed?.description ?? "",
                        colors: (state.artObjectDetailed?.colors ?? [])
                          .map<Color>((e) => ColorUtil.fromHex(e.colorHex))
                          .toList(),
                      ),
                      DetailsMoreWidget(
                        title: "Type",
                        items: state.artObjectDetailed?.objectTypes 
                      ),
                      _buildDivider(context),
                      DetailsMoreWidget(
                        title: "Collection",
                        items: state.artObjectDetailed?.objectCollection 
                      ),
                      _buildDivider(context),
                      DetailsMoreWidget(
                        title: "Principal makers",
                        items: (state.artObjectDetailed?.principalMakers ?? [])
                          .map((e) => e.name)
                          .toList()
                      ),
                      _buildDivider(context),
                      DetailsMoreWidget(
                        title: "Materials",
                        items: state.artObjectDetailed?.materials
                      ),
                      _buildDivider(context),
                      DetailsMoreWidget(
                        title: "Historical people",
                        items: state.artObjectDetailed?.historicalPersons 
                      ),
                      _buildDivider(context),
                      DetailsFooter(
                        artLinks: state.artObjectDetailed?.links ?? ArtLinks()
                      ),
                    ],
                  ),
                ),
              );
            }, 
          ),
        )
      ),
    );
  }

  /// Retursn Divider widget of grey color
  Widget _buildDivider (BuildContext context) => Divider(
    color: Theme.of(context).dividerColor,
  );
}