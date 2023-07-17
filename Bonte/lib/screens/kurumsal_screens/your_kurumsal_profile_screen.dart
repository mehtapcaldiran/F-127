import 'package:bonte/model_providers/user_kurumsal_provider.dart';
import 'package:bonte/utilis/creat_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../model_providers/events_provider.dart';

void main() => runApp(YourKurumsalProfile());

class YourKurumsalProfile extends ConsumerStatefulWidget {
  const YourKurumsalProfile({super.key});

  @override
  ConsumerState<YourKurumsalProfile> createState() => _YourKurumsalProfileState();
}

class _YourKurumsalProfileState extends ConsumerState<YourKurumsalProfile> with TickerProviderStateMixin {

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    final kurumPreferences = ref.read(kurumPreferencesProvider);

    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              context.go('/kurumsalSettings');
            },
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Color(0xFFD9F0F5),
        leading: Container(
          padding: EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xFF1B5966B),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: p_height * 0.35,
                width: p_width * 0.9,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                        child: Container(
                          height: p_height * 0.22,
                          width: p_width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(kurumPreferences.value!.backgroundImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      top: p_height * 0.12,
                      left: p_width * 0.04,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                            radius: 65,
                          backgroundImage:  kurumPreferences.value!.image != "" ? NetworkImage(kurumPreferences.value!.image) : null,
                          backgroundColor: kurumPreferences.value!.image != "" ? Colors.transparent : Colors.grey,
                          ),
                      ),
                    ),
                    Positioned(
                      top: p_height * 0.23,
                      left: p_width * 0.43,
                      child: Container(
                        height: p_height * 0.16,
                        width: p_width * 0.46,
                        child: Text(
                          '${kurumPreferences.value?.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: p_height * 0.28,
                      left: p_width * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Takip'),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Üyelik'),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: (){
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(40),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Container(
                                      height: p_height * 0.3,
                                      child: Bagis(),

                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.attach_money, size: 20,),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1B5966),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: p_height * 0.18,
                width: p_width * 0.9,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFD6D4D4),
                ),
                child: Center(child: Text(
                  '${kurumPreferences.value!.info}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                ),
              ),
              SizedBox(height: 10,),
              TabBar(
                labelColor: Color(0xFF123B44),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Color(0xFF1B5966),
                indicator: BoxDecoration(
                  color: Color(0xFFB3E1EB),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0xFF123B44),)
                ),
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Akış',
                  ),
                  Tab(
                    text: 'Etkinlikler',
                  ),
                  Tab(
                    text: 'Eğitimler',
                  ),
                ],
              ),
              Container(
                height: p_height * 0.5,
                width: p_width * 0.9,
                child: TabBarView(
                    controller: _tabController,
                    children: [
                        SingleChildScrollView(
                          child: Center(
                            child: YourAkis(),
                          ),
                        ),
                      Center(
                          child: Etkinlikler(),
                        ),
                      Container(
                        child: Egitim(),
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF1B5966),
          onPressed: (){
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text('Post'),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.event),
                      title: Text('Etkinlik Tanımla'),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreatEvent()));
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}


class YourAkis extends ConsumerStatefulWidget {
  const YourAkis({super.key});

  @override
  ConsumerState<YourAkis> createState() => _YourAkisState();
}

