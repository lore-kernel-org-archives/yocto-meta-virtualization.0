Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.32183.1609071308516838827
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Dec 2020 04:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56746 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ktUx0-0003fy-3T
	for meta-virtualization@lists.yoctoproject.org; Sun, 27 Dec 2020 07:15:06 -0500
Date: Sun, 27 Dec 2020 07:15:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ipaddress.git.bb: update SRC_URI to avoid redirection
Message-ID: <4c4fcf3-f4c8-2a14-48d4-4034ce869c0@crashcourse.ca>
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


Current SRC_URI just takes fetcher to new location.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb b/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb
index 116bcf5f..017c6c73 100644
--- a/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb
@@ -20,7 +20,7 @@ SRCREV = "96aaf68210d644157bd57a6ec3e38c49f38bfc34"
 S = "${WORKDIR}/git"

 SRC_URI = " \
-    git://github.com/bluemonk/ipaddress.git \
+    git://github.com/ipaddress-gem/ipaddress.git \
     "

 inherit ruby

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
