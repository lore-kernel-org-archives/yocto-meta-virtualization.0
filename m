Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCCA3E00C43; Tue,  2 Apr 2019 18:36:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA96CE00798
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Apr 2019 18:36:38 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x331aXZo012756
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2019 18:36:33 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Apr 2019 18:36:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 2 Apr 2019 21:36:26 -0400
Message-ID: <1554255386-24422-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] consul: don't build with the '-linkshared' option
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
X-List-Received-Date: Wed, 03 Apr 2019 01:36:39 -0000
Content-Type: text/plain

We are currently seeing the following error:
type..eUfRrckI: missing section for relocation target type..FEeY9FdU
...

This is similar to the reported issues
http://www.lyddzz.com/github_/golang/go/issues/30768
and
https://github.com/hashicorp/consul/issues/5486 (but this one appears
to be a report of 'our' issue so isn't really valid)

The go.bbclass currently completes 2 builds (if GO_DYNLINK is set),
one without '-linkshared' and one with. The '--linkshared' option is
marked as experimental (https://golang.org/cmd/link/ -- "-linkshared
Link against installed Go shared libraries (experimental)").

By setting GO_LINKSHARED prior to inheriting go.bbclass we can
overwrite the default compile behavior and only perform the build
without the '-linkshared' option. This shouldn't change the
functionality of consul and we can revert to the default behavior when
the issues have been addressed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index f9fb236..ab78cbd 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -13,6 +13,11 @@ S = "${WORKDIR}/git"
 
 RDEPENDS_${PN}-dev_append = " bash"
 
+# Temporarily workaround an issue with GO 1.12.1
+# http://www.lyddzz.com/github_/golang/go/issues/30768
+# Disable experimental use of '-linkshared'.
+GO_LINKSHARED = ""
+
 inherit systemd go
 
 # Besides the hosts specified in goarch, we do not build for mips.
-- 
2.7.4


