Return-Path: <liu.ming50@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C8DEE009D4; Mon,  7 Oct 2019 03:46:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (liu.ming50[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.221.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC7A9E007A2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Oct 2019 03:45:58 -0700 (PDT)
Received: by mail-wr1-f65.google.com with SMTP id z9so14627567wrl.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Oct 2019 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zKIDI+Foe+d4lQW+RI6ziTih9wdORqVwTnxHrZ8H/uE=;
	b=ujNd6c/Vk5SB1bAOIrX9b8GejKXbw3HcXnhLxle8kGTlTqPOOG7ZKEM/+r90FOKb3T
	7SuIOXZy2o3iFVgVB01YUyJ3KTkD8hSeN8am3XwR0w0CIz4qqqD1Nk4ojBucT1wgNoMK
	LNm+vXEeEvmnOp5RRHg8M5zlTCo+rCRGpOsr1hko4aNkpbY5ZMGZ+FOwg4JqlbvBjN60
	3ttBPQXx+vey3qxNOOaYWvqgj1zJQRSvaKdNqKPR+ZgfMjtYvHblA7KN980hf7HYSx/c
	iGtqnpO6Wtg9uE1lNfOdssW/Ta84yUj+/eihr6HMyoEgXdyM2bnEzvZbyCe2gMB1Joqq
	jqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zKIDI+Foe+d4lQW+RI6ziTih9wdORqVwTnxHrZ8H/uE=;
	b=dajbDA62tXfiB1laoCHuHJGK7KqyIvQ6jNCSMM1Js91/CASXJFVBEd/LYE7fuKPYSi
	ppT9IV8gTTYSwEReBpKPTWBPf5Ka3hKL5BxUaxdAbfNGI6HMEuJk1ZqRl34TeEqmnb57
	8S4HsZBRso+cKQ7J6yAxoEQBOawMFG6GHd4KDiqVaIUhQR3MpOI8iMyPEZWjQqTwJfjU
	kwwAzSg1rvZQa76LrbnbWWRmv6iAfFFqtkA9+H/B825wzRel2A3EHzDVoipf0mzMgpC+
	ROSqketa6zQosbG6n0pgt2EI0BbxpZ3Qps2feQ1I7e1I80dQkYRkF3rDIJ5C//UZ/BzG
	alVg==
X-Gm-Message-State: APjAAAVl2KK33T0Mn2i4pyc8wGjroTmren0YPf2CmY+w2NWZ/EJO03/X
	W22CS28W7uL64BOAZjIrJfpZCJ0uhVA=
X-Google-Smtp-Source: APXvYqyOnfc4sN5C5irL0c7FU/XA6bRzt4W89F4F+sLuEER6tdnuZDD2JPaDlSsfj2MKmzA6p6gP/A==
X-Received: by 2002:adf:f684:: with SMTP id v4mr19388493wrp.155.1570445157693; 
	Mon, 07 Oct 2019 03:45:57 -0700 (PDT)
Received: from peterliu-Precision-7530.Home ([93.176.131.204])
	by smtp.gmail.com with ESMTPSA id
	t8sm13599395wrx.76.2019.10.07.03.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 03:45:57 -0700 (PDT)
From: liu.ming50@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  7 Oct 2019 12:45:49 +0200
Message-Id: <1570445149-7427-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] podman: drop selinux sanity check
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
X-List-Received-Date: Mon, 07 Oct 2019 10:46:00 -0000

From: Ming Liu <liu.ming50@gmail.com>

libselinux is not a dependency of podman, drop a useless sanity check.

Also fix some invalid comments.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/podman/podman_git.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 64e2672..835e4d5 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -16,18 +16,12 @@ DEPENDS = " \
 
 python __anonymous() {
     msg = ""
-    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
+    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/podman/podman_git.bb DEPENDS on or otherwise requires it).
     # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
-    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libseccomp']
+    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'podman', 'libseccomp']
     if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
         msg += "Make sure meta-security should be present as it provides 'libseccomp'"
         raise bb.parse.SkipRecipe(msg)
-    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
-    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
-    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libselinux']
-    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
-        msg += "Make sure meta-selinux should be present as it provides 'libselinux'"
-        raise bb.parse.SkipRecipe(msg)
 }
 
 SRCREV = "00057929f5acfd98341964d85722383363376d52"
-- 
2.7.4


