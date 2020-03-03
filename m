Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.4195.1583244641991898586
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 06:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b9oa0zUT;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id g83so2994709wme.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ulOo32d81ABUFE7isqz/9w8hRcqLhwQ8eyZUe+V8Juo=;
        b=b9oa0zUTXGdqy2SwzlM+EaNt76yFkw1xeqLWmZSW1PS2w+gwm2KIIePBOOXrY7S4gA
         RfJd5OI3MU4P+nPu0FQ9FfeI7nSSDJjOqhKAU8r9PovlbWmzVg235ZgWfVj7BqbMWYxA
         0aQw63SiJOprlDv2LzHfAalDoFysbEiy6aBc9HRKW5iSK5VB3/kTVpsWSuhh7/voSub6
         LS9C68cWErgrsKCDBDabHCXN0tE3EVKEaT6ZjU5ZZvzhot1JPCPdpEAvpOTDLF7qpzIh
         7IfiLvm0hkXfWdomRzD1gw6My+St0uuobCEetKXiRIXa/GwlQvZuQpNTNR+jIfKvL3wd
         le+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ulOo32d81ABUFE7isqz/9w8hRcqLhwQ8eyZUe+V8Juo=;
        b=lY1nou5igfQ9gMl3MPndj2kfn0UIozzXDdsPPdwXcSUhh7PTSEZmKjJmjtZBRwYZlx
         ZNwOm/RsIc+iyB8vfQZ7oz48wyNCIZ7Dg3Fp1OE0bz2GVXP11w7iXieENQCTahTebxc7
         X/t5uZj2FQHaMwXxaVw06jSxm/q9hi4R0QfbJ4Fc3JjaTPtCCRk+pa8L9TD66uQdvX6i
         svXrquvX2m25LEYONvOTHUBr2SU5Wkh+N37mjF5FwtVJqcPqb94cr031WBLUvDo7sRp3
         LnAsPz1j0acYevf/VUkVJDHuth9OnnMfQQ0S3OgriO/qfm6wPtX6ln8EkABawu+so8fc
         Rg+w==
X-Gm-Message-State: ANhLgQ2PbdeX9AdgS3EpGl00jVsoG4pgQTpCunOmp69Cm/nAxPPjO8Jv
	lTFCv/SjCyzIck4jcqOj9PpfJ/yE
X-Google-Smtp-Source: ADFU+vsRkFmh04yNjoaDLsg0qPV37Q1xNFStA1XoU3Z9DSyApljx+ofL4oxLHQ6MNxUYV893U44cNg==
X-Received: by 2002:a05:600c:145:: with SMTP id w5mr4296004wmm.157.1583244640384;
        Tue, 03 Mar 2020 06:10:40 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l4sm35640965wrv.22.2020.03.03.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:10:39 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] xen-python2: add the same COMPATIBLE_HOST restriction as xen-tools
Date: Tue,  3 Mar 2020 15:10:36 +0100
Message-Id: <20200303141036.5833-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303141036.5833-1-Martin.Jansa@gmail.com>
References: <20200303141036.5833-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/xen/xen-python2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/xen/xen-python2.bb b/recipes-extended/xen/xen-python2.bb
index 08d8e92..ad3c1fd 100644
--- a/recipes-extended/xen/xen-python2.bb
+++ b/recipes-extended/xen/xen-python2.bb
@@ -6,6 +6,9 @@ SECTION = "console/tools"
 
 SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
 
+# The same restriction as xen-tools.inc, because of the dependency on xen-tools-xentrace from xen-tools-xentrace-format
+COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+
 XEN_REL ?= "4.12"
 XEN_BRANCH ?= "stable-4.12"
 
-- 
2.20.1

