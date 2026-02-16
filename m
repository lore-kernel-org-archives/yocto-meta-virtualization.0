Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602DAEF5867
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:17:04 +0000 (UTC)
Received: from 8.mo579.mail-out.ovh.net (8.mo579.mail-out.ovh.net [46.105.47.242])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24873.1771262223282485703
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 09:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=toMOml62;
 spf=softfail (domain: piedallu.me, ip: 46.105.47.242, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.109.254.205])
	by mo579.mail-out.ovh.net (Postfix) with ESMTPS id 4fF8b114Wwz5wwM;
	Mon, 16 Feb 2026 17:17:01 +0000 (UTC)
Received: from piedallu.me (37.59.142.98) by mxplan8.mail.ovh.net
 (172.16.2.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 16 Feb
 2026 18:17:00 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-98R002a6a8d18a-e7a2-467f-8c28-2c420bf21363,
                    56406BC51C322441719EFB98626FE52A09BB5D07) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 176.170.95.144
Received: from [127.0.1.1] (92-184-102-168.mobile.fr.orangecustomers.net [92.184.102.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id 3392A16A068C;
	Mon, 16 Feb 2026 18:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771262215;
	bh=Hvo5IlO99ABPCM/hqVZ1Y4fXZrYEN5B3qjOneRLrKhg=;
	h=From:Subject:Date:To:Cc;
	b=toMOml62UZoDy2qVNIUtuIK8AdMAldUu+e0jsn48KVLjdo8DGDauWFZ5k8V4yZrkD
	 wn0WdSkheSRdWhO2UP53byfSNgMNW84DSff8ywMySaQQ+E3WscNZBmnToSxQuuO1CQ
	 WgoH2L9sj9z3PGv19JRWQ8tudmuUzJEHZCAbVcnQ=
From: felix@piedallu.me
Subject: [PATCH 0/3] Update docker-moby to v25.0.9
Date: Mon, 16 Feb 2026 18:16:42 +0100
Message-ID: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAPpQk2kC/52OQQ6DIBREr9KwLgbQgu2q92hcwOdbSSMYsKbGe
 Peiu+5Md/Nm8WYWkjA6TOR2WkjEySUXfAZ+PhHotH8idTYzEUxIJrik7yGNEXWfg9UjUhvghZH
 2wczUslpIay5XLg3JhiFi6z67/dFk7lwaQ5z3sYlv7THvxCmjpdIVlqAZSHH3wRcJCwj9tnNcY
 kFVwuq2FpX5W6IU56ZuDTD4edKs6/oF6DnJcFEBAAA=
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771262214; l=956;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=Hvo5IlO99ABPCM/hqVZ1Y4fXZrYEN5B3qjOneRLrKhg=;
 b=MfQm463bnec0E5RgsmDMdA6JgvdG9sv2Lu/EAr0eU1pBLsxg8b/ukM1HsMikZ8NRDmLux/5P8
 vocyt4GZMRDBcUFwT+3RMtFWqxZT/lJTTQOMz2i7rvJ8NMUODw0dkM7
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: 3392A16A068C.A19EE
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: fc185faa-826d-4f14-a033-6999fa7e6790
X-Ovh-Tracer-Id: 5840324293924522205
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFyPzeg5vFi8fhmGVprhzggh4u0ouAOIS7HunTz9AvgyrcZurY5YLMwuM5t6TnEAVEzOpeHt6TLzg5sUJANmAEkgyTVklWkHbVojekY5NEuM4kiPTb0yk869c+IAVt+e3Lc05IwDwMyNyurPVNHCXzQjacqJIJId+owC2gpmI7ubDy8LEFhNhGSWGVKnoIRFT/e9Og5f1HqcBoMHK9119i2q2zAlVBdE4rE6w9MCNy7oYZ92Cx0hmHvRqxI+2caeBLc7QpN7Tr8kJUuU6ZXidr4BvgY8xzTRm5Ec2AD8/aTaPtzwmMD2Q51FgWDYS+EmNibetZlVOQKoyehJbS8QK9bN/nLs5cOv/70qhlK5OorwG3Hg+4R7PQDt8N+BkcNei0nEE7Yau3kUWekWSRk08/lUbu+W17OPTEioZJR9LoR9/g73qvkeAunL+qE1TkuV3vC1dXfI8f5vSjqqZpS4cVcDUnv1TMbt1gcxTvwQEZdfSSBwDQClKLilreT/trftNkRQsElxCtF04AYrM/nozH0APFdfva9iuNS638EXKOudKyl9KRwme8KRqnK+Lkoq5zPd70OGnZAw9bh9Z/S3IzGfd+rf6Q8MNWSrrUykP1z5926YmxSCA0owcpj5WY41N3GthKy7P7hmMxEUtod0EijLCJ2+mSOpsY4nJJk6eVGfA
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Feb 2026 17:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9591

This patch updates docker-moby to version v25.0.9.

This is not the latest release of the v25.0 branch but the latest
supporting Go 1.22, provided in oe-core scarthgap.
Updating to newer releases will require updating go to 1.23.

Signed-off-by: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
---
F=C3=A9lix Pi=C3=A9dallu (3):
      docker-moby: Update libnetwork
      docker-moby: Update docker cli
      docker-moby: Update to v25.0.9

 recipes-containers/docker/docker-moby_git.bb       |  11 +-
 .../docker/files/CVE-2024-29018.patch              | 344 ---------------=
------
 .../docker/files/CVE-2024-36620.patch              |  39 ---
 .../docker/files/CVE-2024-36621.patch              |  82 -----
 4 files changed, 4 insertions(+), 472 deletions(-)
---
base-commit: 8b1543e121deda2445f80f74d85c10316d5b31f4
change-id: 20260216-upstream-update-docker-moby-d0826db5916b

Best regards,
--=20
F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>


