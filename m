Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.24470.1609012858813266730
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 26 Dec 2020 12:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53004 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ktFkH-0004zy-Dn
	for meta-virtualization@lists.yoctoproject.org; Sat, 26 Dec 2020 15:00:57 -0500
Date: Sat, 26 Dec 2020 15:00:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] yard: rename 'master' to 'main' in SRC_URI
Message-ID: <dda5b1a0-5373-6910-3e74-bb9e559b2086@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


master branch was renamed to main.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-openstack/recipes-devtools/ruby/yard_git.bb b/meta-openstack/recipes-devtools/ruby/yard_git.bb
index d5232016..e7a25b1f 100644
--- a/meta-openstack/recipes-devtools/ruby/yard_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/yard_git.bb
@@ -20,7 +20,7 @@ SRCREV = "d83194e1a09098ec5be28b616cde3b9a15380873"
 S = "${WORKDIR}/git"

 SRC_URI = " \
-    git://github.com/lsegal/yard.git \
+    git://github.com/lsegal/yard.git;branch=main \
     "

 inherit ruby

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
