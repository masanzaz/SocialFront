import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/intro/model/intro_data_model.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class IntroPagerWidget extends StatefulWidget {
  @override
  _IntroPagerWidgetState createState() => _IntroPagerWidgetState();
}

class _IntroPagerWidgetState extends State<IntroPagerWidget> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _list = IntroDataModel.items();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 1,
            child: PageView.builder(
              itemCount: _list.length,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return _itemView(_list[index]);
              },
              onPageChanged: (int index) {
                _currentPageNotifier.value = index;
              },
            ),
          ),
        ),
        _buildCircleIndicator()
      ],
    );
  }

  Widget _itemView(IntroDataModel dataModel) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: assetImage(dataModel.image),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              dataModel.title,
              style: textStylePrimary(context, FontWeight.bold, 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              dataModel.subtitle,
              style: textStyleAccent(context, FontWeight.normal, 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  _buildCircleIndicator() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: _list.length,
          dotColor: Colors.grey.withOpacity(0.2),
          selectedDotColor: Theme.of(context).primaryColor,
          currentPageNotifier: _currentPageNotifier,
        ),
      );
}
