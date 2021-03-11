Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
 by mx.groups.io with SMTP id smtpd.web08.755.1615491047533552138
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 11:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Oa9Attnv;
 spf=pass (domain: flex--rburanyi.bounces.google.com, ip: 209.85.219.74, mailfrom: 35m9kyagkapcqatqzmxhfnnfkd.bnl@flex--rburanyi.bounces.google.com)
Received: by mail-qv1-f74.google.com with SMTP id h10so15911640qvf.19
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=C+TJc93wKS69errIKRgimDytMZhSQwo+IC0VC5/qvtM=;
        b=Oa9AttnvU9zzdxHgrB2xPl20cy4W4/5hTKxxdfB9L3VIKhWunbJX6qArdQNEJ9xh7F
         h4DsHij8mXErIDjWRlvJ/a9C3ernSyK/ZJETxfnUSryLpHw6kKFOGoTI9VJxWEq59yVW
         tOHZ7PZoOa4qQHQks1bFamdYhnNEGB9vX9HFLw8IxltA2KmNoKC1lFfurlGLehoc6pFo
         QqjGPRRcVb0bE8v12/W9coF3WLuZcxOhetwQJuTFqx9p+jWzHVNBanImfhrfvnyeYqwC
         /T87mGq/bMQ2fYQXaD/KljZqjCqOEaDmUNfRKGWP6zomAMGj0YPub7QcWqWpnhqBf1Pn
         aWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=C+TJc93wKS69errIKRgimDytMZhSQwo+IC0VC5/qvtM=;
        b=GrLG6XovesSvkpfPVbus73mj0HrubSyL+YXTxS0gQT54+0yByIUer56Sdhzts0iKON
         GyQ76rp51OGKGZ8RFPo/6uY0h8pFyAsb2vPKGyVyqUNK7Y1sYBda2EaA9+EMHP3DHEeY
         BqE9tTEhI4PwdbfzLSqxCe3dDNGbbIFqtnSOY6ZaP9D+NmYhG51wZDgi8L++K5z/N4Kp
         ELJ837VGJfevxO+Fw3+A6Gt2qn2+hB4EAXkDhSdfbCj8WZT8UY7JfWjV5PuyqxF1oMNX
         pwP3aO7rB1N2iRz8dErFdI9pDY3tGPA5QUAv+sCUYrEBCfo5b6Ouj9p35Cb1XHusSF+i
         y3hQ==
X-Gm-Message-State: AOAM532kpaONFJWLnwFcLtSzHq08ObFgbA5dmZnkCcOex5CXDLOHqavP
	/pU+0v41hTMpFqpOKlg7DvKeqs66kX4x9/kdLajS2yPa+Sy/59AbU3JGk37VMfA0k8ETAsWZHB+
	E5onkJfX4h17GnndqlKnW+6fOaR0QtZhhIw91cnDT5++fWb8VvEbsSKzOwVwrmVRtZJJugVdZPd
	cwmYd/bPD8/Wo/UagtNA==
X-Google-Smtp-Source: ABdhPJxoqZ+gZdZ4MK1AledY3wlJyxzLYj2Unitd6KSYm3C9KVc9xq9lAbAXcHx/Wx402LPMt4+lrG/L84nsvg==
X-Received: from rburanyi-linux.svl.corp.google.com ([2620:15c:2c5:3:f08b:e781:cc76:369a])
 (user=rburanyi job=sendgmr) by 2002:a0c:e9c7:: with SMTP id
 q7mr8873018qvo.7.1615491046430; Thu, 11 Mar 2021 11:30:46 -0800 (PST)
Date: Thu, 11 Mar 2021 11:30:40 -0800
Message-Id: <20210311193040.621009-1-rburanyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [meta-virtualization][PATCH] lxc: change download folder
From: rburanyi@google.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Robi Buranyi <rburanyi@google.com>
Content-Type: text/plain; charset="UTF-8"

The URI has been changed to 'https://linuxcontainers.org/downloads/lxc'
by the site maintainers recently. Updating the recipe to reflect the new
path.

Signed-off-by: Robi Buranyi <rburanyi@google.com>
---
 recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
index ddff9af..b422909 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.6.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.31.0.rc2.261.g7f71774620-goog

