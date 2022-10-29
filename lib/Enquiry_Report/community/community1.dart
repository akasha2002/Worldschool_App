import 'package:flutter/material.dart';

class ScrollableColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.green[100]),
            columnSpacing: 40,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            columns: [
              DataColumn(label: Text('BC')),
              DataColumn(label: Text('BCM')),
              DataColumn(label: Text('DNC')),
              DataColumn(label: Text('MBC')),
              DataColumn(label: Text('OC')),
              DataColumn(label: Text('SC')),
              DataColumn(label: Text('Muslim')),
              DataColumn(label: Text('Pallan')),
              DataColumn(label: Text('Sca')),

              ///
              DataColumn(label: Text('ST')),
              DataColumn(label: Text('Nadar')),
              DataColumn(label: Text('DNC/MBC')),
              DataColumn(label: Text('General')),
              DataColumn(label: Text('Inthu nadar')),
              DataColumn(label: Text('Muslim Lebbai')),
              DataColumn(label: Text('OBC')),
              DataColumn(label: Text('Hindu')),
              DataColumn(label: Text('mukkuvar')),
              DataColumn(label: Text('Maravar')),
              DataColumn(label: Text('Null')),
              DataColumn(label: Text('Mbc')),
              DataColumn(label: Text('DCN')),
              DataColumn(label: Text('Saiva Velallar')),
              DataColumn(label: Text('Muslim')),
            ],
            rows: [
              ...teamsData.map((team) => DataRow(
                    cells: [
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            team.bc.toString(),
                            //style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.bcm.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.dnc.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.mbc.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.oc.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.sc.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.muslim.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.pallan.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Sca.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.ST.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Nadar.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.DNCMBC.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.General.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Inthunadar.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.MuslimLebbai.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.OBC.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Hindu.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.mukkuvar.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Maravar.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Null.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Mbc.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.DCN.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.SaivaVelallar.toString()))),
                      DataCell(Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.Muslim.toString()))),
                    ],
                  ))
            ]),
      ),
    );
  }
}

List<Team> teamsData = [
  Team(
      name: 'LKG',
      bc: 11,
      bcm: 5,
      dnc: 3,
      mbc: 2,
      oc: 0,
      sc: 4,
      gd: 3,
      muslim: 5,
      pallan: 1,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 2,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: 'UKG',
      bc: 10,
      bcm: 4,
      dnc: 3,
      mbc: 1,
      oc: 0,
      sc: 6,
      gd: 7,
      muslim: 5,
      pallan: 7,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 3,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '1st',
      bc: 10,
      bcm: 4,
      dnc: 3,
      mbc: 2,
      oc: 0,
      sc: 2,
      gd: 7,
      muslim: 5,
      pallan: 4,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 7,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '2nd',
      bc: 9,
      bcm: 5,
      dnc: 2,
      mbc: 3,
      oc: 0,
      sc: 1,
      gd: 3,
      muslim: 5,
      pallan: 8,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 5,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '3rd',
      bc: 9,
      bcm: 4,
      dnc: 3,
      mbc: 0,
      oc: 1,
      sc: 4,
      gd: 2,
      muslim: 5,
      pallan: 0,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 1,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '4th',
      bc: 8,
      bcm: 5,
      dnc: 2,
      mbc: 2,
      oc: 1,
      sc: 6,
      gd: 0,
      muslim: 5,
      pallan: 1,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 2,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '5th',
      bc: 8,
      bcm: 5,
      dnc: 2,
      mbc: 2,
      oc: 1,
      sc: 3,
      gd: 0,
      muslim: 5,
      pallan: 5,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 0,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '6th',
      bc: 7,
      bcm: 3,
      dnc: 2,
      mbc: 1,
      oc: 0,
      sc: 1,
      gd: 4,
      muslim: 5,
      pallan: 2,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 8,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '7th',
      bc: 7,
      bcm: 5,
      dnc: 2,
      mbc: 1,
      oc: 2,
      sc: 5,
      gd: 3,
      muslim: 5,
      pallan: 3,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 6,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '8th',
      bc: 7,
      bcm: 3,
      dnc: 2,
      mbc: 1,
      oc: 0,
      sc: 4,
      gd: 3,
      muslim: 5,
      pallan: 3,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 7,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '9th',
      bc: 6,
      bcm: 5,
      dnc: 1,
      mbc: 3,
      oc: 1,
      sc: 3,
      gd: 0,
      muslim: 5,
      pallan: 3,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 7,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '10th',
      bc: 5,
      bcm: 4,
      dnc: 1,
      mbc: 2,
      oc: 1,
      sc: 4,
      gd: 0,
      muslim: 5,
      pallan: 3,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 7,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '11th',
      bc: 5,
      bcm: 5,
      dnc: 1,
      mbc: 2,
      oc: 2,
      sc: 8,
      gd: 2,
      muslim: 5,
      pallan: 3,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 6,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5),
  Team(
      name: '12th',
      bc: 4,
      bcm: 4,
      dnc: 0,
      mbc: 4,
      oc: 0,
      sc: 2,
      gd: 0,
      muslim: 5,
      pallan: 3,
      Sca: 0,
      ST: 4,
      Nadar: 6,
      DNCMBC: 8,
      General: 8,
      Inthunadar: 3,
      MuslimLebbai: 4,
      OBC: 9,
      Hindu: 6,
      mukkuvar: 6,
      Maravar: 8,
      Null: 5,
      Mbc: 7,
      DCN: 8,
      SaivaVelallar: 3,
      Muslim: 5)
];

class Team {
  Team({
    required this.name,
    required this.bc,
    required this.bcm,
    required this.dnc,
    required this.mbc,
    required this.oc,
    required this.sc,
    required this.gd,
    required this.muslim,
    required this.pallan,
    required this.Sca,
    required this.ST,
    required this.Nadar,
    required this.DNCMBC,
    required this.General,
    required this.Inthunadar,
    required this.MuslimLebbai,
    required this.OBC,
    required this.Hindu,
    required this.mukkuvar,
    required this.Maravar,
    required this.Null,
    required this.Mbc,
    required this.DCN,
    required this.SaivaVelallar,
    required this.Muslim,
  });

  final String name;
  final int bc;
  final int bcm;
  final int dnc;
  final int mbc;
  final int oc;
  final int sc;
  final int gd;
  final int muslim;
  final int pallan;
  final int Sca;
  final int ST;
  final int Nadar;
  final int DNCMBC;
  final int General;
  final int Inthunadar;
  final int MuslimLebbai;
  final int OBC;
  final int Hindu;
  final int mukkuvar;
  final int Maravar;
  final int Null;
  final int Mbc;

  final int DCN;
  final int SaivaVelallar;
  final int Muslim;
}