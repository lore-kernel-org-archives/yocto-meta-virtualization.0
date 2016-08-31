Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6BA5E0098A; Wed, 31 Aug 2016 12:34:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82738E0094C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 12:34:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VJXwsl012663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 12:33:58 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 12:33:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 15:33:57 -0400
Message-ID: <1472672037-7876-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] custom-licenses: add NewRelic license
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
X-List-Received-Date: Wed, 31 Aug 2016 19:34:03 -0000
Content-Type: text/plain

The python-newrelic package is licensed under several licenses,
including the customer NewRelic license. This has been properly
captured in the LICENSE string in the recipe but since there is no
copy of the license it isn't copied into the package's build
license-destdir which results in the following warning:

  WARNING: core-image-minimal-1.0-r0 do_rootfs: The license listed
  NewRelic was not in the licenses collected for recipe python-newrelic

Add a copy of the license to the layer's custom-licenses folder to
resolve this warning. The license text comes verbatim from the
upstream LICENSE file.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 files/custom-licenses/NewRelic | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 files/custom-licenses/NewRelic

diff --git a/files/custom-licenses/NewRelic b/files/custom-licenses/NewRelic
new file mode 100644
index 0000000..9c2e5e8
--- /dev/null
+++ b/files/custom-licenses/NewRelic
@@ -0,0 +1,33 @@
+  Copyright (c) 2010-2014 New Relic, Inc. All rights reserved.
+
+Certain inventions disclosed in this file may be claimed within patents
+owned or patent applications filed by New Relic, Inc. or third parties.
+Subject to the terms of this notice, New Relic grants you a nonexclusive,
+nontransferable license, without the right to sublicense, to (a) install
+and execute one copy of these files on any number of workstations owned or
+controlled by you and (b) distribute verbatim copies of these files to
+third parties. As a condition to the foregoing grant, you must provide this
+notice along with each copy you distribute and you must not remove, alter,
+or obscure this notice.
+
+All other use, reproduction, modification, distribution, or other
+exploitation of these files is strictly prohibited, except as may be set
+forth in a separate written license agreement between you and New Relic.
+The terms of any such license agreement will control over this notice. The
+license stated above will be automatically terminated and revoked if you
+exceed its scope or violate any of the terms of this notice.
+
+This License does not grant permission to use the trade names, trademarks,
+service marks, or product names of New Relic, except as required for
+reasonable and customary use in describing the origin of this file and
+reproducing the content of this notice. You may not mark or brand this file
+with any trade name, trademarks, service marks, or product names other than
+the original brand (if any) provided by New Relic.
+
+Unless otherwise expressly agreed by New Relic in a separate written
+license agreement, these files are provided AS IS, WITHOUT WARRANTY OF ANY
+KIND, including without any implied warranties of MERCHANTABILITY, FITNESS
+FOR A PARTICULAR PURPOSE, TITLE, or NON-INFRINGEMENT. As a condition to
+your use of these files, you are solely responsible for such use. New Relic
+will have no liability to you for direct, indirect, consequential,
+incidental, special, or punitive damages or for lost profits or data.
-- 
2.1.4


