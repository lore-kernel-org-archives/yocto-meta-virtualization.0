Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DADFE01791
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 19:10:05 -0800 (PST)
Received: by mail-ie0-f178.google.com with SMTP id x13so16982359ief.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Nov 2013 19:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vv+xUK/Y5Z/6QvJ8LoTDbzpxiFtHPeusx9Vfhvvddok=;
	b=RXIdyI77cORCe9VRQGbxi4+dmnJMFDaz8eFqBSKdJNUu98dBBaQkYodzdzkPWZXm/A
	WeWskvq5iDYHDE7pjXMWZCm6QZ1J/p0FnxTCsW2F+wItKF7nmjOnQPG5LMHpIcPWk0aj
	fITWcHpudDLBDZwNGa0J2O9VnSTkWPFBvxbcU+EJV8eTuEuRjISd72zoLjZChg2Yrcnc
	+iFBdl8PC6XWxrmsZCS8WGi2OYR8jqPuNbHtzSrm3/LP3dY1lZ7DtqCt2Se0fDTtyYVQ
	HS/q+rp+I/7YTVHmY1UfmfEhruvMDglWMxgR+/Bs3N+lJ/N8cSI3qvLGDR5iZQN+FqoA
	5OCQ==
X-Received: by 10.50.61.179 with SMTP id q19mr18393258igr.33.1383707404854;
	Tue, 05 Nov 2013 19:10:04 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id v2sm5533825igz.3.2013.11.05.19.10.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2013 19:10:04 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  5 Nov 2013 22:09:01 -0500
Message-Id: <1383707342-3827-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
References: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH 3/4] xen: rename xen patches directory from xen-4.3.0 to files.
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
X-List-Received-Date: Wed, 06 Nov 2013 03:10:06 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 .../{xen-4.3.0 => files}/flask-avoid-installing-policy-file-as-boot.patch | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/xen/{xen-4.3.0 => files}/flask-avoid-installing-policy-file-as-boot.patch (100%)

diff --git a/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch b/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
similarity index 100%
rename from recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
rename to recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
-- 
1.8.4.rc3


