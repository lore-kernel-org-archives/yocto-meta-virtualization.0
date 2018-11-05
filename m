Return-Path: <brendank310@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8295E00A54; Mon,  5 Nov 2018 10:28:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (brendank310[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A963E009AA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Nov 2018 10:28:41 -0800 (PST)
Received: by mail-qk1-f195.google.com with SMTP id d19so16525390qkg.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Nov 2018 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oaKU3Tbs4/4agM5+QDelv6f0bFeW0Um+8YkocbhUM/s=;
	b=jK3PA5zrC8sjY0iYSP8cAw17y7U6ASlbSc+z6fBIfho4QNNcqydxf9PxOe+LW9le42
	rJYo1plL4CyXMN8XGTq34tMIX8yOOXJOppR21zS/tx1U2HXHe8w3qx7e/00l2ALBl0Ii
	xWbK15iOuaOO5IWUqN8RYAYxI4daujpyhTv7w9A9sNK5Mwf1tpPIP6hxRbJJAAPnYfac
	X89FAuskL+w1bUe7tmKK/WIUZBQunlx8R71eRU1wTlgFMjM1k38HDV76c+PgrwbqS+Ox
	mSndONZ+DJDNXVuYZ6oexou3NXcGT5OvtsLT3xHHv4sKRh9kEfJgqVoGYlr1SE0WTDYx
	LSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oaKU3Tbs4/4agM5+QDelv6f0bFeW0Um+8YkocbhUM/s=;
	b=flHwAnFH4e8RQOwUlU+64QWFFSnWnaVcj993hZyinhP7RLk8nW1iRPuz1srrcASdmT
	X+xgHKkfNe1PT2wgoxmT91o0i049yN7KxqJEH7Jq+QZh8jj4Rv1ayfmjKK+6945jyk9y
	YJrWUUqgBkVugVY61lTMoBc1UWaqZl3fBKNwX8NacxXbWjGGTVJs6k8KCAMybt8T+9as
	dHRwyq9ak2b8gakCGo6Iri99PuRoMuEC+EEs0zXjF+3GZ78lat63TjYH6hExsjXJielV
	Tmp1gvBVThpV2IWvNSXFum/5p1xMuI3v82MiW7a1L+DPDUlvZGJaC9zQstqMkFEF7/YU
	GrFw==
X-Gm-Message-State: AGRZ1gJ2JgYmM68H06rkWOvB5Rh/utTVXtP1dccCjAHhvMc66bhaBaig
	czBsPTEDfPfZbgJka7dCVR9/Ov+V
X-Google-Smtp-Source: AJdET5fd7i6rJgqZc7Dg/n0tFkDnNgtvhQSI4Uw+iiv1NUhU/GKAakMX/cJ2xi6RiK4WJAAKu2rRIA==
X-Received: by 2002:ac8:2992:: with SMTP id
	18-v6mr22069639qts.266.1541442520480; 
	Mon, 05 Nov 2018 10:28:40 -0800 (PST)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.googlemail.com with ESMTPSA id
	p31sm22457295qkh.86.2018.11.05.10.28.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 10:28:39 -0800 (PST)
From: Brendan Kerrigan <brendank310@gmail.com>
X-Google-Original-From: Brendan Kerrigan <kerriganb@ainfosec.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  5 Nov 2018 13:28:05 -0500
Message-Id: <20181105182805.12356-1-kerriganb@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Subject: [PATCH] xen: remove sse tuning flag
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
X-List-Received-Date: Mon, 05 Nov 2018 18:28:41 -0000

Strip out the sse4.2 tuning flag to prevent sse instructions
from being generated in the build, which breaks the hvmloader
on some machine types (specifically core-i7 from meta-intel).

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2650413..7eb2ac4 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -842,6 +842,7 @@ export LDFLAGS=""
 # conflicts with -mno-sse so instead we strip -mfpmath=sse instead of
 # patching the build to be ok with this
 TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
+TUNE_CCARGS := "${@oe.utils.str_filter_out('-msse4.2', '${TUNE_CCARGS}', d)}"
 
 # Supply the full set of compiler flags via the tool variables
 # Yocto supplys _FORTIFY_SOURCE via CC/CPP/CXX but optimization -O via C*FLAGS
-- 
2.17.1


