dnl -*- shell-script -*-
dnl
dnl Copyright (c) 2020      Cisco Systems, Inc.  All rights reserved.
dnl
dnl Copyright (c) 2020      Intel, Inc.  All rights reserved.
dnl Copyright (c) 2021      Nanook Consulting.  All rights reserved.
dnl $COPYRIGHT$
dnl
dnl Additional copyrights may follow
dnl
dnl $HEADER$
dnl

dnl
dnl Just in case someone looks for it here someday, here is a
dnl conveninent reference for what Markdown pandoc supports:
dnl
dnl https://rmarkdown.rstudio.com/authoring_pandoc_markdown.html
dnl

dnl pandoc setup
AC_DEFUN([PRTE_MANPAGES_SETUP_PANDOC],[
    # If we need to generate man pages, we need pandoc >v1.12.
    AC_PATH_PROG([PANDOC], [pandoc])

    # If we found Pandoc, check its version.  We need >=v1.12.
    # To be clear: I know that v1.12 works, and I know that v1.9 does not
    # work.  I did not test the versions in between to know exactly what
    # the lowest version is that works.  Someone is free to update this
    # check someday to be more accurate if they wish.
    min_major_version=1
    min_minor_version=12
    AS_IF([test -n "$PANDOC"],
          [pandoc_version=`pandoc --version | head -n 1 | awk '{ print $[2] }'`
           pandoc_major=`echo $pandoc_version | cut -d\. -f1`
           pandoc_minor=`echo $pandoc_version | cut -d\. -f2`
           AC_MSG_CHECKING([pandoc version])
           AC_MSG_RESULT([major: $pandoc_major, minor: $pandoc_minor])

           AC_MSG_CHECKING([if pandoc version is >=v$min_major_version.$min_minor_version])
           AS_IF([test $pandoc_major -lt $min_major_version], [PANDOC=])
           AS_IF([test $pandoc_major -eq $min_major_version && test $pandoc_minor -lt $min_minor_version],
                 [PANDOC=])
           AS_IF([test -n "$PANDOC"],
                 [AC_MSG_RESULT([yes])],
                 [AC_MSG_RESULT([no])])
          ])

    AS_IF([test -z "$PANDOC" || test -n "`echo $PANDOC | $GREP missing`"],
          [AC_MSG_WARN([*** Could not find a suitable pandoc on your system.])
           AC_MSG_WARN([*** You need pandoc >=$min_major_version.$min_minor_version to build PRRTE man pages.])
           AC_MSG_WARN([*** See pandoc.org.])
           AC_MSG_ERROR([Cannot continue])])
    AC_SUBST(PANDOC)
])
