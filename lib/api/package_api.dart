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

final DateTime now = DateTime.now();
final String noteDate = DateFormat("d-M-yyy (EE)").format(now);

final MonDao monDao = Get.find();
List<Mon> mons = [];

final TueDao tueDao = Get.find();
List<Tue> tues = [];

final WedDao wedDao = Get.find();
List<Wed> weds = [];

final ThuDao thuDao = Get.find();
List<Thu> thus = [];

final FriDao friDao = Get.find();
List<Fri> fris = [];

final SubDao subDao = Get.find();
List<Sub> subs = [];

final NoteDao noteDao = Get.find();
List<Note> notes = [];

final ExamDao examDao = Get.find();
List<Exam> exams = [];
