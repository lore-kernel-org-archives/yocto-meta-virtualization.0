Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.799.1618443596719232264
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 16:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NubYWhNp;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id o17so14946604qkl.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Apr 2021 16:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjQvKktIeHzWy91CKmM1yLzGFUbJjBXHTLvXbl5/E1Y=;
        b=NubYWhNpA6erqB9R9jJGnVPqKE5jF5r6qNKPUABjgUyqGh5ElUgWSszAnfguvbTIBW
         XcnM89nPyrl3BJO9ClF46erJja5g87UOl4VV0bz9vJR0SMDh8Mh0DnLr3ybgWvCIHUPf
         kq6a5r+D1O+VEaDOtvwKxCR6ZNpbKwbODphGE5lPReIAVTni7THZ23YPgmZelO+BpB7f
         qHYdZilD5RVXcw6XVC0fbfa+ioKpF4n7gqpgX9be/JVow3DhPyRVY4nWBc83YanNdJSJ
         VdODzwyF1SC5r5rtVIGBRKlWUwN1kb/PHuDzdHPN2nx5nvcXeYvxkCsdzhrT5p7icJFZ
         v1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjQvKktIeHzWy91CKmM1yLzGFUbJjBXHTLvXbl5/E1Y=;
        b=qEyFKd/S4BlbtUe1ZcjL8sFoBuR2BW8Q0LQ9+lKCKj3NAZXTTOeDwjtf2Cg4XD+zrE
         Nk3QjHYHfOhhsOkAqJLLbQC5jwXrizoL+QcTcRihvF2UBm04AcSvM9DBurkihFA8nTQ+
         ZSJvYvGh2pGHMNH0hEjHRV5urU/Qtn6mUukzH5EFx/nx1IhXJ/ConRVZbTlBW0B3B+OB
         ZVSrUnDX7ZnyhAPyvrU3uWjT2WdDHONdyCmWCOPUTRmfUIZ/o3eLHAc4XB87Zu6pXWMm
         Yn+6sbGIaBIKyDyQBuNCwLuJeY53Ird9gL1pZNo3U+1EC3P5GJcown2gki9XYn+lsnF9
         UDWA==
X-Gm-Message-State: AOAM5326gu8agqSczkHLKVkT0HXMe54R4uQCkxoyLItAd6MSFAMoycyw
	EScz9aAFPiTGT4t5ZJVeiQhTJH5ylrc=
X-Google-Smtp-Source: ABdhPJz8Uc/qFLuEJcXw3ZYd4g/n1wJXCbm0n9Zi5KGlnrA4P2wt05XUSWVFKKl2BZJzYrBPM20jcw==
X-Received: by 2002:a37:d2c1:: with SMTP id f184mr901174qkj.107.1618443595724;
        Wed, 14 Apr 2021 16:39:55 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-52.mycingular.net. [166.176.184.52])
        by smtp.gmail.com with ESMTPSA id q28sm736010qkm.15.2021.04.14.16.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 16:39:55 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v2 4/6] xen, xen-tools: Document the version update process in README
Date: Wed, 14 Apr 2021 16:39:22 -0700
Message-Id: <20210414233924.55589-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414233924.55589-1-christopher.w.clark@gmail.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes the versions of Xen to be included in meta-virtualization
and recipe maintenance in release branches.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/README | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index f286bb5..b9117f0 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -36,3 +36,53 @@ as XSAs (http://xenbits.xen.org/xsa/). The easiest way to include those is to
 drop patches in 'recipes-extened/xen/files' and create a bbappend adding those
 patches to SRC_URI and they will be applied. Alternatively, you can override
 the SRC_URI to a git repo you provide that contains the patches.
+
+recipe maintenance
+------------------
+
+# Xen version update
+
+The following rules shall be followed to define which versions of Xen have
+recipes in meta-virtualization:
+
+- Before a Yocto release meta-virtualization shall have recipes for:
+    - the latest stable major version of Xen, and
+
+    - the current version of the Xen master branch (known as the git recipes)
+
+    - In addition, there may also be recipes included for the previous stable
+      major version of Xen, in the case where the latest stable major version
+      is new and the prior stable major version of Xen is to be the preferred
+      version for the Yocto release
+
+- On Yocto LTS and the latest stable Yocto release branch, the preferred Xen
+  major version that is present when the Yocto release is issued must stay
+  supported and the recipes shall be regularly updated to follow updates
+  available in the Xen stable branch for that Xen major release.
+
+- On Yocto LTS and the latest stable Yocto release branch, the recipes for the
+  latest Xen major version shall also be regularly updated to follow updates
+  available in the Xen stable branch for that Xen major release.
+
+- On the master / in-development Yocto branch, new Xen recipes shall be added
+  when there is a new Xen major release.
+
+    - depending on the timing of the next Yocto release, the new recipes may
+      be preferred, or the prior major version recipes may remain preferred
+      until after the Yocto release
+
+    - the recipes for the previous Xen stable major version shall be removed
+      from the branch when it is no longer the preferred Xen version
+
+- On Yocto LTS and the latest stable Yocto release branch, new Xen recipes
+  shall be added when there is a new Xen major release.
+
+    - The preferred version of the Xen recipes shall always stay at the same
+      Xen major version once a Yocto release has been issued, and shall receive
+      regular updates to track the stable Xen branch of that Xen release.
+
+    - When new Xen recipes are added to a Yocto branch for a new Xen major
+      version, then any older Xen recipes present, except for the original
+      preferred version recipes, shall be marked as not updated anymore by
+      adding a comment inside the recipes. The older recipes will not receive
+      any build tests or be updated to follow the Xen branch.
-- 
2.25.1

