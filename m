Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.94176.1638376917795703643
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DSe0CmkP;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g14so104327742edb.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ACf8x597tacOcg9LtZ9DitMh1X70crZ+Ubzd41uimk=;
        b=DSe0CmkPVKfUJX/41j2qS7hB9MHOKmHhh7M76bJWabXVkwZ3pFxMUzutPIF/jlPtvF
         guo396D7wJpiHUKl0FK1NGsWopH3KtRaOy3ajA83kj29cpNK8/Lgxa2Ajk7WEjvVdrvs
         wKfblzlNXyRxoOXSIFKFgDyg32jp7kpqRuMVVutDwAYzwLhe0m9Y8KEBeCfqOd8jv6bg
         l+XejqaOoc44Ux2Asa21iV71Ooqy7Pg+E0kaeQWoS1HuLlWt7HqrGx33+1/xi82KAWaM
         or1zwowq+CvFoqSlsA+mZGo2W1Rdi8o/jVM+eie/9pRCpTFQ9Glq8ULtl38lTYsMLDla
         YZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ACf8x597tacOcg9LtZ9DitMh1X70crZ+Ubzd41uimk=;
        b=hVxA/T/EBP9jb2/YyrBL23BBBI7UEpF1cnbjaSFitm5h7hqRKmc/xj+HI6yw5RahQR
         IcDLbHIP7onfUPmpLMZb7OSz3DF4DBgzmzbYhE7XqEo6FkNpjKZMg6WfsCCWeOgXyqJa
         eaI5NDWXiZEis5W0g9wytT031H9u7flh6UYUcx2tKU6mxXYknz8aWfG2At23mR+AJp4Q
         LMK1l+kCOsxahls+XnyGdjUJX3+lNZrEtjUVmz4/FE5GCWvSH+gvYCksXXpLlwPk5wkh
         A7TCTsVXv8N6jzdCThASbpQVls6OYMrmgd8Yq62wjjSBfBVu4XtGo4ZkTGXQtHKYfwkl
         tOcw==
X-Gm-Message-State: AOAM533TxTQxRoo+Um1Lou0VMHGn08uzJHNx3bmce4HuQ8P3zWctLwW4
	KB45DYs/sQuXPQVU8+PXh7peUthlKdo=
X-Google-Smtp-Source: ABdhPJwqVTW/ooJ85pRil83hQJzbBqdP/hQ6srUCAXsC3H94PLLaFQ5jAB7cIGUX4oemv8B7KF0rzw==
X-Received: by 2002:a05:6402:1a4d:: with SMTP id bf13mr9859458edb.101.1638376916125;
        Wed, 01 Dec 2021 08:41:56 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h10sm181819edj.1.2021.12.01.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:55 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 11/13] dev86: remove the pre-generated token[12].h and force gperf to generate them in do_compile
Date: Wed,  1 Dec 2021 17:41:34 +0100
Message-Id: <20211201164136.33802-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1.tok-to-make-new-gperf-happy-regen..patch | 230 +-----------
 ...gen-token2.h-token1.h-with-gperf-3.1.patch | 332 +-----------------
 recipes-extended/dev86/dev86_git.bb           |   2 +
 3 files changed, 5 insertions(+), 559 deletions(-)

diff --git a/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch b/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch
index 38e4d81..47c283b 100644
--- a/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch
+++ b/recipes-extended/dev86/dev86/0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch
@@ -8,239 +8,13 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Upstream-Status: Pending [it was submitted in https://github.com/jbruchon/dev86/pull/19
 but then closed by author]
 
+Remove regenerated token1.h as we'll force it to regenerate in do_compile.
+
 ---
  cpp/token1.h   | 170 +++++++++++++++++++++++++++++++++----------------
  cpp/token1.tok |   2 +-
  2 files changed, 115 insertions(+), 57 deletions(-)
 
