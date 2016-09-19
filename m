Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9070E00D98; Mon, 19 Sep 2016 01:15:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.181.32 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 323 seconds by postgrey-1.32 at yocto-www;
	Mon, 19 Sep 2016 01:15:02 PDT
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.32])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 590AFE00997
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 01:15:02 -0700 (PDT)
Received: from 1bltdx-0004Cv-Vy by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bltdy-0004DT-TK
	for meta-virtualization@yoctoproject.org;
	Mon, 19 Sep 2016 01:09:38 -0700
Received: by emcmailer; Mon, 19 Sep 2016 01:09:38 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bltdx-0004Cv-Vy
	for meta-virtualization@yoctoproject.org;
	Mon, 19 Sep 2016 01:09:37 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 10:09:37 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 9B37B44151A;
	Mon, 19 Sep 2016 10:09:37 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 19 Sep 2016 10:09:37 +0200
Message-ID: <1474272577-38176-1-git-send-email-adrian.dudau@enea.com>
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
Subject: [meta-cloud-services][PATCH] identity.bbclass: Enforce octal literal representation in os.chmod
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
X-List-Received-Date: Mon, 19 Sep 2016 08:15:06 -0000
Content-Type: text/plain

Python 3 changed to the explicit representation and throws errors
otherwise.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-openstack/classes/monitor.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/classes/monitor.bbclass b/meta-openstack/classes/monitor.bbclass
index 83aaea2..a959f09 100644
--- a/meta-openstack/classes/monitor.bbclass
+++ b/meta-openstack/classes/monitor.bbclass
@@ -19,7 +19,8 @@ def copy_check_files(d, check_var_name, src, dest):
         for check in mon_checks.split():
             if os.path.exists(src + "/" + check):
                 shutil.copy(src + "/" + check, dest)
-                os.chmod(dest + "/" + check, 0755)
+                os.chmod(dest + "/" + check, 0o755)
+
 
 python do_monitor_install() {
     import shutil
-- 
1.9.1


