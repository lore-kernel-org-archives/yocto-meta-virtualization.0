Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDE30E00A6A; Wed, 23 May 2018 12:17:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DF3CE009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 12:17:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4NJGRGm012525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 12:16:53 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 12:16:38 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 23 May 2018 15:16:37 -0400
Message-ID: <1527102997-27793-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] README: cleanup list of maintainers
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
X-List-Received-Date: Wed, 23 May 2018 19:17:04 -0000
Content-Type: text/plain

Raymond Danks <ray.danks@se-eng.com> hasn't contributed any changes to
meta-virtualization since 2012 and is listed on Linkedin as no longer
with Sage Electronics since March 2013, having moved to a completely
different profession (firefighting). So it is almost certain the
listed E-mail address is invalid and has been for a long time.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 README | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/README b/README
index f13de08..810f263 100644
--- a/README
+++ b/README
@@ -64,8 +64,7 @@ Maintenance
 
 Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
 
-Maintainers: Raymond Danks <ray.danks@se-eng.com>
-             Bruce Ashfield <bruce.ashfield@gmail.com>
+Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com>
 
 When sending single patches, please using something like:
 $ git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
-- 
2.7.4


