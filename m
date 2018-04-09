Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE8B4E00AE6; Mon,  9 Apr 2018 11:31:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50D35E0090A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 11:31:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w39IVoo7006136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Apr 2018 11:31:50 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 9 Apr 2018 11:31:49 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Apr 2018 14:31:43 -0400
Message-ID: <1523298703-17734-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] README: update code submission line to include "m-c-s" and '-M'
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
X-List-Received-Date: Mon, 09 Apr 2018 18:31:52 -0000
Content-Type: text/plain

The READMEs were lacking the "[m-c-s]" which we normally expect on the
mailing list as well as the use of the "-M" option which makes
reviewing patches, which include a move as seen when we uprev a
recipe, easier to review.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 README                | 2 +-
 meta-openstack/README | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index a66168c..ece05b2 100644
--- a/README
+++ b/README
@@ -41,7 +41,7 @@ Maintenance
 Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
 
 When sending single patches, please using something like:
-'git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][PATCH'
+'git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][m-c-s][PATCH'
 
 Maintainers: Bruce Ashfield <bruce.ashfield@windriver.com>
 
diff --git a/meta-openstack/README b/meta-openstack/README
index 9d240e4..81b843b 100644
--- a/meta-openstack/README
+++ b/meta-openstack/README
@@ -33,7 +33,7 @@ Maintenance
 Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
 
 When sending single patches, please using something like:
-'git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][PATCH'
+'git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][m-c-s][PATCH'
 
 Maintainers: Bruce Ashfield <bruce.ashfield@windriver.com>
 
-- 
2.7.4


