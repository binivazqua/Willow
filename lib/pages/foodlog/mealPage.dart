import 'package:bejoy/design/colors/palette.dart';
import 'package:bejoy/pages/foodlog/components/equivalentModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mealPage extends StatelessWidget {
  const mealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My meal'),
        backgroundColor: lightTurquoise,
      ),
      body: Consumer<Equivalent>(builder: (context, value, child) {
        return Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: value.mealItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.remove),
                              color: turquoise,
                              onPressed: () => Provider.of<Equivalent>(context,
                                      listen: false)
                                  .removeEquiv(index),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                    image: AssetImage(mealItemIcon(
                                        value.mealItems[index][0]))),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(value.mealItems[index][0])
                              ],
                            ),
                          )),
                    );
                  })),

          // Calculate total equivs:

          ElevatedButton(
              onPressed: () {
                Provider.of<Equivalent>(context, listen: false)
                    .printEquivalentCounts();
              },
              child: Text('calculayte'))
        ]);
      }),
    );
  }

  String mealItemIcon(String equivalentType) {
    if (equivalentType == 'Verduras') {
      return "lib/design/images/foodlog/minis/zanahoria_mini.png";
    } else if (equivalentType == 'Origen animal') {
      return "lib/design/images/foodlog/minis/carne_mini.png";
    } else if (equivalentType == 'Frutas') {
      return "lib/design/images/foodlog/minis/acai_mini.png";
    } else if (equivalentType == "Lácteos") {
      return "lib/design/images/foodlog/minis/leche_mini.png";
    } else if (equivalentType == "Grasas") {
      return "lib/design/images/foodlog/minis/almendras-sin-igual_mini.png";
    } else if (equivalentType == "Cereales") {
      return "lib/design/images/foodlog/minis/pan-de-molde_mini.png";
    }
    return "lib/design/images/foodlog/minis/helado._mini.png";
  }
}
