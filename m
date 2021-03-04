Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.4974.1614856837388905299
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 03:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iOKcsrCY;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id w1so48684059ejf.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Mar 2021 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L4DDQyg+VlljiNOuApzJPDjvq7AW6lYOQeRJEvb7bWk=;
        b=iOKcsrCYbb8zSLFIA6nKGgwjOM8ltPRkyGNfv138vG1tynUnIW+1KwowmHzGE/mgbo
         FfPstem6og0GRreknaOHYtJoE4WQHehmUpv3GhsOVP6Xp0TW9Sn+Tbn1WgOpYCfFmyPX
         loV3Rm4A/L8awZhHtttbq4AKxyVLCDRs9fx33SjzvdBS/4RcS7jizAln3ZiwP12k9Kk/
         PH7gM+ME5UmlAniIDbKWnqd72uLuQmwD8bNhRd1TCoM9VAorNPz5hoAW/M/6CKVR9wDj
         OX/UXS5GGmFij/rmIZiesLDDR0Pt70Itii957z29+LdzXnlcxUPBHhkabujcbncOegIX
         14tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L4DDQyg+VlljiNOuApzJPDjvq7AW6lYOQeRJEvb7bWk=;
        b=sQ9p3gA8Rbv71kQFBBD/0CiKebsotb2LEHrHRyB37N7h7bg2q+kqO7cwL9/giFDSxD
         VdBHToXv/Y3vlKiLN2jy057+diZdFacwxaCSqYiSMcgSxLNe3xCXPYDFOTF6F78D2HFc
         p2EVjTcVa991ZRSDwLEPoz5dwp97vZ8/Cyh5/qA2G1ySx9W++zmtue1xIz/GJAKLknad
         gZI/sIPNuSsfNEQ2dIsbpxQvqevfednbpBMW+0BMh30VsZ4BJh7j+/h5TbVMNdbRwPAa
         Fy/ByZ8YKqdLK4VmKoR9To5EXYzCY1zKFxTbtbIRMTsgL/rsS2M1BasYIgk4/JGz1Q0D
         /8bw==
X-Gm-Message-State: AOAM532KkLpU1o72Ms/7LNYSnKMOlNLnNj9Ztc9NBj5SXhIy0ErHqgMK
	KOExCBnDBxkE1UgySmfBKkq3w3q0b4Y=
X-Google-Smtp-Source: ABdhPJx4tCd9lsoaDkbLSany7fJFHMPOIf+47wJ9Ypp5FrkN2sCEI5y23ZHFSRMjsgH9xVo1R4uPnA==
X-Received: by 2002:a17:906:f0d0:: with SMTP id dk16mr3767498ejb.48.1614856835625;
        Thu, 04 Mar 2021 03:20:35 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a14sm23343420edu.13.2021.03.04.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 03:20:35 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] riddler: export GO111MODULE=off
Date: Thu,  4 Mar 2021 12:20:33 +0100
Message-Id: <20210304112033.3508867-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the latest go version bump in oe-core export GO111MODULE is
on by default. Our build is not setup to use go modules, so we
disable it and avoid configuration errors:

| + static
| CGO_ENABLED=1 arm-webos-linux-gnueabi-go build -tags " cgo static_build" -ldflags "-w -extldflags -static" -o riddler .
| go: cannot find main module, but found vendor/manifest in riddler/0.1.0+gitAUTOINC+23befa0b23-r0/git/src/import
|       to create a module there, run:
|       go mod init

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/riddler/riddler_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index 8f71649..7beaf29 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -38,6 +38,7 @@ do_compile() {
 	mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/riddler"
 	ln -sfn "${S}/src/import/parse" "${S}/src/import/vendor/src/github.com/jessfraz/riddler/parse"
 	export GOPATH="${S}/src/import/vendor"
+	export GO111MODULE=off
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-- 
2.30.0

