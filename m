Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56A67E00D5F; Wed, 21 Dec 2016 07:14:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27707E00A4D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 07:14:24 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBLFEN1x008409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 07:14:23 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 07:14:23 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 21 Dec 2016 10:14:22 -0500
Message-ID: <1482333262-15404-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [mcs][PATCH] identity: make work with python 3
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
X-List-Received-Date: Wed, 21 Dec 2016 15:14:28 -0000
Content-Type: text/plain

dict.has_key has been deprecated for a while and officiall removed in
python 3, instead we need to use 'key in'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/classes/identity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/classes/identity.bbclass b/meta-openstack/classes/identity.bbclass
index 3601f52..4ea7305 100644
--- a/meta-openstack/classes/identity.bbclass
+++ b/meta-openstack/classes/identity.bbclass
@@ -105,7 +105,7 @@ def usercreate_param(d, pkg):
 
     for key, value in param_defaults.items():
         if key in param.split():
-            if param_flags.has_key(key):
+            if key in param_flags:
                 param_defaults[key] = param_flags[key]
         else:
             param_defaults[key] = ''
@@ -135,7 +135,7 @@ def servicecreate_param(d, pkg):
 
     for key, value in param_defaults.items():
         if key in param.split():
-            if param_flags.has_key(key):
+            if key in param_flags:
                 param_defaults[key] = param_flags[key]
         else:
             param_defaults[key] = ''
-- 
2.7.4


