Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16134.1793098582442658175
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 03:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gPpqRwl+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 115631A1366
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Oct 2026 10:56:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF566603BD
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Oct 2026 10:56:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F16101032909D;
	Tue, 27 Oct 2026 11:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793098579; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Fs+RkOwGrVCPq2TgzXiV86vzDptzZmgb0OmPXhjsTDs=;
	b=gPpqRwl+w8y3oPullv8IUVdmmOwKQB14PlwDibm61CDmdVJuQlyoSLUTs4+xDmhL2ni/MF
	uUqOcDbeccB39s0jA2Ef1CSWkv+P6+UHEj3S3nXkhzbug31OdIRgyWSiLq5izn2I2MNQCz
	+ylK1kTH1wIis85Wy94JJieIPxKS3hduTHEs5epJ8/ejSBPr8iA26YMGTlAjfWHhFUUeUe
	iQnZxu2PXrg2BPIJQxoW3XV9AFOLRBgkCuopS1eVhyf9bbpm7Y3yBI150ZeDDd8XqsK1mi
	WIX82beCQRgopor7HWft+2WemMHHuyenlPjOfYihSGwXb3cMpkb9hlNLel9lzg==
From: thomas.perrot@bootlin.com
To: meta-virtualization@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-virtualization][PATCH] Add a b4 configuration
Date: Tue, 27 Oct 2026 11:56:06 +0100
Message-ID: <20261027105606.1973102-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Oct 2026 10:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10141
Content-Type: text/plain; charset="utf-8"

From: Thomas Perrot <thomas.perrot@bootlin.com>

b4 [1] is a useful tool for contributing via email.

This configuration adds the [meta-virtualization] presubject

[1] https://pypi.org/project/b4/

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .b4-config | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 .b4-config

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 000000000000..3550a6f3e11e
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-to =3D meta-virtualization@lists.yoctoproject.org
+  send-presubject =3D [meta-virtualization]
--=20
2.56.0