-diff --git a/cpp/token1.h b/cpp/token1.h
-index 2e2b9eb..bb313aa 100644
---- a/cpp/token1.h
-+++ b/cpp/token1.h
-@@ -1,15 +1,48 @@
--/* C code produced by gperf version 2.7.1 (19981006 egcs) */
-+/* C code produced by gperf version 3.0.4 */
- /* Command-line: gperf -aptTc -N is_ctok -H hash1 token1.tok  */
-+/* Computed positions: -k'1-2' */
-+
-+#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-+      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-+      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
-+      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
-+      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
-+      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
-+      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
-+      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
-+      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
-+      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
-+      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
-+      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
-+      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
-+      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
-+      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
-+      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
-+      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
-+      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
-+      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
-+      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
-+      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
-+      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
-+      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
-+/* The character set is not based on ISO-646.  */
-+error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
-+#endif
-+
- 
- #define TOTAL_KEYWORDS 23
- #define MIN_WORD_LENGTH 2
- #define MAX_WORD_LENGTH 3
- #define MIN_HASH_VALUE 2
--#define MAX_HASH_VALUE 63
--/* maximum key range = 62, duplicates = 0 */
-+#define MAX_HASH_VALUE 62
-+/* maximum key range = 61, duplicates = 0 */
- 
- #ifdef __GNUC__
- __inline
-+#else
-+#ifdef __cplusplus
-+inline
-+#endif
- #endif
- static unsigned int
- hash1 (str, len)
-@@ -18,38 +51,41 @@ hash1 (str, len)
- {
-   static unsigned char asso_values[] =
-     {
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64,  1, 64, 64, 64,  3, 25, 64,
--      64, 64, 13, 18, 64,  8, 30, 15, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--       5,  0, 20, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 30, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 23, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
--      64, 64, 64, 64, 64, 64
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63,  6, 63, 63, 63, 28,  8, 63,
-+      63, 63, 23,  3, 63, 25, 20, 18, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      10,  5,  0, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 13, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 30, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63, 63, 63, 63, 63,
-+      63, 63, 63, 63, 63, 63
-     };
--  return len + asso_values[(unsigned char)str[len - 1]] + asso_values[(unsigned char)str[0]];
-+  return len + asso_values[(unsigned char)str[1]] + asso_values[(unsigned char)str[0]];
- }
- 
- #ifdef __GNUC__
- __inline
-+#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
-+__attribute__ ((__gnu_inline__))
-+#endif
- #endif
- struct token_trans *
- is_ctok (str, len)
-@@ -59,46 +95,68 @@ is_ctok (str, len)
-   static struct token_trans wordlist[] =
-     {
-       {""}, {""},
-+#line 14 "token1.tok"
-+      {">>",	TK_RIGHT_OP},
-+#line 4 "token1.tok"
-+      {">>=",	TK_RIGHT_ASSIGN},
-+      {""}, {""}, {""},
-+#line 22 "token1.tok"
-+      {">=",	TK_GE_OP},
-+#line 16 "token1.tok"
-+      {"++",	TK_INC_OP},
-+      {""},
-+#line 6 "token1.tok"
-+      {"+=",	TK_ADD_ASSIGN},
-+      {""},
-+#line 23 "token1.tok"
-       {"==",	TK_EQ_OP},
-+#line 24 "token1.tok"
-       {"!=",	TK_NE_OP},
-       {""},
--      {"%=",	TK_MOD_ASSIGN},
-+#line 11 "token1.tok"
-+      {"&=",	TK_AND_ASSIGN},
-       {""},
-+#line 21 "token1.tok"
-       {"<=",	TK_LE_OP},
--      {"<<=",	TK_LEFT_ASSIGN},
-+#line 19 "token1.tok"
-+      {"&&",	TK_AND_OP},
-       {""},
--      {"-=",	TK_SUB_ASSIGN},
-+#line 12 "token1.tok"
-+      {"^=",	TK_XOR_ASSIGN},
-       {""},
-+#line 15 "token1.tok"
-       {"<<",	TK_LEFT_OP},
--      {""}, {""},
--      {"*=",	TK_MUL_ASSIGN},
-+#line 5 "token1.tok"
-+      {"<<=",	TK_LEFT_ASSIGN},
-       {""},
-+#line 9 "token1.tok"
-       {"/=",	TK_DIV_ASSIGN},
--      {"--",	TK_DEC_OP},
-       {""},
--      {"+=",	TK_ADD_ASSIGN},
--      {""},
--      {">=",	TK_GE_OP},
--      {">>=",	TK_RIGHT_ASSIGN},
--      {""},
--      {"|=",	TK_OR_ASSIGN},
-+#line 18 "token1.tok"
-+      {"->",	TK_PTR_OP},
-+      {""}, {""},
-+#line 8 "token1.tok"
-+      {"*=",	TK_MUL_ASSIGN},
-       {""},
--      {"&=",	TK_AND_ASSIGN},
-+#line 7 "token1.tok"
-+      {"-=",	TK_SUB_ASSIGN},
-       {""}, {""},
--      {"->",	TK_PTR_OP},
-+#line 10 "token1.tok"
-+      {"%=",	TK_MOD_ASSIGN},
-       {""},
--      {"^=",	TK_XOR_ASSIGN},
--      {""}, {""}, {""}, {""}, {""},
--      {"++",	TK_INC_OP},
--      {""}, {""}, {""},
--      {">>",	TK_RIGHT_OP},
--      {""}, {""}, {""}, {""}, {""},
--      {"||",	TK_OR_OP},
--      {""}, {""}, {""},
--      {"&&",	TK_AND_OP},
--      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
-+#line 13 "token1.tok"
-+      {"|=",	TK_OR_ASSIGN},
-+      {""}, {""}, {""}, {""},
-+#line 25 "token1.tok"
-       {"..",	TK_WORD},
--      {"...",	TK_ELLIPSIS}
-+#line 3 "token1.tok"
-+      {"...",	TK_ELLIPSIS},
-+      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
-+#line 17 "token1.tok"
-+      {"--",	TK_DEC_OP},
-+      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
-+#line 20 "token1.tok"
-+      {"||",	TK_OR_OP}
-     };
- 
-   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
-@@ -109,7 +167,7 @@ is_ctok (str, len)
-         {
-           register const char *s = wordlist[key].name;
- 
--          if (*str == *s && !strncmp (str + 1, s + 1, len - 1))
-+          if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
-             return &wordlist[key];
-         }
-     }
 diff --git a/cpp/token1.tok b/cpp/token1.tok
 index cd668ce..a98926f 100644
 --- a/cpp/token1.tok
