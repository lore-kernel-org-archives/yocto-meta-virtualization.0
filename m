Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.24741.1609014566233791433
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 26 Dec 2020 12:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53122 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ktGBo-0001zq-Lv
	for meta-virtualization@lists.yoctoproject.org; Sat, 26 Dec 2020 15:29:25 -0500
Date: Sat, 26 Dec 2020 15:29:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] json: fix Bignumn/Fixnum issue when using Ruby 2.5
Message-ID: <d2964417-6959-4a5b-fd2d-59a28685f07e@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.3
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
Content-Type: multipart/mixed; boundary="8323328-641634210-1609014564=:1960083"

--8323328-641634210-1609014564=:1960083
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT


There is a recognized problem with json_1.8.3 when used with Ruby 2.5;
in summary:

  compiling generator.c
  generator.c: In function ¡generate_json¢:
  generator.c:861:25: error: ¡rb_cFixnum¢ undeclared (first use in this
  function); did you mean ¡mFixnum¢?
       } else if (klass == rb_cFixnum) {
                           ^~~~~~~~~~
                           mFixnum
  generator.c:861:25: note: each undeclared identifier is reported only
  once for each function it appears in
  generator.c:863:25: error: ¡rb_cBignum¢ undeclared (first use in this
  function); did you mean ¡rb_cFixnum¢?
       } else if (klass == rb_cBignum) {
                           ^~~~~~~~~~
                           rb_cFixnum

This is explained in detail at:

https://makandracards.com/makandra/74544-how-to-fix-json-1-8-3-with-ruby-2-5

The simplest solution is to upgrade json just a wee bit to 1.8.5 to
resolve this.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-openstack/recipes-devtools/ruby/json_git.bb b/meta-openstack/recipes-devtools/ruby/json_git.bb
index a417798b..f7b3dd79 100644
--- a/meta-openstack/recipes-devtools/ruby/json_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/json_git.bb
@@ -5,18 +5,18 @@ SUMMARY = "An implementation of the JSON specification according to RFC 4627"
 DESCRIPTION = "An implementation of the JSON specification according to RFC 4627"

 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aef161fe3c86f1a8d6c71d3b8c5655c5"
+LIC_FILES_CHKSUM = "file://CHANGES;md5=af8cad0ff27a1593ac5ee461bc2d71ab"

 PR = "r0"

-BPV = "1.8.3"
+BPV = "1.8.5"
 PV = "${BPV}"
-SRCREV = "db4c71a7701b95c30f945ee1536240920dcfdc17"
+SRCREV = "4cf6c6270f52888997ec1b626b9f557db4f26f2e"

 S = "${WORKDIR}/git"

 SRC_URI = " \
-    git://github.com/flori/json.git \
+    git://github.com/flori/json.git;branch=v1.8 \
     "

 inherit ruby

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-641634210-1609014564=:1960083--
