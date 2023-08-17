Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058A2C2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:21:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.182554.1692260474991495407
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 01:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qz0yDeG1;
 spf=pass (domain: linaro.org, ip: 209.85.218.51, mailfrom: erik.schilling@linaro.org)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso984539966b.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692260473; x=1692865273;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HUSbpaugRKCTIqjj0OnsylBa7v9/dkCWhm/672+xS5k=;
        b=qz0yDeG1ISOHHywIUxLfGwz6pr1m+fGCA7cFJBrgfp3QOuJByJxakrjAzeOnRAVkKZ
         gKNFGx1NO36bJCEl51dR9gzAOicGXMudvlEqYQUx3C33Za3M1sRKdk72KA6GHdQlT3DL
         mAT2iuk6Ft8j9wkQKKPwn1eTC4/M7w6oznkkmSeCgnUs7u7b3LkRE4T9HCGY3pfBmKDu
         a1Cu6WtFJT64o7h9zM6SBMXBuWElbJBjN4BqYk2SCUNzFvwRflwL7Ql6xEDLVgocOLWb
         zeEckqZ5WGWTVVZ9jkWf8zQKKVyL7IiGhHfY/3uOGo0dklYsZPRxv58d3qRt48Zsltq4
         w3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692260473; x=1692865273;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUSbpaugRKCTIqjj0OnsylBa7v9/dkCWhm/672+xS5k=;
        b=Fa9g2MH5LQBkqw4/E/h0O69zLNSYeqexP7enLwceToJnOwBtiVVsZlJKDvxCW8ogbl
         azuqn1j6fs+3BtGrVGZj04Qf2OVneZQE47iDPlsSQIhok2g+OZZNlXri3J/yVfK+nMlO
         l3B1bLL8FZ/D8bRF0FqfYekOcwgq7ItUcz2R5dkX5lnpQdm3CSa0KJdYdpISGJf1Fe8E
         cBEV2NtFRqurQ/YhPdWwZvjhNbG1NPU6SsVdvU4rtNHKHfMgCyFWJSR8nGN3gthuDnWB
         yXhvlaacbxFTGJt/riSrX0o6E1qQbUfaZ4A00/ODDYViyVTuinvjCuTYN5Hoy/fvEdAI
         eRoQ==
X-Gm-Message-State: AOJu0YxY/vkyJsSOHZdl6UaXmXkGloiEG/W7ZU15rMjA2ZG1KTXIZmo9
	hSyKxPgjw5osywOueoieKEMAxzFS5gsBsvUnkRs=
X-Google-Smtp-Source: AGHT+IEGRm/m8WR4fODV3bCA+U5/sck0pzicMf6kdRpykWI+jcMl3AMPbtn4Q2nVSVjDKetY3VQhaA==
X-Received: by 2002:a17:907:2be7:b0:99e:cd0:d95b with SMTP id gv39-20020a1709072be700b0099e0cd0d95bmr285423ejc.18.1692260473428;
        Thu, 17 Aug 2023 01:21:13 -0700 (PDT)
Received: from [192.168.1.149] (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id jo5-20020a170906f6c500b009786c8249d6sm9840087ejb.175.2023.08.17.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 01:21:13 -0700 (PDT)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Thu, 17 Aug 2023 10:21:03 +0200
Subject: [meta-virtualization][PATCH] vhost-device: fix README.md location
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-vhost-device-readme-v1-1-dbc9a864306e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG7Y3WQC/x2NQQrCQBAEvxLm7EASlY1+RTwMO60ZMInMrosY8
 ndXjwVdXSsluCHRuVnJUSzZMlfodg3FUeY72LQy9W2/b4cucBmXlFnrNIIdohP4cIoYNOgxiFA
 1n46bvf+vF5qQhYt5fsnDPpJ/geu2fQHcpoCcegAAAA==
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Cc: Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692260472; l=753;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=XrYm1O7Hdh9VLUVR5lo+/EmCTb2FOvXGQGD/BztiDWI=;
 b=hdTvXJtKQlS029xauhxmzCce6/NzCEb4g+UYuqv02CEVeG+9A3u3j2+Gprymf/hhzeKmGyu7y
 vhPWb5hzUSpD91JoGzEs1u9mnYr2341u44VExm6Dlx01tuL34SZzn9n
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8207

I accidentially created it in the root while it meant to go to the
subfolder.

Link: https://lore.kernel.org/yocto-meta-virtualization/CUUO41I813NY.CPU5GWIZUCC4@fedora/
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Apparently I also messed up the README.md location...
---
 README.md => recipes-extended/vhost-device/README.md | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/README.md b/recipes-extended/vhost-device/README.md
similarity index 100%
rename from README.md
rename to recipes-extended/vhost-device/README.md

---
base-commit: 28205358690f79e13c1970ea7d61bce0131da027
change-id: 20230817-vhost-device-readme-49ce8d7d57aa

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


