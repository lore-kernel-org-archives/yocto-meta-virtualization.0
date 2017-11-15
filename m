Return-Path: <Abdur_Rehman@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA525E00A6A; Wed, 15 Nov 2017 08:44:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B371DE00A6A
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 08:44:26 -0800 (PST)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1eF0na-00045x-Bl from Abdur_Rehman@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Wed, 15 Nov 2017 08:44:26 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 15 Nov 2017 16:44:24 +0000
From: Abdur Rehman <abdur_rehman@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Nov 2017 21:44:21 +0500
Message-ID: <1510764261-37283-1-git-send-email-abdur_rehman@mentor.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] README: fix a couple of grammatical errors
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
X-List-Received-Date: Wed, 15 Nov 2017 16:44:28 -0000
Content-Type: text/plain

Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 7d84232..4181f5f 100644
--- a/README
+++ b/README
@@ -23,7 +23,7 @@ variable in your configuration:
 
   SKIP_META_VIRT_SANITY_CHECK = 1
 
-Also note that there are kvm and xen specific distro flags/features that depending
+Also note that there are kvm and xen specific distro flags/features that depend
 on your use case.
 
 Dependencies
@@ -63,7 +63,7 @@ Send pull requests, patches, comments or questions to meta-virtualization@yoctop
 Maintainers: Raymond Danks <ray.danks@se-eng.com>
              Bruce Ashfield <bruce.ashfield@gmail.com>
 
-When sending single patches, please using something like:
+When sending single patches, please use something like:
 $ git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
 
 License
-- 
2.8.1


