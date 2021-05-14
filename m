Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6634.1620985929121780612
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eF3P+BmG;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id l1so7842750ejb.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a3kFofRvB2nBk3Tpz5w3HuzDACtAv+iMqmPIfiZ35tc=;
        b=eF3P+BmGLCt4qc8IAmZo0byyYx6hxmku2M+gmZxB6nSufVIYJFXnjThsAGNawc7TjJ
         NH0/GfTbgdlei9CjHEquZMstxi1ObkHFi7PVVkwyDkWJ+8ohE2bUkgnWo8ibiYYUdOXX
         3hIF+1FU7eD5nb14P+QHwCZwIjld2ITTlE7ueanYsglrRN+D2tGTt7H9ryMfPsKkBxOz
         BWWR/Qv2aMYVWLWdhT1JrmNjgift3p9I3fyxQd+o/7fg4AU0XAQK+6qGMDORScGbkslW
         L1HcyErJSFshgkRBY3YCTPjx1H2e/xt9GeqLJCJkVGtwtP1WH5Nf7pjpwHKGVyu3Ea3J
         XOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a3kFofRvB2nBk3Tpz5w3HuzDACtAv+iMqmPIfiZ35tc=;
        b=uFTtRr5D2dVtGqEitzebIHV6B3Jz+he2IUYEYY2d7sc0MDD/op4+LSsr316lgiWCso
         OpMfrLWq8ckvBr3buHsOPlhYfMVccdZppiq2gh9ggGaEimSNVG6k2Rs634M0jb+7Y0rF
         D5EWO0cYSU9kDVYMAqGADnRZbXZVWmZlZ/9WRLD2dLeH/LoGekLAzDIWLinO9V+VpIjm
         HQpQqAXI+3WNuatOv7RZm2wyuKO+IrbuUAYSVFyzRS1FoeG9IU1v4cvZbJNEaeVgP9mn
         yi3n9eh//es3PkSOOv47X7SY4CFUByN/7QQuar38AF5zW964V3wM5sl3W+dFu8OJD7Bz
         AXuA==
X-Gm-Message-State: AOAM532a7SzT1CIcyrNxVOmjsvB8wIMU9rVtdJG32YNl64Kye8lQSAPe
	oeIts69V/evCCn3aOfMXoat2/bFk1KA=
X-Google-Smtp-Source: ABdhPJwCMMgJ7l8u4yDO1l/JCPlcNMkPEIFL5X8Auy4wXDKZxJRjS0y4yCaaWH3WlPbgb2kj3v77gg==
X-Received: by 2002:a17:906:724b:: with SMTP id n11mr48338112ejk.338.1620985927662;
        Fri, 14 May 2021 02:52:07 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x13sm2765882ejs.93.2021.05.14.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:52:07 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] dev86: switch to still maintained fork of dev86
Date: Fri, 14 May 2021 11:51:56 +0200
Message-Id: <20210514095156.1562532-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* as mentioned in:
  https://github.com/lkundrak/dev86/pull/17
  the original lkundrak repo is no longer maintained

* pass only BASE_PV as VERSION in EXTRA_OEMAKE to prevent:
  | version.h:4:20: error: ‘gitAUTOINC’ undeclared (first use in this function)
  |  #define VER_PAT 21+gitAUTOINC+e254e0b196
  |                     ^

* there are many new commits, we need at least that fix for
  newer gperf

