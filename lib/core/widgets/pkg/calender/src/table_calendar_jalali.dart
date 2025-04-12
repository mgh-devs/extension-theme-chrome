import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as inh;
import 'package:new_tab_chrome/core/utils/colors.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:new_tab_chrome/core/widgets/pkg/calender/src/extensions/string.dart';

class JalaliTableCalendar extends StatefulWidget {
  const JalaliTableCalendar({
    super.key,
    this.currentMonth,
    this.headerStyle,
    this.weekDaysStyle,
    this.selectedDay,
    this.selectedDayBuilder,
    this.currentDayBuilder,
    this.nextMonthIcon,
    this.previousMonthIcon,
    required this.onDaySelected,
    this.onMonthChanged,
    this.headerText,
    required this.isJalali,
  });

  final bool isJalali;
  final Jalali? currentMonth;
  final TextStyle? headerStyle;
  final TextStyle? weekDaysStyle;
  final Jalali? selectedDay;
  final Widget Function(BuildContext, Jalali)? selectedDayBuilder;
  final Widget Function(BuildContext, Jalali)? currentDayBuilder;
  final Function(Jalali date) onDaySelected;
  final String Function(Jalali date)? headerText;
  final Function(Jalali date)? onMonthChanged;
  final Widget? previousMonthIcon;
  final Widget? nextMonthIcon;

  @override
  State<JalaliTableCalendar> createState() => _JalaliTableCalendarState();
}

class _JalaliTableCalendarState extends State<JalaliTableCalendar> {
  late Jalali _currentMonth;
  late List<Jalali> _visibleDates;

  static const List<String> _weekDaysJalali = [
    'شنبه',
    'یکشنبه',
    'دوشنبه',
    'سه‌شنبه',
    'چهارشنبه',
    'پنجشنبه',
    'جمعه',
  ];

  static const List<String> _weekDaysGregorian = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.currentMonth ?? Jalali.now();
    _visibleDates = _getVisibleDates(_currentMonth);
  }

  bool _isSameDay(Jalali a, Jalali b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void _changeMonth(bool forward) {
    setState(() {
      final month = forward ? _currentMonth.month + 1 : _currentMonth.month - 1;
      final year = _currentMonth.year + (month > 12 ? 1 : (month < 1 ? -1 : 0));
      final adjustedMonth = (month - 1) % 12 + 1;
      _currentMonth = Jalali(year, adjustedMonth);
      _visibleDates = _getVisibleDates(_currentMonth);
      widget.onMonthChanged?.call(_currentMonth);
    });
  }

  List<Jalali> _getVisibleDates(Jalali month) {
    // همون کد قبلی برای شمسی
    // برای میلادی باید جداگانه نوشته بشه
    if (!widget.isJalali) {
      final gDate = month.toDateTime(); // تبدیل به DateTime
      final firstDay = DateTime(gDate.year, gDate.month, 1);
      final paddingStart = (firstDay.weekday + 1) % 7;
      final startDate = firstDay.subtract(Duration(days: paddingStart));
      final totalDays = DateTime(gDate.year, gDate.month + 1, 0).day;

      return List.generate(totalDays + paddingStart, (i) {
        final date = startDate.add(Duration(days: i));
        return Jalali.fromDateTime(date);
      });
    }

    // حالت شمسی همون کد قبلی:
    final firstDay = Jalali(month.year, month.month, 1);
    final paddingStart = firstDay.weekDay - 1;
    final startDate = firstDay.addDays(-paddingStart);
    final daysInMonth = month.month == 12 && Jalali(month.year).isLeapYear()
        ? 30
        : month.month == 12
            ? 29
            : month.month <= 6
                ? 31
                : 30;

    return List.generate(
        daysInMonth + paddingStart, (i) => startDate.addDays(i));
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          splashRadius: 20,
          icon: widget.nextMonthIcon ??
              const Icon(Icons.chevron_left, color: Colors.white60),
          onPressed: () => _changeMonth(false),
        ),
        Text(

              (widget.isJalali
                  ? '${_currentMonth.formatter.mN} ${_currentMonth.year}'
                  : inh.DateFormat('MMMM yyyy', 'en_US')
                      .format(_currentMonth.toDateTime())),
          style: widget.headerStyle ?? Theme.of(context).textTheme.labelMedium,
        ),
        IconButton(
          splashRadius: 20,
          icon: widget.previousMonthIcon ??
              const Icon(Icons.chevron_right, color: Colors.white60),
          onPressed: () => _changeMonth(true),
        ),
      ],
    );
  }

  Widget _buildDaysName() {
    final days = widget.isJalali ? _weekDaysJalali : _weekDaysGregorian;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        return Text(
          day,
          style: widget.weekDaysStyle ??
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12),
        );
      }).toList(),
    );
  }

  Widget _buildDayBox(Jalali date, bool isSelected, bool isToday) {
    final isHoliday = date.weekDay == 7;

    Color? boxColor;
    Color? textColor;
    BoxBorder? border;

    if (isToday) {
      boxColor = blueLight;
    } else if (isSelected) {
      boxColor = card;
      border = Border.all(color: blueLight, width: 2);
    } else if (isHoliday) {
      boxColor = Colors.red.withOpacity(0.2);
      textColor = Colors.red;
    } else {
      boxColor = card;
    }

    return _DayBox(
      date: date,
      onTap: widget.onDaySelected,
      boxColor: boxColor,
      textColor: textColor,
      border: border,
      isJalali: widget.isJalali,
    );
  }

  Widget _buildCalendar() {
    final firstDay = Jalali(_currentMonth.year, _currentMonth.month, 1);
    final skipCount = firstDay.weekDay - 1;

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      itemCount: _visibleDates.length,
      itemBuilder: (context, index) {
        if (index < skipCount) return const SizedBox();
        final date = _visibleDates[index];
        final isSelected =
            widget.selectedDay != null && _isSameDay(date, widget.selectedDay!);
        final isToday = _isSameDay(date, Jalali.now());

        return _buildDayBox(date, isSelected, isToday);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildDaysName(),
            const SizedBox(height: 8),
            _buildCalendar(),
          ],
        ),
      ),
    );
  }
}

class _DayBox extends StatelessWidget {
  const _DayBox({
    required this.date,
    required this.onTap,
    required this.isJalali,
    this.boxColor,
    this.textColor,
    this.border,
  });

  final Jalali date;
  final Color? boxColor;
  final Color? textColor;
  final BoxBorder? border;
  final bool isJalali;
  final Function(Jalali date) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onTap(date),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: boxColor ?? Colors.blue,
              border: border,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                isJalali
                    ? date.day.toString().toFarsiNumber()
                    : date.toDateTime().day.toString(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 12,
                      color: textColor ?? Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
