Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4AFCE00D15; Mon, 25 Sep 2017 20:32:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75A35E00D14
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 20:32:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8Q3WDKS006372
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 20:32:13 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Sep 2017 20:32:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 26 Sep 2017 11:31:05 +0800
Message-ID: <20170926033105.15731-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170926033105.15731-1-Qi.Chen@windriver.com>
References: <20170926033105.15731-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 3/3] README: update to include information about bbappend inclusion
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
X-List-Received-Date: Tue, 26 Sep 2017 03:32:14 -0000
Content-Type: text/plain

Update README file to include information about bbappend file inclusion,
telling the users that 'virtualization' needs to be in DISTRO_FEATURES
to make some bbappend files to be effective.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 README | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/README b/README
index 2578f90..49fda10 100644
--- a/README
+++ b/README
@@ -4,6 +4,11 @@ meta-virtualization
 This layer provides support for building Xen, KVM, Libvirt, and associated
 packages necessary for constructing OE-based virtualized solutions.
 
+The bbappend files for some recipe (e.g. linux-yocto) in this layer need to
+have 'virtualization' in DISTRO_FEATURES to have effect. To enable them, add
+in configuration file the following line.
+DISTRO_FEATURES_append = " virtualization"
+
 Dependencies
 ------------
 This layer depends on:
-- 
2.11.0


