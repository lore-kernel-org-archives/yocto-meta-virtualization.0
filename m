Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.1455.1574711830920176434
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 11:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mze6rjMX;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id e9so17338142ljp.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 11:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=txlomQpkLNsEQZ1ZlSgNa8BIBE6OxPyIio8unA+M7Zw=;
        b=Mze6rjMXhl+aunXOb4Ie0Q2upLi7CwoB4XucbxypfHhzdrA88av7ylprfmkaRkO6qK
         Nr4td2i9YjJATlCFqdyxwrGZxuo6JyK8ImQa2rdl5FToixxL64iB7Zzy3tle+a/xya4t
         xEkCZ+JLOR4cuJq7G4fCB6MW7Sca9GwG+Lxb775t6ele540+sB+ropfrWj72W/bU56D5
         mURzN6D8qjTb3H/l/2i7vga4jQq4mPYIiU+lY9KJzfhBwCwXLbE0BOlRkIWgKQYS1snm
         wXuHOxCe49+Kln45bsugQYX6diaM+w3a162x7Dy1thuerrsOQTYk+byzUlz4kWIdTk0m
         DZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=txlomQpkLNsEQZ1ZlSgNa8BIBE6OxPyIio8unA+M7Zw=;
        b=mLzgQJjTThAyvjsig5OiCI7DHSdo+Cjn12D671b9UrNd+nhI/YyiReE9vSnFs5wENl
         IGJMTJ8n338nUdyfMog5S+z+673f/k/7OAHVGV/EO0UYA2wImKtQUW9uxpGTEDQltM+A
         dLqPlUZekiomZ+ylDL7w1PwTIvSx4aeg17bKLJ1ZHHspCadHmZaOKzmY1hax4QlNcqxX
         1zLXCPu/P5nmrmasuFlMrBC4JXC7Xuyghc7M1afDRO/izuEqgbshzkjllC8NAltitbd5
         auk0EDrVe4hGF0+LQMiMadLKp5uZb2OBwZO336OxpLL0wzBH6y6oxLOAdcFDr00Om1ZS
         OgQg==
X-Gm-Message-State: APjAAAVuiYUxSx0Z1YAuX0lGq/RUQGRa/ovnQrYnDTdDF6yOOMwvmSLi
	wijbKsrJSHTvgP9U9ciXYf9UW6eezfY=
X-Google-Smtp-Source: APXvYqxVaV/DMpIIQEHPJgQyb+CpP1XOggAkAIOi35N+TtqNyC2arB050R4qXJQnJIZHzJcb476u8w==
X-Received: by 2002:a05:651c:1032:: with SMTP id w18mr11231819ljm.61.1574711828998;
        Mon, 25 Nov 2019 11:57:08 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id y9sm4088030lfl.16.2019.11.25.11.57.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 25 Nov 2019 11:57:08 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] meta-virt-default-versions.inc: fix invalid python-pyyaml version
Date: Mon, 25 Nov 2019 20:57:06 +0100
Message-Id: <1574711826-6354-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

The python-pyyaml recipe in this layer is 5.1.2, fix the wrong
PREFERRED_VERSION_python-pyyaml.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 conf/distro/include/meta-virt-default-versions.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
index 27e7b90..06ff9e8 100644
--- a/conf/distro/include/meta-virt-default-versions.inc
+++ b/conf/distro/include/meta-virt-default-versions.inc
@@ -3,7 +3,7 @@
 PREFERRED_VERSION_python-blinker = "1.3"
 PREFERRED_VERSION_python-gevent = "1.0.1"
 PREFERRED_VERSION_python-m2crypto = "0.22.3"
-PREFERRED_VERSION_python-pyyaml = "3.11"
+PREFERRED_VERSION_python-pyyaml = "5.1.2"
 PREFERRED_VERSION_python-redis = "2.10.3"
 PREFERRED_VERSION_python-sqlalchemy = "1.1.5"
 PREFERRED_VERSION_python-werkzeug = "0.10.4"
-- 
2.7.4

