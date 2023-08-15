import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';

class PagePagination extends StatefulWidget {
  const PagePagination({super.key});

  @override
  State<PagePagination> createState() => _PagePaginationState();
}

class _PagePaginationState extends State<PagePagination> {
  int currentPage = 1;
  int totalPages = 1;
  bool hasNextPage = true;

  @override
  Widget build(BuildContext context) {
    return Pagination(
      paginateButtonStyles: PaginateButtonStyles(),
      prevButtonStyles: PaginateSkipButton(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      nextButtonStyles: PaginateSkipButton(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      onPageChange: (number) {
        setState(() {
          currentPage = number;
        });
      },
      useGroup: false,
      totalPage: totalPages,
      show: totalPages > 2
          ? totalPages == 3
              ? 2
              : 3
          : 0,
      currentPage: currentPage,
    );
  }
}
