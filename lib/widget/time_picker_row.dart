import 'package:flutter/material.dart';
import 'package:weather_app/controllers/forecast_controller.dart';
import 'package:weather_app/utils/forecast_animation_utils.dart';

class TimePickerRow extends StatefulWidget {
  final List<String> tabItems;
  final ForecastController forecastController;
  final Function onTabChange;
  final int startIndex;
  final String randomString = "the widget object";

  const TimePickerRow({
    Key key,
    this.forecastController,
    this.tabItems,
    this.onTabChange,
    this.startIndex,
  }) : super(key: key);

  @override
  _TimePickerRowState createState() => _TimePickerRowState();
}

class _TimePickerRowState extends State<TimePickerRow>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int activeTab;
  int previousActiveTab;
  final String randomString = 'state object';

  @override
  void initState() {
    _tabController = TabController(
      //length sets the number of tabs
      length: AnimationUtil.hours.length,
      //length: 8,
      //we assigned the state object for vsync -- i don't exactly know what this parameter does
      vsync: this,
      //this sets the starting tab when the app starts -- in this case it is 0 which is passed from its parent forecast_page.dart
      initialIndex: widget.startIndex,
    );
    activeTabMonitor();
    _tabController.addListener(handleTabChange);
    print(context);
    super.initState();
  }

  void handleTabChange() {
    if (_tabController.indexIsChanging) {
      //print('is index changing in if block: ${_tabController.indexIsChanging}');

      return;
    }
    setState(() {
      this.activeTab = _tabController.index;
      this.previousActiveTab = _tabController.previousIndex;
      print('we went from tab ${previousActiveTab} to tab ${activeTab}');
    });

    widget.onTabChange(_tabController.index);
  }

  void activeTabMonitor() {
    print(widget.tabItems);
    //var tabs = widget.tabItems.map((t) => Text(t)).toList();
    //print(tabs);
    print(_tabController);
    print('this is the widget ${widget}');
    print('and this is what the "this" keyword refer to ${this}');
    print(this.mounted);
    // print();
// so besically the widget keyword refers to the widget that this state object is associated with
//and this refers to the state object itself

//SO IN ORDER TO ILLUSTRATE THAT LETS TAKE THE FOLLOWING  EXAMPLE
    print('===============');
    print(this.randomString); //should return state object

    print(widget.randomString);
    //should return the widget object
    print('=================');
    print('the start index is: ${widget.startIndex}');
  }

  @override
  void didUpdateWidget(TimePickerRow oldWidget) {
    _tabController.animateTo(widget.startIndex);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // you may want your selected and undelected tabs to have diffrent styles and color
      //you will do that by using the following 4 lines of code

      //this is for the selected tab the color and the style
      labelColor: Colors.black,
      labelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 12.0),
      //and this is for the unselected tab color and style
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle:
          Theme.of(context).textTheme.caption.copyWith(fontSize: 10.0),
      //by defualt there will be a line just undernith the tab we use the next line to make that line thing vanish
      indicatorColor: Colors.transparent,
      //this sets the padding bettwen tabs
      labelPadding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
      controller: _tabController,
      //this where you set the tabs
      //you set a list of widget where the length of this list equal to the controllers length property
      //in the code below we have sets the tabs programmatically but you could also set the widgets directly
      tabs: widget.tabItems.map((e) => Text(e)).toList(),
      isScrollable: true,
    );
  }
}
