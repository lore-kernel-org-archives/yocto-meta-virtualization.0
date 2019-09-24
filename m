Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E108E00D00; Tue, 24 Sep 2019 02:46:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [66.111.4.28 listed in list.dnswl.org]
X-Greylist: delayed 498 seconds by postgrey-1.32 at yocto-www;
	Tue, 24 Sep 2019 02:46:04 PDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B8C9E00B33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 02:46:04 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3456920814;
	Tue, 24 Sep 2019 05:37:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 24 Sep 2019 05:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=YtqANQkdf8tph/MGQIIjBj0D4z
	QlbUY93e4XijW9KMw=; b=gBQ6XomwuTK3FsfSAjNFxjeptNafCgcgKVZR/5OdHt
	MnIcnj2zxnLC4MdUodTb2QUDvMLZpMmWghtyLx9j+pqTGbFTiGyrEiI7fKQ0qrDi
	l6pcTd37/XQapXF2xPBhod8MSQ8TRDljV51Y/IU1trvrWelBysUF4XunID5iroda
	ryMr4Z44ISrss1TwAk8eUnYoP6rBj/s/y+LAVuexTWbKJT1FLBtooMkd01ufYA6w
	SjMdILokXi3DXaym+DzJoFp8vcLc14xsgjd2agYnOqtWAWD6HXdZvZrfoL3ZYk9X
	dzGzdMjkxIV6oUQ9BBFpNNagu6DLbhSfjJmhoI3YEpOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YtqANQkdf8tph/MGQ
	IIjBj0D4zQlbUY93e4XijW9KMw=; b=aqhdKrryK1lPVwy+A0Ja1nF5Mp9WF3mF2
	YSy0K58w+uZidVeWlaneW9MwW7bxj4sTT2HjVjuqX/GtBAUrmOtDm9nGVaVQB+6d
	BkkfR6xBirrttUxO2RpnPCfmjnpOm7B2KBKX0/vNxBOag3Azhmso8YyozQJrtE99
	hk9ZZALs2POg7OKpYUQXyGoM6jKcvDQl66f6rR5h2CxQhtJqKQ+sgXqmLKos15OS
	GI9fuzrOUEdGdkEg6QGG7xPh41GEJVQg3mrrAv8dm4iRXY3dm9Xv/wmK11JKrWMt
	uve1H7L/NB8LT0JbHRc6MmP64Qsu3X4cmqKTTFzs5vwX4QzWhuyyw==
X-ME-Sender: <xms:6eOJXZCRhnn5T3Vui3xUnIkomYJkDVOyxrXg-EVpImqnA9xqcXbNnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedtgddujecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdr
	tghordhukheqnecukfhppedvudefrdegkedruddurddugeelnecurfgrrhgrmhepmhgrih
	hlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfu
	ihiivgeptd
X-ME-Proxy: <xmx:6eOJXfykUCSqAIU6gwmHbE9H613b_GW6W-J-JEl7_YxrY_zp43_W9A>
	<xmx:6eOJXaf3vYhXq5R8ZRZmldovsoK47OfI3JfjrIT2WWZT-0cXWX4aeQ>
	<xmx:6eOJXVeYsIAh_cHQXbR1rTJ16WkDa1SY5y5kxt8Rkd6q-ukQawR0iQ>
	<xmx:6uOJXblXwrv4Iq8dgO71NhosLGqyr4qnRV_wpZ2PSyMjIPiBwG6fHQ>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id EB31280059;
	Tue, 24 Sep 2019 05:37:44 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: meta-virtualization@yoctoproject.org
Date: Tue, 24 Sep 2019 10:37:36 +0100
Message-Id: <20190924093737.265426-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] layer.conf: Change dependency on meta-selinux to recommendation
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
X-List-Received-Date: Tue, 24 Sep 2019 09:46:05 -0000
Content-Transfer-Encoding: 8bit

The recipe for cri-o already has an anonymous Python function in place
to skip the recipe if dependencies are not found so there's no need to
force inclusion of the meta-selinux layer.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 23efcb8..958efd6 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -21,12 +21,12 @@ LAYERDEPENDS_virtualization-layer = " \
     networking-layer \
     filesystems-layer \
     meta-python \
-    selinux \
 "
 
 # webserver: naigos requires apache2
 LAYERRECOMMENDS_virtualization-layer = " \
     webserver \
+    selinux \
 "
 
 # Override security flags
-- 
2.23.0


