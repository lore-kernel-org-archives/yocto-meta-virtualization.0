Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B67CEE01431
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 20:06:09 -0700 (PDT)
Received: by mail-ea0-f175.google.com with SMTP id m14so2719787eaj.20
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 20:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=NhbZ6xDxVPu8GMUvYeBMpbPiWT1UgdRC9PSv6JVAuKc=;
	b=W+l3vTF2uiZx61CKRBza9YAAMYAXGvl6GZIyJBdoAtFB3PhkjjuRMUCjv8ye9HyJmZ
	aTQFS1XSCtDpQn8TpHZnti0JEoNeuDgXBmXDp65Z1vPNI5WO3zx3g9emnzG8GsxGq0QY
	iqPqqBtpXC9SdYI9feLOo+E+CyBW00te+xhYHLtnJBGNw4q2C2v/FZWqENN0ZJOUYL1V
	YNhMS21S7/GbgxpK20CtPIs5xRff0Wc1XrrCMUEJ/ortK4s+OHaknZfuQr1bV4jW0B/w
	bP9IVuI6YEAC/KnPDPnOVfEN5ynSIg9pxUJyfzCZMBDJlAT+UXEHhAaDoLoJHnFaEP0D
	j5fg==
X-Received: by 10.15.42.72 with SMTP id t48mr6848671eev.105.1376190368804;
	Sat, 10 Aug 2013 20:06:08 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id f49sm38427504eec.7.2013.08.10.20.06.07
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 10 Aug 2013 20:06:08 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 10 Aug 2013 23:06:16 -0400
Message-Id: <1376190376-1487-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ovs: add /run to main package
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
X-List-Received-Date: Sun, 11 Aug 2013 03:06:13 -0000

In a systemd based build, /var/run is translated to /run. Since ovs doesn't
currently package this directory, it results in a QA error. Adding it to the
main ovs package fixes the QA issue and provides the proper runtime support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_1.10.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 4fb2670..9cdd839 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -53,6 +53,7 @@ FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
 		   "
 # silence a warning
 FILES_${PN} += "${datadir}/ovsdbmonitor"
+FILES_${PN} += "/run"
 
 inherit autotools update-rc.d
 
-- 
1.7.10.4


