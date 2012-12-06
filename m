Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f68.google.com (mail-ee0-f68.google.com [74.125.83.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A124AE0145F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:14 -0800 (PST)
Received: by mail-ee0-f68.google.com with SMTP id b45so1261981eek.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=AolH7GuCXGU5qE1AWSOObF8+Fc+qlbgwjM9IhtHO46g=;
	b=o594BDc+AIlyWvpupBJdFDuy1Xv9a99OQE1/oZFJfTHhD5PrnmP9sM65jY2PJX2AaO
	BR311Xs+8SWbvh4bU9iji8Ix8HEoB23r+ujtifTgzYoZ+uVG0Of3NflkoEjMOYvhxoSk
	00xpnMw0kxF2jImfpqvED/qasYR7FZ8zuNsXz58yXgSas6jxrWhHBaoCKf15jUeuxZkR
	Y+mnyeXJd4/nh7/8dwbLpU+GjltWmJ43pD5clM/jnw1WNZ8sKrsKxzR7WtEfAcqqTFCG
	btwVAWGeqnDHmpje+ZBlgyo/nqTBqKdbJD9huyg64kFTa4455SvRVyQMpUT2aB0NP5DQ
	fPfA==
Received: by 10.14.173.69 with SMTP id u45mr5949799eel.21.1354801513799;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id w3sm15983867eel.17.2012.12.06.05.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id E8F474011B6; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:44 +0100
Message-Id: <1354801486-9482-13-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 12/14] Added some details in README, and made the description common
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 README |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/README b/README
index 0ee4047..f9f890b 100644
--- a/README
+++ b/README
@@ -1,12 +1,8 @@
 meta-xen
 ===========
 
-This layer provides support for building Xen, Libvirt, and associated
-packages necessary for constructing an OE-based Xen distribution.
-
-This layer provides support for building KVM, Libvirt, OpenvSwitch et.c.
-and associated packages necessary for constructing virtualized solutions for
-Openembedded based distros.
+This layer provides support for building Xen, KVM, Libvirt, and associated
+packages necessary for constructing OE-based virtualized solutions.
 
 Dependencies
 ------------
@@ -15,10 +11,13 @@ This layer depends on:
 URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
+prio: default
 
 URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
+layers: meta-oe
+BBFILE_PRIORITY_openembedded-layer = "4"
 
 Maintenance
 -----------
-- 
1.7.9.5