class _YourAkisState extends ConsumerState<YourAkis> {
  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    final kurumPreferences = ref.read(kurumPreferencesProvider);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              height: p_height * 0.55,
              width: p_width * 0.95,
              color: Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  Container(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  kurumPreferences.value!.image != "" ? NetworkImage(kurumPreferences.value!.image) : null,
                          backgroundColor: kurumPreferences.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        SizedBox(width: 15,),
                        Text(
                          '${kurumPreferences.value!.name}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://www.mgc.com.tr/wp-content/uploads/2022/06/eylemli-orman-nedir-tr-mgc-legal.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                      child: Row(
                        children: [
                          Text(
                            '${kurumPreferences.value!.name}     ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Ormanları Sev',
                          ),
                        ],
                      ),
                  ),
                  Positioned(
                    top: p_height * 0.45,
                    child: Container(
                      height: p_height * 0.1,
                      width: p_width * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width * 0.46,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),),
                              onPressed: (){},
                              label: Text('Beğen  25'),
                              icon: Icon(Icons.add_box),
                            ),
                          ),
                          //SizedBox(width: 10,),
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width * 0.46,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),),
                              onPressed: (){},
                              label: Text('Yorumlar'),
                              icon: Icon(Icons.comment),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: p_height * 0.55,
              width: p_width * 0.95,
              color: Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  Container(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  kurumPreferences.value!.image != "" ? NetworkImage(kurumPreferences.value!.image) : null,
                          backgroundColor: kurumPreferences.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        SizedBox(width: 15,),
                        Text(
                          '${kurumPreferences.value!.name}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://cdnuploads.aa.com.tr/uploads/Contents/2022/07/19/thumbs_b_c_e1e0c1d4b18dbb7d6273c8c79ed18c6a.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                    child: Row(
                      children: [
                        Container(
                          height: p_height * 0.07,
                          width: p_width *0.95,
                          child: Text(
                            softWrap: true,
                            '${kurumPreferences.value!.name}     ' 'Yaz aylarının gelmesi ile orman yangını riskleri de arttı. Bu konuda dikkat etmenizi önemle rica ederiz.',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.45,
                    child: Container(
                      height: p_height * 0.1,
                      width: p_width * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width * 0.46,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),),
                              onPressed: (){},
                              label: Text('Beğen  25'),
                              icon: Icon(Icons.add_box),
                            ),
                          ),
                          //SizedBox(width: 10,),
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width * 0.46,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),),
                              onPressed: (){},
                              label: Text('Yorumlar'),
                              icon: Icon(Icons.comment),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: p_height * 0.55,
              width: p_width * 0.95,
              color: Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  Container(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  kurumPreferences.value!.image != "" ? NetworkImage(kurumPreferences.value!.image) : null,
                          backgroundColor: kurumPreferences.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        SizedBox(width: 15,),
                        Text(
                          '${kurumPreferences.value!.name}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://static.daktilo.com/sites/392/uploads/2021/08/05/mustafakemalpasa-yagun-yesil-seferberlik-bgazete-2.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                    child: Row(
                      children: [
                        Text(
                          '${kurumPreferences.value!.name}   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Orman temizleme etkinliği',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.45,
                    child: Container(
                      height: p_height * 0.1,
                      width: p_width * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width * 0.46,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),),
                              onPressed: (){},
                              label: Text('Beğen  25'),
                              icon: Icon(Icons.add_box),
                            ),
                          ),
                          //SizedBox(width: 10,),
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width * 0.46,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),),
                              onPressed: (){},
                              label: Text('Yorumlar'),
                              icon: Icon(Icons.comment),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}



class Etkinlikler extends ConsumerStatefulWidget {
  const Etkinlikler({super.key});

  @override
  ConsumerState<Etkinlikler> createState() => _EtkinliklerState();
}

class _EtkinliklerState extends ConsumerState<Etkinlikler> {
  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    final eventProvider = ref.read(eventsPreferencesProvider("49ToXNTJc8cLbF8HN2Hf"));
    final eventProvider1 = ref.read(eventsPreferencesProvider("SZeLRenxtyhfDWln86YV"));
    final eventProvider2 = ref.read(eventsPreferencesProvider("579pesDiGlLLcLWwL1Oi"));

    return ListView(
      children: [
        SizedBox(height: 10,),
        Container(
          height: p_height * 0.12,
          width: p_width * 0.7,
          child: Card(
            color: eventProvider.value!.status == "0" ? Colors.grey : Colors.lightGreen,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF1B5966),),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                context.push('/etkinlikInfo');
              },
              leading: Image.network(eventProvider.value!.eventImage),
              title: Text('${eventProvider.value!.eventName}',),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${eventProvider.value!.eventInfo}'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: p_height * 0.12,
          width: p_width * 0.7,
          child: Card(
            color: eventProvider1.value!.status == "0" ? Colors.grey : Colors.lightGreen,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF1B5966),),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                context.push('/etkinlikInfo');
              },
              leading: Image.network(eventProvider1.value!.eventImage),
              title: Text('${eventProvider1.value!.eventName}',),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${eventProvider1.value!.eventInfo}'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: p_height * 0.12,
          width: p_width * 0.7,
          child: Card(
            color: eventProvider2.value!.status == "0" ? Colors.grey : Colors.lightGreen,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF1B5966),),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                context.push('/etkinlikInfo');
              },
              leading: Image.network(eventProvider2.value!.eventImage),
              title: Text('${eventProvider2.value!.eventName}',),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${eventProvider2.value!.eventInfo}'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}

class Bagis extends StatefulWidget {
  const Bagis({super.key});

  @override
  State<Bagis> createState() => _BagisState();
}

class _BagisState extends State<Bagis> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iban 1 : TR00 000000 000001',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.share),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iban 2 : TR00 000000 000001',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.share),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iban 3 : TR00 000000 000001',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.share),
              ],
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Bağış Yap'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Egitim extends StatefulWidget {
  const Egitim({super.key});

  @override
  State<Egitim> createState() => _EgitimState();
}

class _EgitimState extends State<Egitim> {

  late YoutubePlayerController _controller;

  @override
  void initState(){
    _controller = YoutubePlayerController(
      initialVideoId: 'z4v6BrHPFyI',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        height: 250,
        width: 400,
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
          },
        ),
      ),
    );
  }
}
