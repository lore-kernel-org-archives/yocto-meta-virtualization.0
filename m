Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 869FCE009CA; Mon,  3 Sep 2018 19:58:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF5D4E0090A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Sep 2018 19:58:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w842wAqq004119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Sep 2018 19:58:10 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 19:58:09 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 4 Sep 2018 10:47:50 +0800
Message-ID: <1536029271-11750-5-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
References: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] fs-perms-nagios.txt: add perms conf file
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
X-List-Received-Date: Tue, 04 Sep 2018 02:58:11 -0000
Content-Type: text/plain

Add this perms conf file to avoid do_rootfs failure due to conflicts
among nagios packages.

The error message is like below.

Error: Transaction check error:
  file /etc/nagios conflicts between attempted installs of \
  nagios-core-4.0.8-r0.core2_64 and nagios-nrpe-plugin-2.15-r0.core2_64

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 files/fs-perms-nagios.txt | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 files/fs-perms-nagios.txt

diff --git a/files/fs-perms-nagios.txt b/files/fs-perms-nagios.txt
new file mode 100644
index 0000000..1334cd1
--- /dev/null
+++ b/files/fs-perms-nagios.txt
@@ -0,0 +1,2 @@
+${sysconfdir}/nagios                       0755    nagios    nagios    false - - -
+${libdir}/nagios/plugins                   0755    nagios    nagios    true 0644 nagios nagios
-- 
2.7.4


