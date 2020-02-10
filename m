Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17602.1581311311801522293
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dy53WPoo;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9601CE016BB; Sun,  9 Feb 2020 21:08:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F5F0E016BB
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:30 -0800 (PST)
Received: by mail-pf1-f195.google.com with SMTP id x185so3106888pfc.5
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JnbmaKNrQU9iB+RDvG2bUNOnieRd4SJgYZK6pGz+rHs=;
        b=dy53WPoovHI5sOQdO0zyFzNZOlFCxCY9w5X7uPUT30YmiVJOLNpoDvJt8jTTe1jmLU
         0RvRowTNKx92K+y0VJzY2YOvcdIxLlzc6l09+5JyJmX2DXxEhBb8+ZnIgl/XkSygrDE9
         bCNQ08H0mDLlFcIJmzDlwsLlvjRFtismSFMUMNwkoGOsUJdAawy1i5cT34nIzbH91APf
         7BsRbFU7RM1X5IP93ynv230cXNp47cFZDsruA5Pz9bqhC0tXFk8iCK3NCdElYM5psmDy
         mNh1jiatWue4JsaOcbmQ7eg9PmKFpDY5es3/nw19Dp5NvI1E3Kjkz+sjakwbypF3DT/x
         l7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JnbmaKNrQU9iB+RDvG2bUNOnieRd4SJgYZK6pGz+rHs=;
        b=J0YH5Jy0oBQOExMvy9g9KiIXvkflXM1XX26CjEZTImGHB6+eiW44HGfzAEWushZc+H
         uvYLCf9XZW4/jZHWm5nKiauITw5kQZ41jOanoiXb0/FeIWwLqv+/6xNVrXv9hEwjOux+
         KBSoyWomrN/YlSF5qCQ1Qx+YRcEEuBd3XmQCss6Wb0H5cca1Ei1w3E83CzuNkjv9mh3D
         YcG/cgPmYm6w2myIlxFNIMLq8SZz7Lc+zgiA6GAY+vYjGm38d7dkD+kyPcgyNBFheFq9
         LKursWaAA7wj6tJpGvv3UkWUsaPQ+pyhcuBNjuO3G9wfYburfO6HvHQzhSDljERZWGIN
         bGoQ==
X-Gm-Message-State: APjAAAWp8HhzLXVlRZ+xMoorYbFPz9Pns3c/XnuMsQnulyovznyIjjDJ
	rhCAW0DOX9fXlRBQhuXGvRYTxn8R
X-Google-Smtp-Source: APXvYqzhwOlni7co7bUAZXmKlp+1lgEFBN+N8A5PH5hYNGaUwKMAJCm3UezHJKT3a5TEh12rwNanRA==
X-Received: by 2002:a63:42c4:: with SMTP id p187mr8837008pga.57.1581311309967;
        Sun, 09 Feb 2020 21:08:29 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:29 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 10/16] xen-image-minimal: add kernel-module-tun for HVM guest networking
Date: Sun,  9 Feb 2020 21:07:48 -0800
Message-Id: <20200210050754.3534-14-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Xen HVM guests are only on x86 platforms so add the module via overrides.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/images/xen-image-minimal.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 63a1086..c98314e 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -16,6 +16,10 @@ IMAGE_INSTALL += " \
     qemu \
     "
 
+# Networking for HVM-mode guests (x86/64 only) requires the tun kernel module
+IMAGE_INSTALL_append_x86    = "kernel-module-tun"
+IMAGE_INSTALL_append_x86-64 = "kernel-module-tun"
+
 # Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
 XEN_PCIBACK_MODULE = ""
 XEN_PCIBACK_MODULE_x86    = "kernel-module-xen-pciback"
-- 
2.17.1

