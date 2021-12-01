Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.94331.1638376916540020549
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EL/nuC3q;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id x6so103940691edr.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xz2hFTMxFuRR+1voxXEktBL9JFF4nSZgNtNWCErS97g=;
        b=EL/nuC3qSUytSEO66KFYIYpeCkZtjfYYvtSh8z0uUTUwteD4u4MiCpFkvJ8wycHWwr
         NaEiB862ZR4Rd7IjgvGFNX5z2OkI6Vg5V8D/HvLhAxjzV82Kb29H5dctGTJsMULj5vVD
         G5qKsYtC37jXd8GPrOgWEDlnSWzOhoLQ5xaPEV+YzBchkCSOw/vp90+Uelz85c5R7n2y
         AD89K/S078CmwgRT6sZxEwaDAUzBxrtzgxCgI9y+NVH9AhPvWCZDgGkvs+EhSTV0dt7S
         oOBZocj/ICHeC330UgPPN8jZ8kgtKoQMWMK9dAFf69EOLP08/ep2A2s6gekL6DpBr8Qh
         6ySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xz2hFTMxFuRR+1voxXEktBL9JFF4nSZgNtNWCErS97g=;
        b=2el+9R0QXHSBXDN22bAvK8Csh3BfHt3chKJJOz2zN4br/WKKeSFuJFV4fxYAzDG5dU
         enkzMd4nOY6iYemwyL6aaSfyiqcOb1JhBuCuIyNomXQOatx1SNx8vrrEBRVrtK18fjbh
         53GsSxpOHdnV3gS6pb4srX+37A9wiyL83yCrCdy2/5/wynKGCbVuE4JEegPhMSDf/QTw
         PNxVfrLU8ynVOG0g9o6+O+LkW5ScHu9xHXhCQfq10Lr18pXk0BYYjj8+59VAbYPOrYag
         bM53jZBM9YQ8JYP6Z/zt8aZq6COBEkue84EI8M12RvbvrIlCNa8ROFcHTSFk94gQo7+Y
         nSvA==
X-Gm-Message-State: AOAM5304u6GWcLEuFtJDQMyqJjh30wSPjyg+lGIS94dGz8yiC+qsKTev
	lk7HlKcvSJUBXB1XZ18tjekrof64K/k=
X-Google-Smtp-Source: ABdhPJwnKmW9aE5yB/12WvFdkUNw7fraL73nLWhrHNO640x01GK+f1HzmMInJ2bjIWeHZMCDQz0faw==
X-Received: by 2002:a17:907:7242:: with SMTP id ds2mr8457451ejc.269.1638376914681;
        Wed, 01 Dec 2021 08:41:54 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hz15sm149594ejc.63.2021.12.01.08.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:53 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 10/13] dev86: fix compatibility with gperf-3.1
Date: Wed,  1 Dec 2021 17:41:33 +0100
Message-Id: <20211201164136.33802-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1.tok-to-make-new-gperf-happy-regen..patch | 256 ++++++++++++
 ...gen-token2.h-token1.h-with-gperf-3.1.patch | 389 ++++++++++++++++++
 recipes-extended/dev86/dev86_git.bb           |   2 +
 3 files changed, 647 insertions(+)
 create mode 100644 recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch
 create mode 100644 recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch

