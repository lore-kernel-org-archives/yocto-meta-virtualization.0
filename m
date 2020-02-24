Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17122.1582521584466091676
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t9dBg7yH;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 566ABE01483; Sun, 23 Feb 2020 21:19:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58D7CE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:43 -0800 (PST)
Received: by mail-pg1-f179.google.com with SMTP id t24so120559pgj.7
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uCcaBqKK66Bc8QYqhpcxPa4QICA1QiilWk0S1Zs3OaY=;
        b=t9dBg7yHmOSQT0AdXQIV3gp4AuajZiV3JAU6O9WM0tolRqzpUH1J3FOTVN3OVB3ttH
         UY5CJUMjZBTHv47CuPGa2Qml68Srb61ORB1+EcUbckcnIbbYa0ISSjaDtkWGzQW3T/VT
         x/Tx8PI6PwoA/3wzDnjRH2stesbn3hZ6FM1GouejG4dOk8kvBwH78p7hYxIiKo9HGFIU
         t8VfUi/Ls5WWjz2fFlfIO6u1YBqP1wBbgX/UL9Z0ayCQEvnpo8SpipyiXIoRcqS3NM06
         XbcDxvw2BjEjpxUpOaddzu7xUDuFueTcOEf2DNb18fMf2/Y3TY77yONyNLgmPuCvMfeg
         cMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uCcaBqKK66Bc8QYqhpcxPa4QICA1QiilWk0S1Zs3OaY=;
        b=bNfNgZQMUJSSqZGQS0sEN9XgmxUehuRKsFRwZMQCG2l6fe3bv7lliWa0th4Z23LaNw
         Q5RoBSYTbTdNLB0STJARPzAbedAqjI6iRMW9tklNG7ytqR2HHIcCeKI3QqaVklLXVPq5
         6DZVpRJCEtjPMURtPPa7Zh2Esku5LzW48J+S9y38CCsmrHl9ckxLYYjWjTNm5qzdNRJB
         19FBy2S5oipcslQ2G/+nmHSNmqA6WsIOjbQsXLqcJRN51UEWMQUdZY919ypEnNoSClKr
         Snu8bC15EtMMi7Xs1oUP/ze7pmg431+8PS6uXSOVlQG3I9fdRVVPfOIVQFe7lWCcQSB7
         Y2PA==
X-Gm-Message-State: APjAAAWhZiFHU2yxbbAX4/qk2kcTwWzOBW8uuJE49Q5G3h935dzBzOwq
	aQW3F5hX8tjuRzFtodX46HSvcFqa
X-Google-Smtp-Source: APXvYqxY7eCvfPJP/izGbCugSZx8WpPeTYRD+x8e2h82Dl6J/shfXjvZ6jwcozHfNpFuLOhjWX1PuA==
X-Received: by 2002:a63:487:: with SMTP id 129mr51267186pge.193.1582521582572;
        Sun, 23 Feb 2020 21:19:42 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:41 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 19/22] xen: add contact to recipe README file
Date: Sun, 23 Feb 2020 21:18:49 -0800
Message-Id: <20200224051852.21933-20-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Add myself as a contact for the Xen recipes.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/README | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index 3686530..5592b48 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -1,7 +1,9 @@
 Xen
 ---
 
-For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
+For any issues with the Xen recipes please make sure you CC:
+ christopher.w.clark@gmail.com
+ cardoe@gentoo.org
 
 configuring the hypervisor
 --------------------------
-- 
2.17.1

