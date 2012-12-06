Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD7B9E01449
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:49 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182732eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=AolH7GuCXGU5qE1AWSOObF8+Fc+qlbgwjM9IhtHO46g=;
	b=NM1n/mZTbVe3nGg//ZjnnQ2gFAmKKsHggyWeGG9qT27TdQR7PLuVVFC03Mt/acpJBR
	xICIr5AKb+RemgyHkxAJCdtLxveFIX5P4PgXdovBlWi36qSqnafFn0VOg9u46uUjAliF
	CVOu4XW4n/KEmhyhDs9q/i70awM4igOB894kIi9713PI7ArslomqMUteIyrNRVaV2guC
	D3XJ/OvOP/tYN9v8ZOJ+R7/NOrZzYJlgZuof0kPK+sHOsCthjPeFvV9SIdR2kNxHA4dW
	pVU8+De3ysKlttcJtgOUwGO/6Gjxh5YpPzXD9SAySKV4keEjN7krP2mxq3TnplJ4ms+t
	u9qA==
Received: by 10.14.213.134 with SMTP id a6mr7404427eep.45.1354813609415;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 44sm17004304eek.0.2012.12.06.09.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 4D3384011B6; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:32 +0100
Message-Id: <1354813596-8233-12-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 11/15] Added some details in README, and made the description common
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:50 -0000
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


