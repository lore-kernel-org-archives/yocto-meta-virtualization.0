Return-Path: <joakim.roubert@axis.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A433E00E32; Wed, 23 Oct 2019 03:25:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	T_FILL_THIS_FORM_SHORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [195.60.68.11 listed in list.dnswl.org]
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04952E00E2F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 03:24:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 91070183C0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 12:24:57 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 3txFysozIOS2 for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 84B2518343
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 628B81E076
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57A3C1E060
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
Received: from pc33929-1906.se.axis.com (pc33929-1906.se.axis.com
	[10.88.130.51]) by seth.se.axis.com (Postfix) with ESMTP id 4BC1AB5;
	Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
Received: by pc33929-1906.se.axis.com (Postfix, from userid 20727)
	id 3EB3B60107; Wed, 23 Oct 2019 12:24:56 +0200 (CEST)
From: Joakim Roubert <joakim.roubert@axis.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Oct 2019 12:24:39 +0200
Message-Id: <20191023102439.16346-1-joakimr@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Joakim Roubert <joakimr@axis.com>
Subject: [PATCH] kubernetes: Set correct PV release number
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
X-List-Received-Date: Wed, 23 Oct 2019 10:25:01 -0000
Content-Transfer-Encoding: 8bit

Commit c97fe5036ef3df2967d086711e6c0c405941e14b is Kubernetes v1.16.2
(see https://github.com/kubernetes/kubernetes/releases for verification)
and building with the current recipe generates v1.16.2 binaies although
the package names state v1.16.1.

Change-Id: I5701c18cc3ce205ad906eda2595d9ad7f5748b17
---
 recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 6cc05ea..fae554d 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,7 +5,7 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.16.1+git${SRCREV_kubernetes}"
+PV = "v1.16.2+git${SRCREV_kubernetes}"
 SRCREV_kubernetes = "c97fe5036ef3df2967d086711e6c0c405941e14b"
 
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.16;name=kubernetes \
-- 
2.20.1


