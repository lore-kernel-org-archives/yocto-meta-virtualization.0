Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web09.1571.1582842056787462036
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvDFsLIB;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id v19so743682ote.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 14:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/Qc1U346pFldqlOqlCblrw2zdmZQ95ogWtCzHWUhHw=;
        b=BvDFsLIBu7GveV+TsEr+DjUaZ68d6u/Qi+z/fenuTU4v5E3iiMKzCjFPN1FOSyC6+3
         qtSyALofOAYBPF/qhjiYUv/aNNbdAj5WrWOBCk+Y0OBCZJAvzmMjhyr/yuKJjhiHD9Rl
         s89k82W4sbd6bCO9YcUMvU0WC3LyFyT64MySqg015smPvtsQhTfIfXVKHVfvUFandeHS
         giCK3oZK7nZ+hD+H1v8Kbh5HzWEFQNiJTpVD8ZokZiETju/eKyW3WDXoQKH608Bwym9y
         kGSVy8XHnctQW3y4BOKMj+0eiQJLhSi1o7LGh1QWQ+37XPEZUnasbkp/ePgaaKCc/25t
         WKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=C/Qc1U346pFldqlOqlCblrw2zdmZQ95ogWtCzHWUhHw=;
        b=AyzwqSeSPpW5HNrEhswdfc1td/PEg5/pj7NlSAoG6Lx6tWesOWN0lT35SNNd3W87q6
         dADm8JR5THWKRFIMz1PCkvxZgmP71uIz3GYCMlxF1X7q5PrmQgc8W7TMK0sWjZ+4r5z8
         6EMK55uFENgLvlkfsNnAolTIWdVHDFnzPJJTe5IP/LzTuGY2EbB9duWghwUY7bS7m4IE
         WhiqNNYg34D6zUCHauK+SlhG0rprPQGbh5cwYf6xDnm+Ce4gRVlSR9lcJHL8V2erZTaC
         39buezqMVRWdVJaWe2zquRFS9TJBKmWhdO7mcnWN2Qa+PPtUHK3FQhcj/FmscMqc7oiy
         b52A==
X-Gm-Message-State: APjAAAVi62XYg9jGhQSE7h/Pg2O9vFTlYFg+LSf8JFzBc5NWiZ6z9aE6
	xHFnX8O8JNMzFqFz9zROBW8RW4M7
X-Google-Smtp-Source: APXvYqxKEvwyenRcaSfvkQVBX9E5ncbcvKBxB89tzWibxA9D7n05nWdyHDDDxFS0UUVNxIRwXtBNFQ==
X-Received: by 2002:a05:6830:114:: with SMTP id i20mr879838otp.320.1582842055970;
        Thu, 27 Feb 2020 14:20:55 -0800 (PST)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id c123sm2464940oib.34.2020.02.27.14.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:20:55 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 7CABB2A05A0; Thu, 27 Feb 2020 14:20:54 -0800 (PST)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][m-c-s][PATCH] linux-yocto: make FILESEXTRAPATHS explicit
Date: Thu, 27 Feb 2020 14:20:50 -0800
Message-Id: <20200227222050.9084-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Something changed in the processing order for FILESEXTRAPATHS, that when
:= is used, defaultpkgname gets used instead of ${PN} and looks as
follows:

/project/../layers/meta-cloud-services/meta-openstack/recipes-kernel/linux/defaultpkgname/

Alter ${PN} to explictly linux-yocto to resolve the issue.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc b/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
index 843546c..cc774fe 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
 
 SRC_URI += "file://enable-veth.cfg \
             file://enable-iscsi-tcp.cfg \
-- 
2.20.1

