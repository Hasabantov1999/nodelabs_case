
import 'package:animate_do/animate_do.dart';
import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSelectField<T> extends StatefulWidget {
  const AppSelectField({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
    required this.builder,
  });
  final String title;
  final List<T> items;
  final ValueChanged<T> onChanged;
  final Widget Function(BuildContext context, T item) builder;
  @override
  State<AppSelectField<T>> createState() => _AppSelectFieldState<T>();
}

class _AppSelectFieldState<T> extends State<AppSelectField<T>> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        elevation: 5,
        child: InkWell(
          onTap: () async {
            var res = await CleanArchRouter().push(
              CleanArchRoute(
                mobile: SelectableView(
                  builder: widget.builder,
                  items: widget.items,
                ),
                path: "/search",
              ),
            );
            if (res is SearchFieldResult<T>) {
              widget.onChanged(res.result);
              controller.text = res.label;
            }
          },
          borderRadius: BorderRadius.circular(60),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 13),
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: TextFormField(
                      controller: controller,
                      enabled: false,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorColor: CA.getTheme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: widget.title,
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(CA.assets.images("dropdown.svg")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectableView<T> extends StatelessWidget {
  const SelectableView({
    super.key,
    required this.builder,
    required this.items,
  });
  final Widget Function(BuildContext context, T item) builder;
  final List<T> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 50.w,
              width: context.sized.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: context.padding.horizontalNormal,
                      child: SizedBox(
                        width: 45.w,
                        height: 45.w,
                        child: Material(
                          color: Colors.white10,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: Colors.white24,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.maybePop(context);
                            },
                            customBorder: CircleBorder(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CleanArchText(
                      "Dil Seç",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Material(
              color: Colors.black,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _List<T>(builder: builder, items: items, index: index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _List<T> extends StatefulWidget {
  const _List({
    super.key,
    required this.builder,
    required this.items,
    required this.index,
  });

  final Widget Function(BuildContext context, T item) builder;
  final List<T> items;
  final int index;

  @override
  State<_List<T>> createState() => _ListState<T>();
}

class _ListState<T> extends State<_List<T>> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FadeInLeft(
      duration: Duration(milliseconds: 100),
      delay: Duration(milliseconds: 100 * widget.index),
      child: widget.builder(context, widget.items[widget.index]),
    );
  }
}

class SearchFieldResult<T> {
  final T result;
  final String label;
  SearchFieldResult({required this.result, required this.label});
}
