Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C6FBE0086B; Tue, 29 Mar 2016 11:46:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC1AFE00566
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 11:46:54 -0700 (PDT)
Received: by mail-qg0-f67.google.com with SMTP id b32so1488907qgf.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 11:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l2omEdBM65vGGGU4aboWxkY+W+CkchCKvGS4ykRIWRY=;
	b=obe+TW/uQ6C1iFweGEOGONsbuVCO5FN+23zlZns8cj7YAyB8xd3Adr7qZBN2x7SDwH
	cOiqmRPWGe6cnXlwst8Q/Y+gYA3vG/mmlGI21xAwMbPAzrQtP2wVzz2PPuFW0Qwgl3h+
	+vo88b2Wgpfl7h+Bjk4PJrtI5o0M0LubKSJtUChVQsp+IipdB7UP8h527Gj/oGSD77xn
	Ca1I6Srfgz2NRkS3AXDL5M/sMyQjMZ+YCH5bRcLnaClBTPfed/68C8UX9TRsCNAP810w
	tBtu+KPnJDgd5a6g7TeScWdl0uhQjkP9sXyKEZEE2/XysyveyKrzTBhAzd4cjLLbY2td
	k3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l2omEdBM65vGGGU4aboWxkY+W+CkchCKvGS4ykRIWRY=;
	b=i5rJYTNgeLpNW51BtNDQo59av67pwz+X+UbrLcl0sJAyT6ISZXpOnpMQ9hu+aWWiQ8
	x+d4WYtMmq5/yBykxsvqBsuZYCHuNQkXVXzLj1bSbj+vAd06RwTXIf6ljan890Ey0wvf
	GkMi17jSZ3rSZI9nTX4jL3OP/a328lray5h568xeqQdPtHGiE7PeTueaBLjNyp3qyInX
	XlZ1HlEbDTUZlQylf0FjT+CIG+OIxdnAa1fnxL/kTywoEnM9QA3BxOk9+mLeTi03kAxL
	fdumCskS/8tGx2NSe0Jwt6ut8MxZxE/byYYaEtRCIJ8U99/qhZEhAYgEF3ns28PP3mwa
	2hAw==
X-Gm-Message-State: AD7BkJIz4OXsgXu0Ag9JQ53cL8tQ2dZg5oks1zAV7r1ODqJ1Y1/mfnx38P6JYZq2KfIkjA==
X-Received: by 10.140.27.132 with SMTP id 4mr4857516qgx.6.1459277213419;
	Tue, 29 Mar 2016 11:46:53 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	m66sm30680qgd.20.2016.03.29.11.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 11:46:53 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Mar 2016 14:46:28 -0400
Message-Id: <1459277188-27287-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] xen: deploy efi binary, if present
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
X-List-Received-Date: Tue, 29 Mar 2016 18:46:56 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9ae7c4e..de8c168 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -901,12 +901,19 @@ pkg_postinst_${PN}-volatiles() {
 
 do_deploy() {
     install -d ${DEPLOYDIR}
+
     if [ -f ${D}/boot/xen ]; then
         install -m 0644 ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}
     fi
+
     if [ -f ${D}/boot/xen.gz ]; then
         install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
     fi
+
+    if [ -f ${D}/usr/lib64/efi/xen.efi ]; then
+        install -m 0644 ${D}/usr/lib64/efi/xen.efi ${DEPLOYDIR}/xen-${MACHINE}.efi
+    fi
+
     # Install the flask policy in the deploy directory if it exists
     if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
         install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
-- 
2.1.4


