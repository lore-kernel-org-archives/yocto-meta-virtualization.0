Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7490BE00AD8; Tue, 20 Sep 2016 02:28:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.180.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCD8CE00A96
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 02:27:58 -0700 (PDT)
Received: from 1bmHLI-0006av-UZ by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bmHLI-0006bj-VY
	for meta-virtualization@yoctoproject.org;
	Tue, 20 Sep 2016 02:27:56 -0700
Received: by emcmailer; Tue, 20 Sep 2016 02:27:56 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bmHLI-0006av-UZ
	for meta-virtualization@yoctoproject.org;
	Tue, 20 Sep 2016 02:27:56 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 11:27:56 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 37108441595;
	Tue, 20 Sep 2016 11:27:56 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 20 Sep 2016 11:27:56 +0200
Message-ID: <1474363676-21149-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-cloud-services][PATCH] identity.bbclass: Fix python synthax error
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
X-List-Received-Date: Tue, 20 Sep 2016 09:28:07 -0000
Content-Type: text/plain

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-openstack/classes/identity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/classes/identity.bbclass b/meta-openstack/classes/identity.bbclass
index 672f6c4..3601f52 100644
--- a/meta-openstack/classes/identity.bbclass
+++ b/meta-openstack/classes/identity.bbclass
@@ -85,7 +85,7 @@ def sanity_check(d):
     for pkg in servicecreate_packages.split():
         # User parameters checking.
         if not d.getVar('USERCREATE_PARAM_%s' % pkg, True) and not d.getVar('SERVICECREATE_PARAM_%s' % pkg, True):
-            raise bb.build.FuncFailed, "%s SERVICECREATE_PACKAGES includes %s, but neither USERCREATE_PARAM_%s nor SERVICECREATE_PARAM_%s is set" % (d.getVar('FILE'), pkg, pkg, pkg)
+            raise bb.build.FuncFailed("%s SERVICECREATE_PACKAGES includes %s, but neither USERCREATE_PARAM_%s nor SERVICECREATE_PARAM_%s is set" % (d.getVar('FILE'), pkg, pkg, pkg))
 
 python __anonymous() {
     sanity_check(d)
-- 
1.9.1


