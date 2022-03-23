Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FD6C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 17:33:41 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.166.1648056820084311424
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 10:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U+JCfTpM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j18so3153040wrd.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 10:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0i0A/GRrk+KCnC7tPoIAsx6xzvyrcmwc1gmcc/8s0DM=;
        b=U+JCfTpMfyQKZX7rwnu0FiqwmQYRacGwiqnHl8c0jCsxZqiC0ZNoSa6knCzP9AEC6S
         ac8ukiXGKrOclv3ew3xas4lXxREkNZpdN5IgiJ7PDFHBeG8yzXhde+YEbl8TRoks91bx
         Jrwny2FVa4tToiyzKsUJLwyaAevc32vzi6HPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0i0A/GRrk+KCnC7tPoIAsx6xzvyrcmwc1gmcc/8s0DM=;
        b=5XPm6FB964+V9URsN5xXKy3fViIMxBqITLl9x52XkXkZuUBRR/+lX/JHFruWRCzkCD
         8ni+hxkUHNkxLmpMUy09gWl8e7eaGAVd11KHOLvAtdbS8WGH6j3MiKbEN3a8LAFucgyR
         UAA+b/UIMRhdAAtFq3I34kAHrNpzBK0M19WSsWOmaU9FpOKDj4msZCf+PeLJM7hP5PZ9
         ycVg06s/7HXglXOA8UkT9OlM+T9NFfW2rPzu/qAabMk7KKMeEfNPsitjS90JSEVc1sN4
         zZiFivKFv3IR2r8thVUspJ06o2/j+aH/H0zUFwxY7fQU8JympZFYAs6st6oblxXGv+0x
         koZw==
X-Gm-Message-State: AOAM532RwRVn9QFANHIJ+1NUng49ZlgryQkp/ih1QIkB27igJuFRJjzm
	jA3dRTfJXpGdXptvlX/NQ5MnErnMPeDHOnPk
X-Google-Smtp-Source: 
 ABdhPJxv6lbGFzAJbhmcU75jNwVJyzn50VChcmsdmX29Hav1v/i6GlrDDQ1KQaLqR+KcdwiTPmMOpg==
X-Received: by 2002:a5d:6092:0:b0:203:f860:a84 with SMTP id
 w18-20020a5d6092000000b00203f8600a84mr928381wrt.160.1648056817826;
        Wed, 23 Mar 2022 10:33:37 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 e8-20020a056000178800b00203da3bb4d2sm504734wrg.41.2022.03.23.10.33.37
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 10:33:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] python3-sphinx: Drop as newer recipe
 merged to OE-Core
Date: Wed, 23 Mar 2022 17:33:36 +0000
Message-Id: <20220323173336.1284452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 17:33:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7109

A newer version of this was merged to OE-Core and there shouldn't be a hard
version dependency in meta-virtualization so this can be droped from here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 recipes-devtools/python/python3-sphinx_4.2.0.bb | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 recipes-devtools/python/python3-sphinx_4.2.0.bb

diff --git a/recipes-devtools/python/python3-sphinx_4.2.0.bb b/recipes-devtools/python/python3-sphinx_4.2.0.bb
deleted file mode 100644
index 01f36ea..0000000
--- a/recipes-devtools/python/python3-sphinx_4.2.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Python documentation generator"
-HOMEPAGE = "http://sphinx-doc.org/"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=82cc7d23060a75a07b820eaaf75abecf"
-
-PYPI_PACKAGE = "Sphinx"
-
-SRC_URI[sha256sum] = "94078db9184491e15bce0a56d9186e0aec95f16ac20b12d00e06d4e36f1058a6"
-
-inherit setuptools3 pypi
-- 
2.32.0


