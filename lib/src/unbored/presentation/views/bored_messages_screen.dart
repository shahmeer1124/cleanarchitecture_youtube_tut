import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproj/core/extensions/extensions.dart';
import 'package:testproj/core/res/colors_constants.dart';
import 'package:testproj/src/unbored/presentation/bloc/bored_api_bloc.dart';

class BoredMessagesScreen extends StatelessWidget {
  const BoredMessagesScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colours.blueColor,
        title: Text(
          'Bored App',
          style: appStyle(18, Colors.black, FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<BoredApiBloc, BoredApiState>(
              builder: (context, state) {
                final isLoading = state is LoadingState;

                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
                      height: MediaQuery.of(context).size.height * 0.78,
                      width: MediaQuery.of(context).size.width,
                      child: Builder(
                        builder: (BuildContext context) {
                          if (state is MessageReceivedState) {
                            return Center(
                              child: Column(
                                children: [
                                  Text(
                                    state.boredModel.activity,
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                  Text(
                                    state.boredModel.type,
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                  Text(
                                    state.boredModel.link == ''
                                        ? 'link not provided'
                                        : state.boredModel.link,
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                  Text(
                                    state.boredModel.key,
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                  Text(
                                    state.boredModel.participants.toString(),
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                  Text(
                                    state.boredModel.accessibility.toString(),
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                  Text(
                                    state.boredModel.price.toString(),
                                    style: appStyle(
                                        18, Colors.white, FontWeight.bold,),
                                  ),
                                ],
                              ),
                            );
                          } else if (state is ErrorState) {
                            return Center(
                              child: Text(
                                'Error: ${state.message}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,),
                              ),
                            );
                          } else if (state is BoredApiInitial) {
                            return Center(
                              child: Text(
                                'Press the button below to get a message...',
                                style:
                                    appStyle(18, Colors.white, FontWeight.bold),
                              ),
                            );
                          } else {
                            return const Center();
                          }
                        },
                      ),
                    ),
                    if (isLoading) ...[
                      const Positioned.fill(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),

            GestureDetector(
              onTap: () {
                context.read<BoredApiBloc>().add(GetMessageEvent());
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colours.blueColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                margin: EdgeInsets.only(
                  left: context.width * 0.05,
                  right: context.width * 0.05,
                  bottom: context.height * 0.05,
                ),
                height: context.height * 0.08,
                width: context.width,
                child: Center(
                  child: Text(
                    'Get Message',
                    style: appStyle(18, Colors.black, FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
