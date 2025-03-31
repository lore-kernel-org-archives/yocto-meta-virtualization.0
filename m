Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1005CC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 20:36:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.3165.1743453401737058715
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 13:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JbPRrUBx;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac41514a734so808959966b.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Mar 2025 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743453400; x=1744058200; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bcKAKXL9fvvVGVxO+xBtOCFwTtt65DhMCiseGB+VT4=;
        b=JbPRrUBx6n/FZPCoj6HloK+986ryMwo/6evEqwPQoJFmb9qnor5DhVOvorSpRvfmsJ
         86taMit/swZU6rRg0LWGusLmXiAL1yx5qNt89S0OIxGA3YX4Imqch1AeX3mdEL1JBe5o
         lkaUf7GzwWPofT21RwHUtjnfAM2JSDMez/ks8ggesBpS4jPYnKTySUS8UIjcNdgevNv8
         pdzwuGTDvKm3Qf4zExFFjHDbj0HU/QMwCfwbqCiRzdgSj2vn6lvptKtU7zwgST1MU2A7
         hPcSxq/U+ThIHKuDnpUuYXxMov1r9PrP/WmDD75/c1peT/1A/3Mf/PDGmGGUl+Q5BG18
         NHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453400; x=1744058200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bcKAKXL9fvvVGVxO+xBtOCFwTtt65DhMCiseGB+VT4=;
        b=e1tt8wcLf0ngRJn43ZPN/StvktnfDsu4RNI/QACHbNivqS10eIfDb/HQ3jv8lWdTpH
         7+FUgiK0ag2P+JnqEuUq2p0jGKSQnsvPuHxXitozZb6XbAKO5T56cWZxD4t5wn8uKYfQ
         SnqF/bcpy/AsdSZJNrm4Slmu+n0+8XouroI1gax3fSbpjlES97OxmQFPgS3j4BSQtyM9
         GAy7zNKnmEBfGn0CG3hc5M/if2t72cQSoxCDcWb2TIm6iPK4hgqE1Ib9JYnvdwz7aQXR
         IJ0WKScBvwNx2RjXSqeocOCzSDDBRMftO0BwxRjVBw/PMr/jxgMb2baXdhMwSIiyzpzO
         dmwg==
X-Gm-Message-State: AOJu0YzJHFdGaiQBIORfoJkfp8VyV6/6n9DXbMR103ZpHL/rFWvfVu2T
	AfGe3iesggzPkEg9GRrexrWy40Wr2zF/mLX5DgpX0pblQeKmwDbhVZGRV9tt
X-Gm-Gg: ASbGncvPJiPGSAp71kYys9aHMvJJzez8mwzNTk7FqtBb7axTFs1EkMgoiKl2Z17DvWn
	sfFf2pavqqhfT9kcwgKdE87FkLv+uUuja1Eod4gQsMjiVndPUi+RnHDjc7eKfmvWZUX+S0U9rkQ
	kAEO8OtwnE0u7ANxl8lHOA25x7ag6ZJvdns/QQapT83vYqzXIOWH4d7y15uY5ZHf0pi7RPR9td7
	AQiYxJxjHAfWRzsuTasvB+Fr1WXVoNCsyEIoJClDEV6HR7w8DcUgtcqp+JLgPIJfmytLleheijx
	8+Lk6q/2BXVLjxcEHeKQ+yTxYbxJJ8iLcNB68SWPeqNH24pyICQNxdnQjDlw9SVwTI8oPKfnefX
	QGQ==
X-Google-Smtp-Source: AGHT+IERc5C+1HHw0MT3mvbzS2jtOCvzIsV46zoTOM/lOyX4x9Q4U3kf4wMJsfv4V68EQcW4g+C3eQ==
X-Received: by 2002:a17:907:6092:b0:ac3:c7c6:3c97 with SMTP id a640c23a62f3a-ac7385ec8dcmr944307166b.0.1743453399757;
        Mon, 31 Mar 2025 13:36:39 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac719220358sm666561866b.36.2025.03.31.13.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:36:39 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Bin Lan <bin.lan.cn@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [scarthgap][PATCH] openvswitch: fix ptest contains reference to TMPDIR [buildpaths]
Date: Mon, 31 Mar 2025 22:36:36 +0200
Message-ID: <20250331203636.2882127-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Mar 2025 20:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9180

From: Bin Lan <bin.lan.cn@windriver.com>

The EGREP in ptest/tests/atlocal contains the build paths.
The CFLAGS in ptest/tests/atlocal contains the build paths.
This change set fixs:
 - set EGREP to "grep -E" in ptest/tests/atlocal
 - set CFLAGS to " " in ptest/tests/atlocal
by updating the patch
openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch.

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...est-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
index 571753a5..abad1458 100644
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
@@ -16,6 +16,13 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
 refresh patch to fix patch-fuzz warning
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
+Refresh patch to fix file ptest/tests/atlocal 
+contains reference to TMPDIR [buildpaths]. The fix is:
+ - set EGREP to "grep -E" in ptest/tests/atlocal
+ - set CFLAGS to " " in ptest/tests/atlocal
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+
 Upstream-Status: Inappropriate [embedded specific]
 ---
  Makefile.am |  1 +
@@ -37,7 +44,7 @@ new file mode 100644
 index 0000000..0b4587c
 --- /dev/null
 +++ b/test.mk
-@@ -0,0 +1,74 @@
+@@ -0,0 +1,76 @@
 +TEST_DEST ?= ${prefix}/lib/openvswitch
 +TEST_ROOT ?= ${prefix}/lib/openvswitch
 +TEST_DEPEND =
@@ -112,3 +119,5 @@ index 0000000..0b4587c
 +	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
 +	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
 +	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|EGREP=.*|EGREP='"'"'grep -E'"'"'|g' $(TEST_DEST)/tests/atlocal
++	sed -i 's|CFLAGS=.*|CFLAGS='"'"' '"'"'|g' $(TEST_DEST)/tests/atlocal

