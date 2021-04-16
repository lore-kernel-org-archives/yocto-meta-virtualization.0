Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.981.1618598525971834601
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 11:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tWSJ4ZgG;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id bs7so13432347qvb.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Apr 2021 11:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oWtZ9sF5t95Cp3urMv1tQ1aU6diMp6QHXmp/Uxpql5s=;
        b=tWSJ4ZgGZAQ10udyCvs6gwPzXtSfqQVsAtIqG8lNwAYo4uLTdSk4VZlUwLsnX8LeDU
         kyL65/UuB25dAKqJV12QPDOpxuaWFV11ZNnAWoK0oUE1GuJbuOkSOm2NvGI3UEB1Z/Nx
         pYukM6HQXMNU8yVTsAH6xjx0Gl2xr86vLpjGBf9ClepYTv8smiMbMPG8iiTvxaKO8BTa
         HVInnzPEY7sDBUTEZ2mqtARXi31Hyi2P5gZGfsIKITezrdzhKljZrpKg2spE6+M2FL1F
         HkPK9TwiXSKhqYf72nVvjzwHc5t1bK7QsDBgPeiyVJVmlCCRFdM1lyBX3fAvw5HOcJoX
         9QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oWtZ9sF5t95Cp3urMv1tQ1aU6diMp6QHXmp/Uxpql5s=;
        b=VwTK7bX6yXrWf9Lyu4SzmdrxOktE/hXjjSI8NhjDktrpQP4kl4JidQ55YrMtxJq4O3
         InFBb3tDkkTc83hzkK/ltiVcaOsHn4yx+5OZ+MdcAJy4FzrN1DlqPoO4oeaaCtHjZk4g
         Fs3p5yY0fvX4KpZEBFU/HIUa2vWeXEv61RalIBVEaEIj+rSWg2j6Vey6z9PZjmt/jxIc
         QcNqCo8B7whGFBdKaANjeKWr1O/64BB/VuI3/afZXTB4VgWyTlKooKnWt2mAEt/TfYmt
         /uJcfxhZYEnjbx4qxGQYojGfIIxCS2o8q1690JqiqJIYchnSs73zgj24ARmAm58q/Olx
         UAUA==
X-Gm-Message-State: AOAM533E/Kda7uPO9MqHGRfSAAjTmPmu8q46OpOgjnluUX/bh40sEdlv
	N8MBQbbDBRcwqrG6aeaCEvk1imGdApIhKg==
X-Google-Smtp-Source: ABdhPJw/muA6/c7UASgyIdIAf5/lIUhbmmb3qCtyQTkK+4MWqMq9rlnrsJDhxEiu1VLOVYyA9jPEKw==
X-Received: by 2002:a05:6214:47:: with SMTP id c7mr10083018qvr.20.1618598524952;
        Fri, 16 Apr 2021 11:42:04 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org ([166.176.185.178])
        by smtp.gmail.com with ESMTPSA id m10sm3922238qtp.43.2021.04.16.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:42:04 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v3 4/6] xen, xen-tools: Document the version update process in README
Date: Fri, 16 Apr 2021 11:41:34 -0700
Message-Id: <20210416184136.71992-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416184136.71992-1-christopher.w.clark@gmail.com>
References: <20210416184136.71992-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes the versions of Xen to be included in meta-virtualization
and recipe maintenance in release branches.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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

