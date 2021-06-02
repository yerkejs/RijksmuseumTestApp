import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yerke_test_app/core/presentation/error_ui_handler.dart';
import 'package:yerke_test_app/core/widgets/views/error_widget.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/detail_screen.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/cubit/main_cubit.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/cubit/main_state_status.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/widgets/collection_item.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/widgets/loading_view.dart';

import '../../../../locator.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  /// MARK: - Props

  late final ScrollController _scrollController;
  late final MainCubit _mainCubit;

  /// MARK: - Life-Cycle

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// MARK: - Building UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Main"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: BlocProvider<MainCubit>(
          create: (_) {
            _mainCubit = sl<MainCubit>()..loadArtObjects();
            return _mainCubit;
          },
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                child: BlocConsumer<MainCubit, MainScreenState>(
                  listener: (BuildContext context, MainScreenState state) {
                    state.status.maybeWhen(
                      failure: (String? errorMessage) {
                        ErrorHandler.showErrorUI(context, error: errorMessage!);
                      },
                      orElse: () {}
                    );
                  },
                  builder: (BuildContext context, MainScreenState state) {
                    if (state.status is ErrorDetails && state.artObjects.length == 0) {
                      return Center(
                        child: AppErrorWidget(errorMessage: (state.status as ErrorDetails).message!),
                      );
                    }
                    
                    return GridView.builder(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0
                      ), 
                      itemCount: state.hasReachedMax 
                        ? state.artObjects.length
                        : state.artObjects.length + 3,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= state.artObjects.length) {
                          return LoadingView();
                        } else {
                          ArtObject artObject = state.artObjects[index];
                          return CollectionItem(
                            artObject: artObject,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(
                                objectNumber: artObject.objectNumber,
                              )));
                            },
                          );
                        }
                      }
                    );
                  }, 
                ),
              );
            }
          )
        )
      )
    );
  }


  // MARK: - UI Helper Methods

  /// Event method, which is called when listView is scrolled
  void _onScroll () {
    if (_isScrollToTheBottom && _mainCubit.state.status != MainScreenStatus.loading()) 
      _mainCubit.loadArtObjects();
  }


  bool get _isScrollToTheBottom {
    
    /// If no one [ScrollPosition] objects was attached, then automatically false 
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    
    /// [_isScrollToTheBottom] is [true] when user scrolls to the 70% of the content 
    return currentScroll >= (maxScroll * 0.7);
  }
}