git log --oneline v0.16.21..jbruchon/master
e254e0b (jbruchon/master) Merge pull request #21 from tkchia/master
3473bde [libc] update _signal syscall semantics, per ABI change in ELKS at https://github.com/jbruchon/elks/pull/629
d74e90d Merge pull request #20 from tkchia/tkchia/update-syscalls
541a8d5 [libc] update syscall list & ino_t type, per ELKS tree
710e852 Merge pull request #16 from spacerace/master
b215454 Merge pull request #17 from mfld-fr/master
870635e Move EMU86 & MON86 to standalone projects
84e3d00 [mon86] Latest touch before moving
c2f288c [emu86] Latest touch before moving
f7449f3 libc tests for MSDOS target (far away from complete ;))
6cbd64d fixing problem in string.h introduced by myself -.-
39e04cd Merge branch 'master' of https://github.com/spacerace/dev86
b44e43d Added OpenBSD's timingsafe_bcmp() and timingsafe_memcmp()
857c30e Added BSD's strlcat() and strlcpy(), safe string copy/cat
0764e09 typo in string.h
2fb6a3a swab()
4e09d08 strupr()
2bd985f strset()
5a7bb33 strrev()
56be26a strnset()
c919b2d strlwr()
b63f295 h+Mf bzero() strnset() strset() strlwr() strupr() strrev() swab()
5985246 removed old implementation of strstr. if anyone needs this file => remains in git history
7b481c0 added bzero()
776929c Merge pull request #15 from spacerace/master
8206ed2 stdlib.h + Makefile changes for getenv() and system()
b995d1e getenv() implementation
60466fe system() implementation
12439ac note on __mkenv (related to getenv commits from me)
aae041a removed empty line on top of file
6d6d91f removed uneeded empty file (see sound.c)
ff7d37e formatting (tabs)
246418a formatting in one line fixed
4ff1f48 Merge pull request #14 from mfld-fr/emu86
1b8f8db Add data & suspicious opcode breakpoints
798c4a2 Merge pull request #13 from rdebath/jbruchon
2eb4d82 Add .travis.yml for running "make distribution" tests.
2ea54e1 Merge pull request #12 from mgorny/makez
f14f78e build: Always use $(MAKE) to spawn sub-make
dfb9b42 Merge pull request #11 from mfld-fr/emu86
6ae2b54 Make dev86 working "in tree"
224843f Merge pull request #10 from mfld-fr/emu86
e56a958 [emu86] Test against ELKS - Round 3
0099ec8 Merge pull request #9 from mfld-fr/emu86
32865c8 [emu86] Test against ELKS - Round 2
e1aa9bd Merge pull request #8 from mfld-fr/emu86
c7ebb2a [emu86] Optimize execution lookup
57019a7 [emu86] Complete decoding optimization
de516a5 [emu86] Fix mfld-fr#21 : opcode 90h (NOP)
40f7c99 [emu86] Optimize decoding < C0h
91d4c61 [emu86] Fix mfld-fr#16 : add pcat timing options
d519caf [emu86] Fix mfld-fr#14 : trace support
3a479e7 [emu86] Check vector before interrupt
7eec401 Optimize decoding < 80h
98334d3 Fix mfld-fr#8 and warning cleanup
0579c82 Merge pull request #7 from mfld-fr/master
49492b9 [emu86] Add option for tiny model
da6a960 [emu86] fix #19 : remove PT1 test
e3b465f [dis88] Move back from ELKS
f2ea895 Merge pull request #6 from mfld-fr/master
b0700f4 [mon86] First stage removal after second validated
6ef705d [mon86] Fix #18 : Complete host tool
1fa5a70 Fix #10 and #11 : Target specific code
22c7770 Merge branch 'bug86'
e25c996 [mon86] Tune host tool for read & write
47aadb5 [mon86] Fix #15 : Cleanup in host tool
ae7c628 [mon86] Makefile for host part + more testing
ae6c84a [mon86] New host tool + fix context parsing
c9205ac Add missing void types to libc/misc/qsort.c
7a4f074 unproto: fix macOS Sierra compilation error reported by scontini76
ac6d924 unproto: better CFLAGS
f86ad57 bcc: if EOF is hit before end of comment, report it as an error
fcdbcd7 limits.h: add PATH_MAX
7239fea include: Add a skeleton for inttypes.h
f3e88f9 Remove accidental ignoring of "include"
0ac417a Merge branch 'master' of https://github.com/jbruchon/dev86
74753fa Fix size_t declaration, add ssize_t declaration
4be53b7 Merge pull request #5 from mfld-fr/master
d5ecd9c [mon86] Second stage tested on real SBC
81b0ab2 [mon86] Second stage monitor completed
b55cbbc [mon86] Trace & break interrupt support
18a5ba8 Merge pull request #4 from mfld-fr/master
77f028b [mon86] First stage monitor completed
07689d4 Merge remote-tracking branch 'upstream/master'
e043007 Revert accidental bcc changes in commit 3c83dee
495b99a [emu86] Test against ELKS - Round 1
5508efa Merge pull request #3 from mfld-fr/master
8aa3313 [emu86] Testing against a real ROM - Round 1
d8ac93e [emu86] Fixed #7 : segment selection & override
5b521d6 [emu86] Test against a real POST - Round 2
3c83dee [emu86] Test against a real POST - Round 1
b45a3d2 [emu86] Command line options
345513c [emu86] Fixed #6 : simplified variable size
2d7d316 [emu86] Fixed #2 + FAR call & ret
8ac48bf Import MON86 standalone project needed by EMU86
1da15c0 Bug fixes after EMU86 testing
1dc5fd3 Merge pull request #2 from mfld-fr/master
24935c0 [emu86] Final touch before the weekend
9090120 [emu86] Fixed #5 : redirect serial I/O to PTS
96dfb1a [emu86] Added memory and stack dumps
4fbcead [emu86] Fixed #1 : move reg num out of val struct
205e47d Improved EMU86 for MON86 testing
377ed40 Merge branch 'master' into emu86
fd3cf7e Added partial ZF and CF flags support
c758426 Merge pull request #1 from mfld-fr/master
72ad336 Merge branch 'master' of git://github.com/jbruchon/dev86 into emu86
2d8398b More support of 8086 instruction set
b2eadba EMU86 second draft
9a8e116 EMU86 first draft
fb3b436 Revert "fix linker alignment for .bss segment"
bf19066 Merge https://github.com/anchorz/dev86-1
4e8476e Revert "copt: fix a minor glitch in copt/rules.86"
1bcc185 Merge remote-tracking branch 'upstream/master'
b0426b2 Force output of initial segment directive
a44b267 fix linker alignment for .bss segment
c0832c8 under CYGWIN bcc requires -o option to compile an .o file otherwise it ends up as .exe and cannot link
80d485b (origin/master, origin/HEAD) Add stdint.h header to recognize some C99 types
29dbfca libc/msdos: program name missing in argv[0]
b0e9b25 libc/msdos: __mkargv es register changed
4a350d3 ar: rename of temporary libary fails on some platforms
cf72284 copt: fix a minor glitch in copt/rules.86
ce888f6 Allow copt rules with empty outputs; fix minor glitch in copt/rules.86
4ed1997 bcc/dbprintf.c: ix implicit declaration warnings
9de6f00 Make a.out.h portable to 64 bit systems
7eae1c0 Change strstr() to Jody's two-way implementation
2f53e83 Add a .gitignore file
c21e14a initial version with minimal routines
fa9c32e Add stdint.h header to recognize some C99 types
6e8432b Minor style cleanups
b7a191c Add "make distclean" and make it really clean everything
dab04fb bootblocks: long -> int32_t for proper building on 64-bit hosts
0d9ee41 bootblocks requires as86_encap to build
---
 recipes-extended/dev86/{dev86_0.16.21.bb => dev86_git.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename recipes-extended/dev86/{dev86_0.16.21.bb => dev86_git.bb} (79%)

diff --git a/recipes-extended/dev86/dev86_0.16.21.bb b/recipes-extended/dev86/dev86_git.bb
similarity index 79%
rename from recipes-extended/dev86/dev86_0.16.21.bb
rename to recipes-extended/dev86/dev86_git.bb
index def7c5c..476bf38 100644
--- a/recipes-extended/dev86/dev86_0.16.21.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -4,15 +4,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
 
-SRCREV = "c6f36cbafa979710b809f117562773dbd6825918"
-SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
+BASE_PV="0.16.21"
+PV = "${BASE_PV}+git${SRCPV}"
+SRCREV = "e254e0b19651d3b8a20225b40281c9974a95dec4"
+SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
 DEPENDS = "gperf-native"
 
 BBCLASSEXTEND = "native"
-EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
 
 do_compile() {
 	# ${S}/Makefile does respect LDFLAGS, but ${S}/cpp/Makefile doesn't when building bcc-cpp
-- 
2.30.2

