Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D307E00CEC; Tue,  6 Oct 2015 11:41:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB525E00CEC
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 11:41:26 -0700 (PDT)
Received: from yow-dellw-af.wrs.com (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id t96IfNeD017950;
	Tue, 6 Oct 2015 11:41:25 -0700 (PDT)
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Oct 2015 14:41:12 -0400
Message-Id: <1444156875-21115-5-git-send-email-amy.fong@windriver.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1444156875-21115-1-git-send-email-amy.fong@windriver.com>
References: <1444156875-21115-1-git-send-email-amy.fong@windriver.com>
Subject: [PATCH 4/7] Backport go-cross: set alignment for the .rel.plt section on 32-bit architectures
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 18:41:33 -0000

submitted to upstream https://github.com/errordeveloper/oe-meta-go

    go-cross: set alignment for the .rel.plt section on 32-bit architectures

    This patch is cherry picked from golang's upstream, and this patch will
    fix the package of etcd's following build error:

    ERROR: debugedit failed with exit code 256 (cmd was 'bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit' -b 'bitbake_build/tmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi' -d '/usr/src/debug' -i -l 'bitbake_build/tmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/etcd/git-r0/debugsources.list' 'bitbake_build/tmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/etcd/git-r0/package/usr/bin/etcd'):
    bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit: elf_update: invalid section alignment
    ERROR: Function failed: split_and_strip_files
    ERROR: Logfile of failure stored in: bitbake_build/tmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/etcd/git-r0/temp/do_package/log.do_package.109414
    ERROR: Task 12 (layers/meta-overc/meta-pod/recipes-connectivity/etcd/etcd_git.bb, do_package) failed with exit code '1'

    Signed-off-by: fupan li <fupan.li@windriver.com>

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 ...alignment-for-the-.rel.plt-section-on-32-.patch | 30 ++++++++++++++++++++++
 recipes-devtools/go-cross/go-cross_1.3.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch

diff --git a/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch b/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
new file mode 100644
index 0000000..4cfa9d1
--- /dev/null
+++ b/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
@@ -0,0 +1,30 @@
+From 855145d5c03c4b4faf60736c38d7a299c682af4a Mon Sep 17 00:00:00 2001
+From: Shenghou Ma <minux@golang.org>
+Date: Sat, 7 Feb 2015 14:06:02 -0500
+Subject: [PATCH] cmd/ld: set alignment for the .rel.plt section on 32-bit
+ architectures
+
+Fixes #9802.
+
+Change-Id: I22c52a37bdb23a14cc4615c9519431bb14ca81ca
+Reviewed-on: https://go-review.googlesource.com/4170
+Reviewed-by: Ian Lance Taylor <iant@golang.org>
+---
+ src/cmd/ld/elf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/cmd/ld/elf.c b/src/cmd/ld/elf.c
+index 12ced98..97ed4bd 100644
+--- a/src/cmd/ld/elf.c
++++ b/src/cmd/ld/elf.c
+@@ -1363,6 +1363,7 @@ asmbelf(vlong symo)
+ 			sh->type = SHT_REL;
+ 			sh->flags = SHF_ALLOC;
+ 			sh->entsize = ELF32RELSIZE;
++			sh->addralign = 4;
+ 			sh->link = elfshname(".dynsym")->shnum;
+ 			shsym(sh, linklookup(ctxt, ".rel.plt", 0));
+ 
+-- 
+1.9.1
+
diff --git a/recipes-devtools/go-cross/go-cross_1.3.bb b/recipes-devtools/go-cross/go-cross_1.3.bb
index d689e61..1fb4870 100644
--- a/recipes-devtools/go-cross/go-cross_1.3.bb
+++ b/recipes-devtools/go-cross/go-cross_1.3.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c123b3fedb48ff
 SRC_URI += "\
         file://bsd_svid_source.patch \
         file://ccache.patch \
+        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch \
         "
 
 do_compile() {
-- 
2.5.3