diff --git a/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch b/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch
new file mode 100644
index 0000000..38e4d81
--- /dev/null
+++ b/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch
@@ -0,0 +1,256 @@
+From e908a3ad04bb40e425542b85fbb3a1eb5a38e194 Mon Sep 17 00:00:00 2001
+From: Tee-Kiah Chia <tkchia@users.noreply.github.com>
+Date: Thu, 27 Feb 2020 00:52:05 +0800
+Subject: [PATCH] [cpp] update token1.tok to make new gperf happy; regen.
+ token1.h
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Pending [it was submitted in https://github.com/jbruchon/dev86/pull/19
+but then closed by author]
+
+---
+ cpp/token1.h   | 170 +++++++++++++++++++++++++++++++++----------------
+ cpp/token1.tok |   2 +-
+ 2 files changed, 115 insertions(+), 57 deletions(-)
+
+diff --git a/cpp/token1.h b/cpp/token1.h
+index 2e2b9eb..bb313aa 100644
+--- a/cpp/token1.h
++++ b/cpp/token1.h
+@@ -1,15 +1,48 @@
+-/* C code produced by gperf version 2.7.1 (19981006 egcs) */
++/* C code produced by gperf version 3.0.4 */
+ /* Command-line: gperf -aptTc -N is_ctok -H hash1 token1.tok  */
++/* Computed positions: -k'1-2' */
++
++#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
++      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
++      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
++      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
++      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
++      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
++      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
++      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
++      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
++      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
++      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
++      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
++      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
++      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
++      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
++      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
++      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
++      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
++      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
++      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
++      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
++      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
++      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
++/* The character set is not based on ISO-646.  */
++error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
++#endif
++
+ 
+ #define TOTAL_KEYWORDS 23
+ #define MIN_WORD_LENGTH 2
+ #define MAX_WORD_LENGTH 3
+ #define MIN_HASH_VALUE 2
+-#define MAX_HASH_VALUE 63
+-/* maximum key range = 62, duplicates = 0 */
++#define MAX_HASH_VALUE 62
++/* maximum key range = 61, duplicates = 0 */
+ 
+ #ifdef __GNUC__
+ __inline
++#else
++#ifdef __cplusplus
++inline
++#endif
+ #endif
+ static unsigned int
+ hash1 (str, len)
+@@ -18,38 +51,41 @@ hash1 (str, len)
+ {
+   static unsigned char asso_values[] =
+     {
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64,  1, 64, 64, 64,  3, 25, 64,
+-      64, 64, 13, 18, 64,  8, 30, 15, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-       5,  0, 20, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 30, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 23, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
+-      64, 64, 64, 64, 64, 64
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63,  6, 63, 63, 63, 28,  8, 63,
++      63, 63, 23,  3, 63, 25, 20, 18, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      10,  5,  0, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 13, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 30, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
++      63, 63, 63, 63, 63, 63
+     };
+-  return len + asso_values[(unsigned char)str[len - 1]] + asso_values[(unsigned char)str[0]];
++  return len + asso_values[(unsigned char)str[1]] + asso_values[(unsigned char)str[0]];
+ }
+ 
+ #ifdef __GNUC__
+ __inline
++#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
++__attribute__ ((__gnu_inline__))
++#endif
+ #endif
+ struct token_trans *
+ is_ctok (str, len)
+@@ -59,46 +95,68 @@ is_ctok (str, len)
+   static struct token_trans wordlist[] =
+     {
+       {""}, {""},
++#line 14 "token1.tok"
++      {">>",	TK_RIGHT_OP},
++#line 4 "token1.tok"
++      {">>=",	TK_RIGHT_ASSIGN},
++      {""}, {""}, {""},
++#line 22 "token1.tok"
++      {">=",	TK_GE_OP},
++#line 16 "token1.tok"
++      {"++",	TK_INC_OP},
++      {""},
++#line 6 "token1.tok"
++      {"+=",	TK_ADD_ASSIGN},
++      {""},
++#line 23 "token1.tok"
+       {"==",	TK_EQ_OP},
++#line 24 "token1.tok"
+       {"!=",	TK_NE_OP},
+       {""},
+-      {"%=",	TK_MOD_ASSIGN},
++#line 11 "token1.tok"
++      {"&=",	TK_AND_ASSIGN},
+       {""},
++#line 21 "token1.tok"
+       {"<=",	TK_LE_OP},
+-      {"<<=",	TK_LEFT_ASSIGN},
++#line 19 "token1.tok"
++      {"&&",	TK_AND_OP},
+       {""},
+-      {"-=",	TK_SUB_ASSIGN},
++#line 12 "token1.tok"
++      {"^=",	TK_XOR_ASSIGN},
+       {""},
++#line 15 "token1.tok"
+       {"<<",	TK_LEFT_OP},
+-      {""}, {""},
+-      {"*=",	TK_MUL_ASSIGN},
++#line 5 "token1.tok"
++      {"<<=",	TK_LEFT_ASSIGN},
+       {""},
++#line 9 "token1.tok"
+       {"/=",	TK_DIV_ASSIGN},
+-      {"--",	TK_DEC_OP},
+       {""},
+-      {"+=",	TK_ADD_ASSIGN},
+-      {""},
+-      {">=",	TK_GE_OP},
+-      {">>=",	TK_RIGHT_ASSIGN},
+-      {""},
+-      {"|=",	TK_OR_ASSIGN},
++#line 18 "token1.tok"
++      {"->",	TK_PTR_OP},
++      {""}, {""},
++#line 8 "token1.tok"
++      {"*=",	TK_MUL_ASSIGN},
+       {""},
+-      {"&=",	TK_AND_ASSIGN},
++#line 7 "token1.tok"
++      {"-=",	TK_SUB_ASSIGN},
+       {""}, {""},
+-      {"->",	TK_PTR_OP},
++#line 10 "token1.tok"
++      {"%=",	TK_MOD_ASSIGN},
+       {""},
+-      {"^=",	TK_XOR_ASSIGN},
+-      {""}, {""}, {""}, {""}, {""},
+-      {"++",	TK_INC_OP},
+-      {""}, {""}, {""},
+-      {">>",	TK_RIGHT_OP},
+-      {""}, {""}, {""}, {""}, {""},
+-      {"||",	TK_OR_OP},
+-      {""}, {""}, {""},
+-      {"&&",	TK_AND_OP},
+-      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
++#line 13 "token1.tok"
++      {"|=",	TK_OR_ASSIGN},
++      {""}, {""}, {""}, {""},
++#line 25 "token1.tok"
+       {"..",	TK_WORD},
+-      {"...",	TK_ELLIPSIS}
++#line 3 "token1.tok"
++      {"...",	TK_ELLIPSIS},
++      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
++#line 17 "token1.tok"
++      {"--",	TK_DEC_OP},
++      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
++#line 20 "token1.tok"
++      {"||",	TK_OR_OP}
+     };
+ 
+   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
+@@ -109,7 +167,7 @@ is_ctok (str, len)
+         {
+           register const char *s = wordlist[key].name;
+ 
+-          if (*str == *s && !strncmp (str + 1, s + 1, len - 1))
++          if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
+             return &wordlist[key];
+         }
+     }
+diff --git a/cpp/token1.tok b/cpp/token1.tok
+index cd668ce..a98926f 100644
+--- a/cpp/token1.tok
++++ b/cpp/token1.tok
+@@ -7,7 +7,7 @@ struct token_trans { char * name; int token; };
+ -=,	TK_SUB_ASSIGN
+ *=,	TK_MUL_ASSIGN
+ /=,	TK_DIV_ASSIGN
+-%=,	TK_MOD_ASSIGN
++"%=",	TK_MOD_ASSIGN
+ &=,	TK_AND_ASSIGN
+ ^=,	TK_XOR_ASSIGN
+ |=,	TK_OR_ASSIGN
diff --git a/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch b/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch
new file mode 100644
index 0000000..8787369
--- /dev/null
+++ b/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch
@@ -0,0 +1,389 @@
+From ce2b9747d51df2a4c358a037950f0464f3f53fe8 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 14 May 2021 14:31:50 +0000
+Subject: [PATCH] regen token2.h, token1.h with gperf-3.1
+
+* update cc.h, token1.c, token2.c to be compatible with
+  gperf-3.1 output
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ cpp/cc.h     |   4 +-
+ cpp/token1.c |   2 +-
+ cpp/token1.h |  22 ++----
+ cpp/token2.c |   2 +-
+ cpp/token2.h | 211 +++++++++++++++++++++++++++++++--------------------
+ 5 files changed, 140 insertions(+), 101 deletions(-)
+
+diff --git a/cpp/cc.h b/cpp/cc.h
+index 9c298e7..3724543 100644
+--- a/cpp/cc.h
++++ b/cpp/cc.h
+@@ -25,8 +25,8 @@ extern int    dialect;
+ extern int gettok P((void));
+ 
+ struct token_trans { char * name; int token; };
+-struct token_trans * is_ctok P((const char *str, unsigned int len));
+-struct token_trans * is_ckey P((const char *str, unsigned int len));
++struct token_trans * is_ctok P((register const char *str, register size_t len));
++struct token_trans * is_ckey P((register const char *str, register size_t len));
+ 
+ #define WORDSIZE	128
+ #define TK_WSPACE	256
+diff --git a/cpp/token1.c b/cpp/token1.c
+index f3aa420..cc47f3e 100644
+--- a/cpp/token1.c
++++ b/cpp/token1.c
+@@ -6,6 +6,6 @@
+ #ifdef __GNUC__
+ __inline
+ #endif
+-static unsigned int hash1 P((register const char *, register unsigned int));
++static unsigned int hash1 P((register const char *, register size_t));
+ 
+ #include "token1.h"
+diff --git a/cpp/token1.h b/cpp/token1.h
+index bb313aa..2af88c2 100644
+--- a/cpp/token1.h
++++ b/cpp/token1.h
+@@ -1,4 +1,4 @@
+-/* C code produced by gperf version 3.0.4 */
++/* ANSI-C code produced by gperf version 3.1 */
+ /* Command-line: gperf -aptTc -N is_ctok -H hash1 token1.tok  */
+ /* Computed positions: -k'1-2' */
+ 
+@@ -26,7 +26,7 @@
+       && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
+       && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
+ /* The character set is not based on ISO-646.  */
+-error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
++#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gperf@gnu.org>."
+ #endif
+ 
+ 
+@@ -45,9 +45,7 @@ inline
+ #endif
+ #endif
+ static unsigned int
+-hash1 (str, len)
+-     register const char *str;
+-     register unsigned int len;
++hash1 (register const char *str, register size_t len)
+ {
+   static unsigned char asso_values[] =
+     {
+@@ -81,16 +79,8 @@ hash1 (str, len)
+   return len + asso_values[(unsigned char)str[1]] + asso_values[(unsigned char)str[0]];
+ }
+ 
+-#ifdef __GNUC__
+-__inline
+-#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
+-__attribute__ ((__gnu_inline__))
+-#endif
+-#endif
+ struct token_trans *
+-is_ctok (str, len)
+-     register const char *str;
+-     register unsigned int len;
++is_ctok (register const char *str, register size_t len)
+ {
+   static struct token_trans wordlist[] =
+     {
+@@ -161,9 +151,9 @@ is_ctok (str, len)
+ 
+   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
+     {
+-      register int key = hash1 (str, len);
++      register unsigned int key = hash1 (str, len);
+ 
+-      if (key <= MAX_HASH_VALUE && key >= 0)
++      if (key <= MAX_HASH_VALUE)
+         {
+           register const char *s = wordlist[key].name;
+ 
+diff --git a/cpp/token2.c b/cpp/token2.c
+index b4d22b1..fbc790d 100644
+--- a/cpp/token2.c
++++ b/cpp/token2.c
+@@ -6,6 +6,6 @@
+ #ifdef __GNUC__
+ __inline
+ #endif
+-static unsigned int hash2 P((register const char *, register unsigned int));
++static unsigned int hash2 P((register const char *, register size_t));
+ 
+ #include "token2.h"
+diff --git a/cpp/token2.h b/cpp/token2.h
+index 62e69b1..f7ac2fd 100644
+--- a/cpp/token2.h
++++ b/cpp/token2.h
+@@ -1,57 +1,87 @@
+-/* C code produced by gperf version 2.7.1 (19981006 egcs) */
++/* ANSI-C code produced by gperf version 3.1 */
+ /* Command-line: gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok  */
+ 
++#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
++      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
++      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
++      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
++      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
++      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
++      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
++      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
++      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
++      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
++      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
++      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
++      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
++      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
++      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
++      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
++      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
++      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
++      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
++      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
++      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
++      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
++      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
++/* The character set is not based on ISO-646.  */
++#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gperf@gnu.org>."
++#endif
++
++
+ #define TOTAL_KEYWORDS 34
+ #define MIN_WORD_LENGTH 2
+ #define MAX_WORD_LENGTH 8
+-#define MIN_HASH_VALUE 2
+-#define MAX_HASH_VALUE 69
+-/* maximum key range = 68, duplicates = 0 */
++#define MIN_HASH_VALUE 3
++#define MAX_HASH_VALUE 44
++/* maximum key range = 42, duplicates = 0 */
+ 
+ #ifdef __GNUC__
+ __inline
++#else
++#ifdef __cplusplus
++inline
++#endif
+ #endif
+ static unsigned int
+-hash2 (str, len)
+-     register const char *str;
+-     register unsigned int len;
++hash2 (register const char *str, register size_t len)
+ {
+   static unsigned char asso_values[] =
+     {
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-       5, 70, 70, 70, 70, 70,  0, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70,  0, 70,  5,  5, 10,
+-      10, 20, 20, 25, 70,  0, 70, 70, 50, 70,
+-       0, 15,  0, 70, 15,  0, 40, 20,  0,  0,
+-      70, 70, 10, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
+-      70, 70, 70, 70, 70, 70
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      25, 45, 45, 45, 45, 45, 10, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45,  5, 45, 30, 10, 10,
++      25, 20,  0, 10, 45,  5, 45, 45, 25, 45,
++      10, 10,  5, 45,  0,  5,  0,  0,  0, 20,
++      45, 45, 25, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
++      45, 45, 45, 45, 45, 45
+     };
+-  register int hval = len;
++  register unsigned int hval = len;
+ 
+   switch (hval)
+     {
+       default:
+-      case 3:
+         hval += asso_values[(unsigned char)str[2]];
++      /*FALLTHROUGH*/
+       case 2:
+       case 1:
+         hval += asso_values[(unsigned char)str[0]];
+@@ -60,78 +90,97 @@ hash2 (str, len)
+   return hval;
+ }
+ 
+-#ifdef __GNUC__
+-__inline
+-#endif
+ struct token_trans *
+-is_ckey (str, len)
+-     register const char *str;
+-     register unsigned int len;
++is_ckey (register const char *str, register size_t len)
+ {
+   static struct token_trans wordlist[] =
+     {
++      {""}, {""}, {""},
++#line 16 "token2.tok"
++      {"for",		TK_FOR},
+       {""}, {""},
++#line 22 "token2.tok"
++      {"return",		TK_RETURN},
++#line 18 "token2.tok"
+       {"if",		TK_IF},
+-      {""},
++#line 19 "token2.tok"
++      {"int",		TK_INT},
++#line 32 "token2.tok"
+       {"void",		TK_VOID},
+-      {"while",		TK_WHILE},
++#line 30 "token2.tok"
++      {"union",		TK_UNION},
++#line 27 "token2.tok"
++      {"struct",		TK_STRUCT},
++#line 29 "token2.tok"
++      {"typedef",	TK_TYPEDEF},
++#line 31 "token2.tok"
++      {"unsigned",	TK_UNSIGNED},
++#line 17 "token2.tok"
++      {"goto",		TK_GOTO},
++#line 15 "token2.tok"
++      {"float",		TK_FLOAT},
++#line 28 "token2.tok"
+       {"switch",		TK_SWITCH},
+       {""},
+-      {"__LINE__",	TK_LINE},
+-      {""}, {""},
+-      {"static",		TK_STATIC},
+-      {"do",		TK_DO},
+-      {"__FILE__",	TK_FILE},
++#line 21 "token2.tok"
++      {"register",	TK_REGISTER},
++#line 5 "token2.tok"
+       {"case",		TK_CASE},
+-      {"const",		TK_CONST},
+-      {"sizeof",		TK_SIZEOF},
++#line 23 "token2.tok"
++      {"short",		TK_SHORT},
++#line 24 "token2.tok"
++      {"signed",		TK_SIGNED},
+       {""},
++#line 36 "token2.tok"
++      {"__LINE__",	TK_LINE},
++#line 13 "token2.tok"
++      {"enum",		TK_ENUM},
++#line 7 "token2.tok"
++      {"const",		TK_CONST},
++#line 14 "token2.tok"
++      {"extern",		TK_EXTERN},
++#line 10 "token2.tok"
++      {"do",		TK_DO},
++#line 8 "token2.tok"
+       {"continue",	TK_CONTINUE},
+-      {"char",		TK_CHAR},
+-      {"short",		TK_SHORT},
+-      {"struct",		TK_STRUCT},
+-      {""}, {""},
++#line 12 "token2.tok"
+       {"else",		TK_ELSE},
+-      {"union",		TK_UNION},
+-      {""}, {""},
+-      {"unsigned",	TK_UNSIGNED},
+-      {""},
+-      {"break",		TK_BREAK},
+-      {"signed",		TK_SIGNED},
+-      {""}, {""}, {""}, {""},
++#line 34 "token2.tok"
++      {"while",		TK_WHILE},
++#line 11 "token2.tok"
+       {"double",		TK_DOUBLE},
++#line 9 "token2.tok"
+       {"default",	TK_DEFAULT},
+-      {"for",		TK_FOR},
+-      {""},
+-      {"float",		TK_FLOAT},
+-      {""}, {""},
+-      {"int",		TK_INT},
+-      {"enum",		TK_ENUM},
+-      {""}, {""},
+-      {"typedef",	TK_TYPEDEF},
+-      {"register",	TK_REGISTER},
++#line 33 "token2.tok"
++      {"volatile",	TK_VOLATILE},
++#line 3 "token2.tok"
+       {"auto",		TK_AUTO},
+-      {""}, {""}, {""}, {""},
++#line 4 "token2.tok"
++      {"break",		TK_BREAK},
++#line 25 "token2.tok"
++      {"sizeof",		TK_SIZEOF},
++      {""},
++#line 35 "token2.tok"
++      {"__FILE__",	TK_FILE},
++#line 20 "token2.tok"
+       {"long",		TK_LONG},
+-      {""}, {""}, {""},
+-      {"volatile",	TK_VOLATILE},
+-      {""}, {""},
+-      {"return",		TK_RETURN},
+-      {""}, {""}, {""}, {""},
+-      {"extern",		TK_EXTERN},
++      {""},
++#line 26 "token2.tok"
++      {"static",		TK_STATIC},
+       {""}, {""},
+-      {"goto",		TK_GOTO}
++#line 6 "token2.tok"
++      {"char",		TK_CHAR}
+     };
+ 
+   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
+     {
+-      register int key = hash2 (str, len);
++      register unsigned int key = hash2 (str, len);
+ 
+-      if (key <= MAX_HASH_VALUE && key >= 0)
++      if (key <= MAX_HASH_VALUE)
+         {
+           register const char *s = wordlist[key].name;
+ 
+-          if (*str == *s && !strncmp (str + 1, s + 1, len - 1))
++          if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
+             return &wordlist[key];
+         }
+     }
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index c987342..a5f40fa 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -9,6 +9,8 @@ PV = "${BASE_PV}+git${SRCPV}"
 SRCREV = "e254e0b19651d3b8a20225b40281c9974a95dec4"
 SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https \
     file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch \
+    file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch \
+    file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
 "
 SRC_URI_append_class-target = " \
     file://0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch \
-- 
2.32.0

