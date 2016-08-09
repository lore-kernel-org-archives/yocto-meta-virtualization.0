Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F794E00A08; Tue,  9 Aug 2016 10:58:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_WEB
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
	bl.spamcop.net
	* [Blocked - see <http://www.spamcop.net/bl.shtml?111.93.218.67>]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.8 RCVD_IN_SORBS_WEB RBL: SORBS: sender is an abusable web server
	*      [111.93.218.67 listed in dnsbl.sorbs.net]
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1692AE006E9
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Aug 2016 10:58:06 -0700 (PDT)
Received: by mail-pa0-f41.google.com with SMTP id ti13so7454385pac.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Aug 2016 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Tpi1MlfCe3N53fGno5+74FKT8naowG8ze6waoKhlNGc=;
	b=k8qObPPK6GttMVMG7u/k5X8cuMT6kV3jx68ArsaQW6iBvscdxXGd7NxfBYfb+9oVw6
	8KpfzTntdFM8HHBufEroqIdS7jJxO2G8mgYhDoSDU3MByis9HrjWJhk9OEFFzEUv9wMz
	3jV7Hv4KG8T2EKVp1G/fzCbkRtI4tTQiLPe5JH8imbPynJRSIDEdL1z0xszWTDVXMzN4
	spnHZG/8XosTd5A8n3M4gxfQ4+F2K9OyHErbyb7zMF4YAhCTCoRmbSyUUArLz7lDKcaZ
	A2xdG70nZ/SUBQ0GWxdoWWMNrzD3L29W5rHRGtAMLCjAusru0Badz9BynR0TQSyJ6in3
	Y84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tpi1MlfCe3N53fGno5+74FKT8naowG8ze6waoKhlNGc=;
	b=fuRAhHOncLwIC0GIuAzdpw1tfK7REA/C62Bc3WLSpnZZNOEv0u1SLcaz1Q+/rpa7qS
	Q6axeq4amPednOnUI1eAHviWwEnMkBUjlqv4VHbJgQpbZyCPrFt89h+2uI/wrIVki1x1
	lOJMKGrHMt6TvTbS3PKnA1vIEgKiufoWflHEKTCn9dM/0pSH9s5axZZg2yNH524kagSP
	5VAqZHB/YtNVmksQF8rlnxE8w6DUDNHeDg8PrzS0s6Kjx+TZubJ9iR/tuTSzussqN3gW
	aEJd9qAIYPb4jtvooJDLUlWHkSRAjOh7eMCjnPWL5vZXAqpjhsQK4A8Db1i80hoRQ9uR
	0tGA==
X-Gm-Message-State: AEkoouv/rYtCbx3gEO41AgzAnpofUcr1GhChTRm18afJdnxnfmaeYgV+oK12FKxcnuVHWfLT
X-Received: by 10.66.255.42 with SMTP id an10mr175946050pad.57.1470765485951; 
	Tue, 09 Aug 2016 10:58:05 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	cf1sm57698056pac.20.2016.08.09.10.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 10:58:04 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  9 Aug 2016 23:27:57 +0530
Message-Id: <1470765477-29723-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openvswitch: add missing python modules to execute ovs-test program
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
X-List-Received-Date: Tue, 09 Aug 2016 17:58:10 -0000

ovs-test program requires python-twisted and ovstest python
modules to execute successfully. The changes fix below
errors:

-- snip --
root@qemux86:~# ovs-test
Traceback (most recent call last):
  File "/usr/bin/ovs-test", line 31, in <module>
    import twisted
ImportError: No module named twisted
root@qemux86:~# ovs-test
Traceback (most recent call last):
  File "/usr/bin/ovs-test", line 33, in <module>
    import ovstest.args as args
ImportError: No module named ovstest.args
root@qemux86:~#
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-networking/openvswitch/openvswitch.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index fc515e9..3c70703 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -15,7 +15,7 @@ DEPENDS += "bridge-utils openssl python perl"
 
 RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
 	python perl perl-module-strict ${PN}-switch \
-        bash"
+        bash python-twisted"
 RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
 RDEPENDS_${PN}-pki = "${PN}"
@@ -69,7 +69,8 @@ FILES_${PN}-switch = "\
 FILES_${PN} += "${datadir}/ovsdbmonitor"
 FILES_${PN} += "/run"
 
-inherit autotools update-rc.d systemd
+FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
+inherit autotools update-rc.d systemd python-dir
 
 SYSTEMD_PACKAGES = "${PN}-switch"
 SYSTEMD_SERVICE_${PN}-switch = " \
@@ -102,6 +103,8 @@ do_install_append() {
 		${D}/${systemd_unitdir}/system/openvswitch-nonetwork.service
 
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
+	install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
+	cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
 }
 
 pkg_postinst_${PN}-pki () {
-- 
2.7.4


