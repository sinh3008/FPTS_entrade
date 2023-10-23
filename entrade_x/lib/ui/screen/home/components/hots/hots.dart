import 'package:entrade_x/ui/screen/home/components/hots/transition_fees/transition_free.dart';
import 'package:flutter/material.dart';

import '../../mini_compo/build_event_container.dart';
import 'hatch_gold/hatch_gold.dart';

class HostWidget extends StatefulWidget {
  const HostWidget({super.key});

  @override
  State<HostWidget> createState() => _HostWidgetState();
}

class _HostWidgetState extends State<HostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: buildEventContainer(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransitionFees(),
                    )),
                txt1: 'Phí giao dịch',
                txt2: 'Miễn phí',
                txt3: 'trọn đời',
                iconPath: 'assets/images/transaction.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: buildEventContainer(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HatchGoldPage(),
                  )),
              txt1: 'Ấp trứng vàng',
              txt2: '7.0%/năm',
              txt3: 'Lợi suất',
              iconPath: 'assets/images/golden-egg.png',
            ),
          ),
        ],
      ),
    );
  }
}