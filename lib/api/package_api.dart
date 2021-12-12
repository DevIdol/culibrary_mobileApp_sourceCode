import 'package:culibrary/database/dao.dart';
import 'package:culibrary/database/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

late TabController tabController;
int currentWeekDay = now.weekday;

final TextEditingController startTime = TextEditingController();
final TextEditingController endTime = TextEditingController();
final TextEditingController subject = TextEditingController();
final TextEditingController note = TextEditingController();

final formKey = GlobalKey<FormState>();
final formatTime = DateFormat("h:mm aa");
final formatDate = DateFormat("d-M-yyy (EE)");
var scrollView = ScrollController();

DateTime now = DateTime.now();
String noteDate = DateFormat("d-M-yyy (EE)").format(now);

MonDao monDao = Get.find();
List<Mon> mons = [];

TueDao tueDao = Get.find();
List<Tue> tues = [];

WedDao wedDao = Get.find();
List<Wed> weds = [];

ThuDao thuDao = Get.find();
List<Thu> thus = [];

FriDao friDao = Get.find();
List<Fri> fris = [];

SubDao subDao = Get.find();
List<Sub> subs = [];

NoteDao noteDao = Get.find();
List<Note> notes = [];

ExamDao examDao = Get.find();
List<Exam> exams = [];
