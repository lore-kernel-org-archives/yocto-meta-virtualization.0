Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A4E9E00D55; Mon, 27 Nov 2017 00:11:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF7E3E00D39
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Nov 2017 00:11:56 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAR8Bqb5016909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Nov 2017 00:11:56 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 27 Nov 2017 00:11:51 -0800
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 Nov 2017 16:10:04 +0800
Message-ID: <20171127081004.6317-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] lxc: add back the rdepends on glibc-utils
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
X-List-Received-Date: Mon, 27 Nov 2017 08:11:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The rdepends on glibc-utils was removed without reason
in the following commit:
"""
e73608d56e498a7075e7a3e5550aafd76987d7aa
lxc: 2.0.0 -> 2.0.8
"""

And it causes failure:
/usr/libexec/lxc/lxc-net: line 125: getent: command not found

So add the dependency back.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 93d5a10..c9ce5f0 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -22,6 +22,9 @@ RDEPENDS_${PN} = " \
 		gnutls \
 		nettle \
 "
+
+RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
+
 RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
-- 
2.11.0