diff --git a/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch b/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch
index 8787369..4a5bb25 100644
--- a/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch
+++ b/recipes-extended/dev86/dev86/0004-regen-token2.h-token1.h-with-gperf-3.1.patch
@@ -9,6 +9,7 @@ Subject: [PATCH] regen token2.h, token1.h with gperf-3.1
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
+Remove regenerated token2.h as we'll force it to regenerate in do_compile.
 ---
  cpp/cc.h     |   4 +-
  cpp/token1.c |   2 +-
@@ -44,66 +45,6 @@ index f3aa420..cc47f3e 100644
 +static unsigned int hash1 P((register const char *, register size_t));
  
  #include "token1.h"
-diff --git a/cpp/token1.h b/cpp/token1.h
-index bb313aa..2af88c2 100644
---- a/cpp/token1.h
-+++ b/cpp/token1.h
-@@ -1,4 +1,4 @@
--/* C code produced by gperf version 3.0.4 */
-+/* ANSI-C code produced by gperf version 3.1 */
- /* Command-line: gperf -aptTc -N is_ctok -H hash1 token1.tok  */
- /* Computed positions: -k'1-2' */
- 
-@@ -26,7 +26,7 @@
-       && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
-       && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
- /* The character set is not based on ISO-646.  */
--error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
-+#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gperf@gnu.org>."
- #endif
- 
- 
-@@ -45,9 +45,7 @@ inline
- #endif
- #endif
- static unsigned int
--hash1 (str, len)
--     register const char *str;
--     register unsigned int len;
-+hash1 (register const char *str, register size_t len)
- {
-   static unsigned char asso_values[] =
-     {
-@@ -81,16 +79,8 @@ hash1 (str, len)
-   return len + asso_values[(unsigned char)str[1]] + asso_values[(unsigned char)str[0]];
- }
- 
--#ifdef __GNUC__
--__inline
--#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
--__attribute__ ((__gnu_inline__))
--#endif
--#endif
- struct token_trans *
--is_ctok (str, len)
--     register const char *str;
--     register unsigned int len;
-+is_ctok (register const char *str, register size_t len)
- {
-   static struct token_trans wordlist[] =
-     {
-@@ -161,9 +151,9 @@ is_ctok (str, len)
- 
-   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
-     {
--      register int key = hash1 (str, len);
-+      register unsigned int key = hash1 (str, len);
- 
--      if (key <= MAX_HASH_VALUE && key >= 0)
-+      if (key <= MAX_HASH_VALUE)
-         {
-           register const char *s = wordlist[key].name;
- 
 diff --git a/cpp/token2.c b/cpp/token2.c
 index b4d22b1..fbc790d 100644
 --- a/cpp/token2.c
@@ -116,274 +57,3 @@ index b4d22b1..fbc790d 100644
 +static unsigned int hash2 P((register const char *, register size_t));
  
  #include "token2.h"
-diff --git a/cpp/token2.h b/cpp/token2.h
-index 62e69b1..f7ac2fd 100644
---- a/cpp/token2.h
-+++ b/cpp/token2.h
-@@ -1,57 +1,87 @@
--/* C code produced by gperf version 2.7.1 (19981006 egcs) */
-+/* ANSI-C code produced by gperf version 3.1 */
- /* Command-line: gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok  */
- 
-+#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-+      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-+      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
-+      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
-+      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
-+      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
-+      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
-+      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
-+      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
-+      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
-+      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
-+      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
-+      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
-+      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
-+      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
-+      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
-+      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
-+      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
-+      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
-+      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
-+      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
-+      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
-+      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
-+/* The character set is not based on ISO-646.  */
-+#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gperf@gnu.org>."
-+#endif
-+
-+
- #define TOTAL_KEYWORDS 34
- #define MIN_WORD_LENGTH 2
- #define MAX_WORD_LENGTH 8
--#define MIN_HASH_VALUE 2
--#define MAX_HASH_VALUE 69
--/* maximum key range = 68, duplicates = 0 */
-+#define MIN_HASH_VALUE 3
-+#define MAX_HASH_VALUE 44
-+/* maximum key range = 42, duplicates = 0 */
- 
- #ifdef __GNUC__
- __inline
-+#else
-+#ifdef __cplusplus
-+inline
-+#endif
- #endif
- static unsigned int
--hash2 (str, len)
--     register const char *str;
--     register unsigned int len;
-+hash2 (register const char *str, register size_t len)
- {
-   static unsigned char asso_values[] =
-     {
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--       5, 70, 70, 70, 70, 70,  0, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70,  0, 70,  5,  5, 10,
--      10, 20, 20, 25, 70,  0, 70, 70, 50, 70,
--       0, 15,  0, 70, 15,  0, 40, 20,  0,  0,
--      70, 70, 10, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
--      70, 70, 70, 70, 70, 70
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      25, 45, 45, 45, 45, 45, 10, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45,  5, 45, 30, 10, 10,
-+      25, 20,  0, 10, 45,  5, 45, 45, 25, 45,
-+      10, 10,  5, 45,  0,  5,  0,  0,  0, 20,
-+      45, 45, 25, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
-+      45, 45, 45, 45, 45, 45
-     };
--  register int hval = len;
-+  register unsigned int hval = len;
- 
-   switch (hval)
-     {
-       default:
--      case 3:
-         hval += asso_values[(unsigned char)str[2]];
-+      /*FALLTHROUGH*/
-       case 2:
-       case 1:
-         hval += asso_values[(unsigned char)str[0]];
-@@ -60,78 +90,97 @@ hash2 (str, len)
-   return hval;
- }
- 
--#ifdef __GNUC__
--__inline
--#endif
- struct token_trans *
--is_ckey (str, len)
--     register const char *str;
--     register unsigned int len;
-+is_ckey (register const char *str, register size_t len)
- {
-   static struct token_trans wordlist[] =
-     {
-+      {""}, {""}, {""},
-+#line 16 "token2.tok"
-+      {"for",		TK_FOR},
-       {""}, {""},
-+#line 22 "token2.tok"
-+      {"return",		TK_RETURN},
-+#line 18 "token2.tok"
-       {"if",		TK_IF},
--      {""},
-+#line 19 "token2.tok"
-+      {"int",		TK_INT},
-+#line 32 "token2.tok"
-       {"void",		TK_VOID},
--      {"while",		TK_WHILE},
-+#line 30 "token2.tok"
-+      {"union",		TK_UNION},
-+#line 27 "token2.tok"
-+      {"struct",		TK_STRUCT},
-+#line 29 "token2.tok"
-+      {"typedef",	TK_TYPEDEF},
-+#line 31 "token2.tok"
-+      {"unsigned",	TK_UNSIGNED},
-+#line 17 "token2.tok"
-+      {"goto",		TK_GOTO},
-+#line 15 "token2.tok"
-+      {"float",		TK_FLOAT},
-+#line 28 "token2.tok"
-       {"switch",		TK_SWITCH},
-       {""},
--      {"__LINE__",	TK_LINE},
--      {""}, {""},
--      {"static",		TK_STATIC},
--      {"do",		TK_DO},
--      {"__FILE__",	TK_FILE},
-+#line 21 "token2.tok"
-+      {"register",	TK_REGISTER},
-+#line 5 "token2.tok"
-       {"case",		TK_CASE},
--      {"const",		TK_CONST},
--      {"sizeof",		TK_SIZEOF},
-+#line 23 "token2.tok"
-+      {"short",		TK_SHORT},
-+#line 24 "token2.tok"
-+      {"signed",		TK_SIGNED},
-       {""},
-+#line 36 "token2.tok"
-+      {"__LINE__",	TK_LINE},
-+#line 13 "token2.tok"
-+      {"enum",		TK_ENUM},
-+#line 7 "token2.tok"
-+      {"const",		TK_CONST},
-+#line 14 "token2.tok"
-+      {"extern",		TK_EXTERN},
-+#line 10 "token2.tok"
-+      {"do",		TK_DO},
-+#line 8 "token2.tok"
-       {"continue",	TK_CONTINUE},
--      {"char",		TK_CHAR},
--      {"short",		TK_SHORT},
--      {"struct",		TK_STRUCT},
--      {""}, {""},
-+#line 12 "token2.tok"
-       {"else",		TK_ELSE},
--      {"union",		TK_UNION},
--      {""}, {""},
--      {"unsigned",	TK_UNSIGNED},
--      {""},
--      {"break",		TK_BREAK},
--      {"signed",		TK_SIGNED},
--      {""}, {""}, {""}, {""},
-+#line 34 "token2.tok"
-+      {"while",		TK_WHILE},
-+#line 11 "token2.tok"
-       {"double",		TK_DOUBLE},
-+#line 9 "token2.tok"
-       {"default",	TK_DEFAULT},
--      {"for",		TK_FOR},
--      {""},
--      {"float",		TK_FLOAT},
--      {""}, {""},
--      {"int",		TK_INT},
--      {"enum",		TK_ENUM},
--      {""}, {""},
--      {"typedef",	TK_TYPEDEF},
--      {"register",	TK_REGISTER},
-+#line 33 "token2.tok"
-+      {"volatile",	TK_VOLATILE},
-+#line 3 "token2.tok"
-       {"auto",		TK_AUTO},
--      {""}, {""}, {""}, {""},
-+#line 4 "token2.tok"
-+      {"break",		TK_BREAK},
-+#line 25 "token2.tok"
-+      {"sizeof",		TK_SIZEOF},
-+      {""},
-+#line 35 "token2.tok"
-+      {"__FILE__",	TK_FILE},
-+#line 20 "token2.tok"
-       {"long",		TK_LONG},
--      {""}, {""}, {""},
--      {"volatile",	TK_VOLATILE},
--      {""}, {""},
--      {"return",		TK_RETURN},
--      {""}, {""}, {""}, {""},
--      {"extern",		TK_EXTERN},
-+      {""},
-+#line 26 "token2.tok"
-+      {"static",		TK_STATIC},
-       {""}, {""},
--      {"goto",		TK_GOTO}
-+#line 6 "token2.tok"
-+      {"char",		TK_CHAR}
-     };
- 
-   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
-     {
--      register int key = hash2 (str, len);
-+      register unsigned int key = hash2 (str, len);
- 
--      if (key <= MAX_HASH_VALUE && key >= 0)
-+      if (key <= MAX_HASH_VALUE)
-         {
-           register const char *s = wordlist[key].name;
- 
--          if (*str == *s && !strncmp (str + 1, s + 1, len - 1))
-+          if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
-             return &wordlist[key];
-         }
-     }
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index a5f40fa..9488d90 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -24,6 +24,8 @@ BBCLASSEXTEND = "native"
 EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
 
 do_compile() {
+	# always regenerate token1.h, token2.h for deterministic behavior
+	rm -f ${S}/cpp/token1.h ${S}/cpp/token2.h
 	oe_runmake make.fil
 	oe_runmake -f make.fil bcc86 as86 ld86
 }
-- 
2.32.0

