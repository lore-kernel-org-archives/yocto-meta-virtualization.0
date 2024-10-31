Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7182D5CCAB
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 00:38:13 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.1957.1730335091291279937
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 17:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fx0/2TSb;
 spf=pass (domain: linaro.org, ip: 209.85.217.46, mailfrom: javier.tia@linaro.org)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4a48839bc89so96591137.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Oct 2024 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730335090; x=1730939890; darn=lists.yoctoproject.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayUdEqLkZV9hrnag0hdG9FszXpCrpx4g0JbBFhNpzL0=;
        b=fx0/2TSb7Y227eXkmvw5p/3XFhQcrWIrCgEzfghIm48aruWqG9Gh21gh7Llc702p+0
         X0FwCuk8VYyStRiDK1OT6FV00D3j3OooUdZRlQ+SIvvqVyldYeeAPDoKjw/usLAtzlPw
         U/X0uaNVoEVWRhfR6I9LGcMPo/JwdQYLRZoHQkoeHMWWTOnfngwFdsS7ffMID+yVzNt8
         sCiENhffMmqvlYl2pPyVtzwCFmGyxMp1hagSJ+Osm7wEu86HIpw7ANXM25IfZEgGUYo8
         /ArM9p5WL7i9klsKLldch3KchjkCY+rA6awDrRC/E2K6riwHnGTUhxRksJx8OZU4FnbR
         EfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730335090; x=1730939890;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayUdEqLkZV9hrnag0hdG9FszXpCrpx4g0JbBFhNpzL0=;
        b=oOTIRRrtNVpI5qQGHWJILlIHl377KE1DYguHdlWvQ2rL8rjORIwjfNBVJYIvEByLmr
         fYwBpXx5tJWpMz+9P6oWX15YaQs7xCs1VsVaHDZajOtwKas+yzFOsL7CvnG9hgPaW1FO
         Vp/K3Lb4CMyaASMF5HDcOhMCC/W4jh3FG/zoWsRCXxqjS4+V1j3qby9smh5sGKtYncsS
         pGuPmShQy7mIoara4H5xnALjeBtfjVy2Qzku9nOtykq1IKAKAI6jTNpNXRwj9C0zPOtZ
         WT2qPKYlwjCFWNgCrbaqhWI/NrhEg/hJ8zin6lIYDP6CLV0KvDgxoPdWYSf9oK2THZNF
         b6tw==
X-Gm-Message-State: AOJu0YxKm+Lg3WFSFyK3NwpcNVC6eV2lYfAG3pKGbmDG/jKFmmGYBz0k
	aVDuT6pORBKm6QOXPoppKVbgG6hfPuQu8r+8xvIxcbOuckyxczDYfvwYYtFCdOY=
X-Google-Smtp-Source: AGHT+IGo1SQXRJawYHocZCf+RmU9rmMp4KiQYLDq4vgfSrH9F0eVk0LvU4xzJKtD7cXlBhO69Neu7w==
X-Received: by 2002:a05:6102:54a6:b0:4a3:a137:ba7 with SMTP id ada2fe7eead31-4a9542a6648mr1591316137.9.1730335090153;
        Wed, 30 Oct 2024 17:38:10 -0700 (PDT)
Received: from jetm-rog-x670e-gene.local ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-855dada4f40sm81596241.17.2024.10.30.17.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 17:38:09 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
Date: Wed, 30 Oct 2024 18:37:39 -0600
Subject: [meta-virtualization][PATCH v0] upx: Fetch the proper v4.2.4 git
 hash
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFLRImcC/x2MQQqAMAzAviI9W+imHvQrIjJmp71M6VAGsr87P
 AaSvJBYhRNMzQvKjyQ5YwXTNuAPF3dG2SqDJdsb6giDZLyvjEn9eqsg0dbZcQyDCwZqdSlX5T/
 O8BAspXx+s4JHZQAAAA==
X-Change-ID: 20241030-fix-upx-src_uri-00d3299f5af1
To: meta-virtualization@lists.yoctoproject.org
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=javier.tia@linaro.org;
 h=from:subject:message-id; bh=OKUvdN0cp2BTkmlIrvlDo8ZrrUzstsQkgY7tj1UDPYE=;
 b=owEB7QES/pANAwAIAbXuwwuoZ3cfAcsmYgBnItFwN5o+I9PvyJlWegAFDuDR63/DVWAgNmJlK
 t64BMrA7K6JAbMEAAEIAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCZyLRcAAKCRC17sMLqGd3
 H0TiC/4sLX4UN7oa8QBex9ZnwTfs2pPXl3nnywOocAoC8NRX7axLI/MPoumTxsig8j9QLhmD+sJ
 EWdP3KZrUV4XskrqfEHOQ6huhkL+AlVdKDqn0LZKWxvxMh89SLdM7ZgtmLO64hcpryvwwaj4nEZ
 jH+NBXGtPxtI2jGoJrfvaTYrZsvpXhGq61AnNx8zbmdxEqNVEvfC8XL8RkQuWzkf67IK+zPUrck
 /OH//S6e3E6+I6bAM3Nw7paIHkY/W5TDo3NyRSYzj4EqYmImkDvVR9wWluXBP4b4UfW1A0W8p84
 zhlS4KVtwjcjfe2jSWNlJCtlkJ7oQjTHoagng+xPwlXQDtYyh4P8xIE26jHwfCs8qWMml9tWxZH
 cJJmXSeCYPclM/j5PZ7yY7YAaGc1G+dCtbrv7TiSigfV7ufN/dD/qnclLR4t6dCTJTkEK8Z8DAm
 XeqikkeX3uvNQwtmMSr/p7mCyypXTEgHG1LUtI748pU4zBRTUmlGXqnhdnUsrdsVexllk=
X-Developer-Key: i=javier.tia@linaro.org; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 00:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8941

upx recipe fails with:

ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from upstream
ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed: FetchError Fetcher failure for URL: 'gitsm://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1'. Unable to fetch URL from any source.

Likely, upstream rewrote the Git history.

$ git clone https://github.com/upx/upx.git
$ cd upx
$ git rev-list -n 1 v4.2.4
3757579ffc6fa8710b4b7a1055529fea9dcaf149

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 recipes-extended/upx/upx_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
index 870f0883569c61a7b2e8453eb35aaf87b697bbcd..d55789afccef5e39ef426b01a8e5faad1ff86691 100644
--- a/recipes-extended/upx/upx_git.bb
+++ b/recipes-extended/upx/upx_git.bb
@@ -2,7 +2,8 @@ SUMMARY = "Ultimate executable compressor."
 HOMEPAGE = "https://upx.github.io/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
-SRCREV_upx = "03c4184067d8f6cf7a9f7bffd3b92d0035f64eda"
+# tag v4.2.4
+SRCREV_upx = "3757579ffc6fa8710b4b7a1055529fea9dcaf149"
 PV = "4.2.4+git${SRCPV}"
 
 # Note: DO NOT use released tarball in favor of the git repository with submodules.

---
base-commit: 72ea52031c045bb6b4e13856f324b3ec28e333df
change-id: 20241030-fix-upx-src_uri-00d3299f5af1

Best regards,
-- 
Javier Tia <javier.tia@linaro.org>


