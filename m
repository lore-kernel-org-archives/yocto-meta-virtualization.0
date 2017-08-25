Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9065E00CC6; Fri, 25 Aug 2017 13:13:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED34CE00B1B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 13:13:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7PKD4nO016178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 13:13:05 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 Aug 2017 13:13:04 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 25 Aug 2017 13:13:04 -0700
Message-ID: <20170825201304.47716-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] openvswitch: Fix compile problems with i586-nlp
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
X-List-Received-Date: Fri, 25 Aug 2017 20:13:06 -0000
Content-Type: text/plain

If you have in your $CC from the compiler template any kind of
directive which contains a comma character it is going to cause ovs to
not build due to the macro expansion in the Makefile:

CC = $(if $(C),env REAL_CC="'"$CC"'" CHECK="$(SPARSE) -I $(top_srcdir)/include/sparse $(SPARSEFLAGS) $(SPARSE_EXTRA_INCLUDES) " cgcc $(CGCCFLAGS),'"$CC"

Put more simply:

CC = $(if $(C), CONFIGURE_CC_DEFINITION, cgcc args CONFIGURE_CC_DEFINITION)

The CONFIGURE_CC_DEFINITION for the i585-nlp definition had
"-Wa,-momit-lock-prefix=yes".  The comma there caused a strings to
"break" in the wrong place in the $(if) macro and the build of recipe
will fail with the error shown below:

/bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
/bin/sh: -c: line 3: syntax error: unexpected end of file

The solution is to transform the "-Wa," -> "-Xassembler ".

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-networking/openvswitch/openvswitch.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index ab5a7e4..58e0fcb 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -86,6 +86,12 @@ INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
 INITSCRIPT_NAME_${PN}-testcontroller = "openvswitch-testcontroller"
 INITSCRIPT_PARAMS_${PN}-testcontroller = "defaults 72"
 
+do_configure_prepend() {
+	# Work around the for Makefile CC=$(if ....) by swapping out any
+	# "-Wa," assembly directives with "-Xassembler
+	CC=`echo '${CC}' | sed 's/-Wa,/-Xassembler /g'`
+}
+
 do_install_append() {
 	install -d ${D}/${sysconfdir}/default/
 	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
-- 
2.11.0


