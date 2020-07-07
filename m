Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.8256.1594088364921499438
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 19:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a2UZF6Nh;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C3CCE01E16; Mon,  6 Jul 2020 19:19:24 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66A02E01E14
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 19:19:22 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id u12so30622313qth.12
        for <meta-virtualization@yoctoproject.org>; Mon, 06 Jul 2020 19:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0jmtx6wrJSMpRLirwb+XEr9zdTO5wI2Vnm/3JtptlB8=;
        b=a2UZF6NhRyYBdVf5Iaf/H4lzYBnalCPY31cbvucZq0SRFwqDcRijsVaAye+csHRA4V
         lyxhEucntodLzSXGjpHyQeYXB8plYwlfpZnHlmtch796GRmvrmS1NEtXiFWBcWYfYU7H
         sop3/iTU0MSJ7ra6Qi9hdcfxsNop8a+tlcdf52eZas4YtflicXUVVaSOUeoojq0ng/2y
         y0wpYNuq5qEJh8fJGYCV/uaGUWPSIm05RTxna15iCNojcd16nG9agSzAileySdrkeZKv
         C2wQMpa1wcouGNcCKSRwWmjw7BBn5bcVzVm/nUOCA47V+W+sG3y9wcGUxqvzdpsIZR/f
         xhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0jmtx6wrJSMpRLirwb+XEr9zdTO5wI2Vnm/3JtptlB8=;
        b=r5XgexhJfE9fGiFalmdmCRijh3hDnKisbdx8PMEGFwFqFe+ClQBTfbIJ9S6UIvJLyv
         Y+o/QGJQ0trwetesTulbct2drNdrDt2i9asByl+1hHPUViLdvmq2zIVKAjjEWcckXxZx
         HsInV3AWwjyRlD/Odf8VR29eKH/JlKNs1b65fLunSGN12WdvW0vVzMCnWxYN74Q5CHzY
         xguvfhsAXv9wNUnp9kU9KyG3v2xB+6OmET4QpKT/86kmYktP4mw/e05Zy0PfEMZhUjj+
         u5r+42sOUu6Jm7Bt1DtWtl4UfuO/4jG16UdnoZ1JCiDSONZqRJmkGAKxOkDhJno50s3t
         MB2w==
X-Gm-Message-State: AOAM533rEyYZ64AXv8bmFAKSiccOCbt0O0F2Y+P7T8N4/65XAPKQHLEu
	JVqH5nPaGA1by3UbI+bia02o1+Zv
X-Google-Smtp-Source: ABdhPJyOkUno9GHQCht9ijpw7LdNSKsglWbaai6V6m8+RjUHCf0TPONgJy7doQRoglTVkRtKafJgOg==
X-Received: by 2002:ac8:22cd:: with SMTP id g13mr53820288qta.100.1594088362175;
        Mon, 06 Jul 2020 19:19:22 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-195.mycingular.net. [166.176.184.195])
        by smtp.gmail.com with ESMTPSA id z1sm14042921qkl.74.2020.07.06.19.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 19:19:21 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 0/2] xen, xen-tools: patch and recipe fixes
Date: Mon,  6 Jul 2020 19:18:48 -0700
Message-Id: <20200707021850.9841-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

These two patches are to be applied on top of v2 of the previously-posted
"Xen on Raspberry Pi 4" series:
https://lists.yoctoproject.org/g/meta-virtualization/message/5495

The first patch in this additional series here applies a new upstream
patch to a fix a previous patch that has been imported from upstream,
and the second is a minor recipe fix.

Christopher Clark (2):
  xen-tools: apply kdd tool patch
  xen, xen-tools: configure: install defconfig to ${S} not ${B}

 ...xen-build-temporarily-inhibit-Werror.patch | 12 ------
 .../files/xen-tools-kdd-fix-build-again.patch | 39 +++++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb         |  1 +
 recipes-extended/xen/xen.inc                  |  2 +-
 4 files changed, 41 insertions(+), 13 deletions(-)
 create mode 100644 recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch

-- 
2.17.1

