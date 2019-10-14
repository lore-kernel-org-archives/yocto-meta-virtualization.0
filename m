Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B370E00C9B; Mon, 14 Oct 2019 13:50:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06451E0096F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Oct 2019 13:50:12 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 74DA25C1173;
	Mon, 14 Oct 2019 22:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1571086211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=WdqEUeuLjCRaFBcGDXZoQrmg44lkcJ5oTCE++jHKl8M=;
	b=nOVnSD3VAlWu3hXRul9vR51iMOurY/OsB8K0Nr505aIRp+RP1916EhyGWJGF8QABH67KBa
	sY43UohQaQXirqLLHvV4mNy8N/NfZADsCL75x+zzIUMrzDDha4tFaPIslDwcUpMlyzm8sQ
	UWFbh+y5wxPYuM3t5GNDt6avc0ShXW0=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Mon, 14 Oct 2019 22:50:06 +0200
Message-Id: <20191014205006.63611-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] podman-compose: move into subdirectory
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
X-List-Received-Date: Mon, 14 Oct 2019 20:50:14 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

The layer does not expect recipes in the first subdir. Move the
podman-compose recipe into a podman-compose subdirectory.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/{ => podman-compose}/podman-compose_0.1.5.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-containers/{ => podman-compose}/podman-compose_0.1.5.bb (100%)

diff --git a/recipes-containers/podman-compose_0.1.5.bb b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
similarity index 100%
rename from recipes-containers/podman-compose_0.1.5.bb
rename to recipes-containers/podman-compose/podman-compose_0.1.5.bb
-- 
2.20.1


