Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12E0DE00AB9; Tue,  6 Nov 2018 13:58:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A72F9E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Nov 2018 13:58:26 -0800 (PST)
Received: by mail-oi1-f193.google.com with SMTP id u130-v6so12132650oie.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Nov 2018 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QSQd4Vf8ZMn2H2Ae4nVnxNURWRkH9Iri3aaf3Hiv2i0=;
	b=J+41DI9uJiGvZSYMilmCnbVswkZiZHcpJjKeJ+m3XaMHjG9bGmEybo9ShWgH7Z7B52
	Ev07bTf576/8vp+mV7P5UnWx3LII78XJhczs4mMAYy/k88+ItP2pUWpSahCqNbjcMh7K
	QwuhSt3CUX05E5cG0hO3R2CePt/jHqE2QyGX2yFvq5ucq8vz8G31DU2DK8uwRpmfzwlq
	CdQYPIyjeM2I+LR/ZUTTCzuxlZkaHGD9P2S4mucTkphjJBzBbL3/XEGHS3d7adv+xUaW
	W9rrVbgTzE0ZWbwJQjg31XjML6HQMpRcVPxRBUWHto0HSGK9wewFOmMWK5vJ/eHFDtPD
	KHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QSQd4Vf8ZMn2H2Ae4nVnxNURWRkH9Iri3aaf3Hiv2i0=;
	b=hNtJ4UKbcouUbs2F/4UDzXr2L6NcwjqujYHgu3oTFtfDfp3jTkvhHG4DCmHobQ1n9g
	koSWUYo6dg/kYYg9eWVhou1egFTgqqWcOtt8iGMVrvNcTvb4l7apux7zeHDBdJTk41wq
	rcDj6ZiTY7sAqRicW/tv9RQit5+NecdREWdhe/8sZk8mJQNSehZPrzDjShXeNvGR7kSk
	Nik+mkiUrj2wUpeCVYaUIy7XWwsk3yzbSw3/+lIY7SecFt7kvCAx0lqtN8JcqjhzpnWL
	oRX6pomflfV8yStwWeNDhHDkrNc2yNdt+hH50yvwmy4JjNV9FDrMiB3f57JccgFUDPws
	nDLg==
X-Gm-Message-State: AGRZ1gK+Rw9T5qQiAnVq4lEjVkvCJiDMa6pf0WV6QGQfd9gT4fNbwWjW
	tYj1USer8R6BZuWDWC25IxBJEXGrzSo=
X-Google-Smtp-Source: AJdET5eZXcRfScCJI+HIXpqlDb2JuhgP4Yw/cJLXGmCt7vEQ2E3zGMVRgcm+dknQVH//3kun7WG2TQ==
X-Received: by 2002:aca:5003:: with SMTP id
	e3-v6mr15315324oib.111.1541541505807; 
	Tue, 06 Nov 2018 13:58:25 -0800 (PST)
Received: from jptest02.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	r10-v6sm25886518oif.57.2018.11.06.13.58.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Nov 2018 13:58:25 -0800 (PST)
Received: by jptest02.localdomain (Postfix, from userid 1000)
	id B9C731A0225; Tue,  6 Nov 2018 13:58:23 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Nov 2018 13:58:21 -0800
Message-Id: <20181106215821.8970-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [m-c-s][PATCH] postgresql: Fix issue where init script is not found.
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
X-List-Received-Date: Tue, 06 Nov 2018 21:58:29 -0000
Content-Transfer-Encoding: 8bit

layers/meta-cloud-services/meta-openstack/recipes-dbs/postgresql/defaultpkgname/

Something changed with the evaluation of :=, such that PN evaluates to defaultpkgname, thus
the initscript is not found. Just set it to the correct name.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
index 5bf25e1..b6a9c3c 100644
--- a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/postgresql:"
 
 SRC_URI += " \
     file://postgresql-init \
-- 
2.19.1


