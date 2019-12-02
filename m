Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.6310.1575314850884541432
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b3Z2ZmCA;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id l14so741555lfh.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Dec 2019 11:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=skOBytSldSpkCCJBs9XWbBkzn6GW1+c3LOf3zShp9PI=;
        b=b3Z2ZmCA4d/4py45jNwmm5l4K2Vmm8sFRqBn/or3kSnu0p0LwWh2GTiUb7rWuLs1wc
         igxH7z1EJ27ZlOWg2MW0/W/6/Th4T5to2ptztcNlM86pRhiAwsiuSC8gPaWp9C+6y39V
         OIY2QGwjGDvcCufqtGhuFCvF4HvZeefbl0GXA+eq823XWlomYuUHm5BFlL4hCI6FPuPi
         C+D3reEP6hPnnkJsq756Ug1i9RfonG7/nu9ySFWwuqi0sKRoDxmYvKhmQiq7El+7DA11
         KX31pBZEm0cGWIyBerAGjO0dQeXMAvTUbV2/yyfoPZMJ8N97O1s45Cp/TnGHl1NDH15z
         Yw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=skOBytSldSpkCCJBs9XWbBkzn6GW1+c3LOf3zShp9PI=;
        b=GFdIWD16Nb6/RtWMc1uIzerjk9et6BNV0RERBIJHkMzGb9CnZTaxiA2t6twLxDQJ/C
         OWBsnEAiil9W74sn5fEzRNY+xqoLHCaCyr/XnGhhEhMYS1yF+tzhIl+z7Bh+p74vRiQx
         Aq/JfTUKRSfJ762YT8uHkRt+xCqbA3V2kgqA/hgv9EumVoRCcUwjPTjPBRxcnGMQggjY
         uMG28KlrFdZC2WESCoPHgajtHyYqfKHwAtJzt3Z3Tg7L7whCB6xF/l816TjY5VJWE+DY
         JuPwqbfSD1Zi1Wt+s5W/dIC4ulYhuXtCC6gDTlm0/WPj3pxosbKxCq4t6uspEEdrVdnd
         c07Q==
X-Gm-Message-State: APjAAAWO0o+0xOoU93WtCVy/iQeCymIoIlKIo7xo7pYiqzjoxJPC0ubO
	aJjwtsi0xOzgKPqctBNJc63qgzfW2Nk=
X-Google-Smtp-Source: APXvYqyFavgtUkMhGYFs+KppqzFL3Ik6ckfR+itQ+Dm8PgZrc7AVtSc8v3MXq3BP3Xm41ih0WOoUFg==
X-Received: by 2002:ac2:5983:: with SMTP id w3mr393353lfn.137.1575314848858;
        Mon, 02 Dec 2019 11:27:28 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id z20sm224534ljj.85.2019.12.02.11.27.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 11:27:28 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Qi.Chen@windriver.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 0/3] Uprev docker-compose to 1.25.0
Date: Mon,  2 Dec 2019 20:27:10 +0100
Message-Id: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

This patch set mainly aims to uprev docker-compose to 1.25.0 and also
upgrade some of its dependencies to the latest release version.

Test on a colibri-imx8x machine against:
https://docs.docker.com/compose/gettingstarted/

Ming Liu (3):
  python-docker-pycreds: uprev to 0.4.0
  python-docker: uprev to 4.1.0
  python3-docker-compose: uprev to 1.25.0

 ...up.py-remove-maximum-version-requirements.patch | 33 +++++++++++----------
 .../python3-docker-compose_1.21.2.bb               | 31 --------------------
 .../python3-docker-compose_1.25.0.bb               | 34 ++++++++++++++++++++++
 recipes-devtools/python/python-docker-pycreds.inc  |  4 +--
 ...eds_0.3.0.bb => python-docker-pycreds_0.4.0.bb} |  0
 recipes-devtools/python/python-docker.inc          |  4 +--
 ...thon-docker_3.4.0.bb => python-docker_4.1.0.bb} |  0
 ...ds_0.3.0.bb => python3-docker-pycreds_0.4.0.bb} |  0
 ...on3-docker_3.4.0.bb => python3-docker_4.1.0.bb} |  0
 9 files changed, 55 insertions(+), 51 deletions(-)
 delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
 create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
 rename recipes-devtools/python/{python-docker-pycreds_0.3.0.bb => python-docker-pycreds_0.4.0.bb} (100%)
 rename recipes-devtools/python/{python-docker_3.4.0.bb => python-docker_4.1.0.bb} (100%)
 rename recipes-devtools/python/{python3-docker-pycreds_0.3.0.bb => python3-docker-pycreds_0.4.0.bb} (100%)
 rename recipes-devtools/python/{python3-docker_3.4.0.bb => python3-docker_4.1.0.bb} (100%)

-- 
2.7.4

