Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E649E00890; Mon,  2 Jan 2017 20:48:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF16CE00890
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:48:14 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id s68so37342670ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LfAhyiwm2j23gqwI3VkIL3yr0c+MKuAE59qItzO+8rU=;
	b=R3SCPrvh7ceOrBjeVkBZh3nSTjuDTONpRgrg5yKcuH0PjHyDFywKn2IELdd/Hp8W/U
	cAOW7hYXCqV/lEegurPPS/yBJPUInj7ITTm+hWShpbECNUtLGGa+JKrhSZzMp780IMYY
	CZh1IlTlmowR/wiY90HdtVIr9ubE6EorEpclQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LfAhyiwm2j23gqwI3VkIL3yr0c+MKuAE59qItzO+8rU=;
	b=LidoX8BXdgDEDfPcZlwWeWV7RvTCEYT4v4UUj2MqX0NQXWt8IrHzB7Yxv3FZYyYuWo
	v99gD5vKk6OK/A5pll0OboYc5fP9hUgxtd9dWbZOshrVUgoA21I7RJKpOOVEPe9b1NFQ
	0LdMeBHak0qQZvHsocK2QRLqgBwCFDl3Sv0+LyJPr4ZpMCTx9vdYxKP6PTddUScI9gBT
	eIEwaw5+EgqAvnmdhwxlA1UxsKuO/nhRL16bYXTJNyZeul5U233b5NLAKYj/gwsywf0P
	361Rup6090ZhJQoDvODsVmXrqpooMnzRx3cNght4tsfP+bGrkgzD12Fu1eU46mboxKjR
	9PQw==
X-Gm-Message-State: AIkVDXJFIf6CnYq3rwQKNA9I7F2B8vOVxKiPhbV8cYZgi9/E3K7Ex9AXcDU890eFmYSiug==
X-Received: by 10.13.203.69 with SMTP id n66mr56786683ywd.220.1483418893711;
	Mon, 02 Jan 2017 20:48:13 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	v1sm16209892ywc.17.2017.01.02.20.48.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 20:48:13 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Jan 2017 22:47:52 -0600
Message-Id: <20170103044754.15012-3-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170103044754.15012-1-cardoe@cardoe.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
Subject: [meta-virtualization (krogoth)][PATCH 3/5] xen: add gnu-efi to DEPENDS
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
X-List-Received-Date: Tue, 03 Jan 2017 04:48:15 -0000

Allow Xen to build the EFI loader by including the required dependency.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 429a05a..0d156dc 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -52,6 +52,7 @@ DEPENDS = " \
     xz \
     yajl \
     zlib \
+	gnu-efi \
     "
 
 # inherit setuptools adds python to RDEPENDS, override it
-- 
2.10.2


