Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9680FED3F5
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 17:30:04 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27911.1777051800847298772
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 10:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bPXVR8IE;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so4324765a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777051799; x=1777656599; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbnw+dzUTMbtTMHJPuUHl7K4NWq5aquuKhDvrxAi8XE=;
        b=bPXVR8IEfrw6IpOMBxUl3HY/htq4S7v0ENO+it9e5IS41Brae7i+mJJ1U3dnyjy2Xc
         I/aaSm+qFBKuwYlnWVBsd3kSe2d54gYSzMoYuKNVnyf89a8Go/A6eMa15Mu1Gkq4U1Pg
         LqtVgJWVo+F3CA77KnvmMH1Fdg8Ve1lE3apeq2nPOyxgjUoWS0iXVEw19BYgVzkLzsYB
         6zyvsLiD7FaIQ4jnxBQIgiz+sh3rJYz3XycYB9ezsyVNZ99z/n6CumlbYRopbpHNFjw0
         6eX5aPtqiS/CkIBp/JaeUt67NjLAG1Qoeyd8pNUwxdz4+O7nWEJtDnlktSplljJggI7N
         YlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777051799; x=1777656599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbnw+dzUTMbtTMHJPuUHl7K4NWq5aquuKhDvrxAi8XE=;
        b=AZnqZNuly0OHBVAQB9KCyU61YjashqOjoxeV0hG/ZqZ+PvDdoFxlfd6PZ0N6T2qTLa
         iVTme/yANWTWHTn7BCvdzxC9WZKCIevHeu3cDGmIDGdJI5Y9aEkNGA7J+qkxFYjMvPQK
         Zz8Jug2EDJij1v4cuK0XS0dGTHPaJ29Elr467rtxR6J5BxEFDN0XnFKfhj+rq9+aNinH
         GRoS0BAHtkQjc+bOLIrwbrkSEmn/odBWk5eja2juDD0d1stxKkph/bAspndQl/IIPZoH
         X/jVoNx0F5Z3ylzsSGfhBgHbX+SoM5/wIkzJwrVU/84dp5ORMI8wKEYS3YaylC0BmORa
         xe1w==
X-Gm-Message-State: AOJu0YzBbSUv7dDkvWMAuxsU0e4d3Dh54xN60E3AUCbnKc1X3tE+3MDV
	FAqh5/dxXFnAxz5TZPU/A4SMiWZVbPvGYn/J8kLCqEE6+k6PsTmlDMq3e1iMtYyj
X-Gm-Gg: AeBDies7pYyTdvvlFRSIOAYw/ZwpSf7WbfgHjXT+gMAoNjisOMd8pYh6AFGVes7ajTw
	/+uPQ4Y0wzIFtKKp4FWi3dWIE5RlzDUNwJEVmkRvb4AVwlPaG+j8idQeztQw1YEt3z65+ctiNgO
	XKDfvY2v2FuZIXPCUJQiAvVRI+b+qww/1p1k30zK4aDFWQNJUW7oJr4zTtXCu5PO7Q06LPEkk5n
	X7qk/40ZlEuhnWwlV+APJDGulk/+YRLBYh0R26mSdffyscW3BZLB59w3YPchXz9M2k292tCy5nM
	mAmGzO/zvu7lt3xuY+sXUZPeZNBW+NeVo6UoKIoP9+1WTZl6MsMH8AvXYmu8EhFVMe4iJ5CuYrp
	M8CDP69INrmOUMVu/OBqF+2KD6+eFLEa8jFZVkNQiEptZMEifuewTsINWUwHFuBgIPksqFnbUJB
	S/cbOd4FwOdgjH3qnaMdPwjaAA9OC/vko6iz4FC9H+FUul90Bys51pT8A1EbmwX8JwGhTtx1Bvg
	jE4g8tGKKJEWQKdun5dj2Z+yFPBySJ5
X-Received: by 2002:a17:90a:d604:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-361401eb6e8mr23860579a91.4.1777051798848;
        Fri, 24 Apr 2026 10:29:58 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362c69b8257sm9268400a91.7.2026.04.24.10.29.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 10:29:58 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] cosign: add recipe for container signing tool v3.0.6
Date: Fri, 24 Apr 2026 10:29:27 -0700
Message-ID: <20260424172954.53051-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 17:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9745

Add cosign [1] recipe for sigstore's [2] container signing, verification
and storage tool [3]. Includes auto-generated Go module dependencies and
license tracking via go-mod-update-modules.

[1] https://github.com/sigstore/cosign/releases/tag/v3.0.6
[2] https://www.sigstore.dev/
[3] https://docs.sigstore.dev/cosign/signing/overview/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/cosign/cosign-go-mods.inc  | 261 +++++++++++++++++
 recipes-containers/cosign/cosign-licenses.inc | 274 ++++++++++++++++++
 recipes-containers/cosign/cosign_git.bb       |  19 ++
 3 files changed, 554 insertions(+)
 create mode 100644 recipes-containers/cosign/cosign-go-mods.inc
 create mode 100644 recipes-containers/cosign/cosign-licenses.inc
 create mode 100644 recipes-containers/cosign/cosign_git.bb

diff --git a/recipes-containers/cosign/cosign-go-mods.inc b/recipes-containers/cosign/cosign-go-mods.inc
new file mode 100644
index 00000000..afd34fc5
--- /dev/null
+++ b/recipes-containers/cosign/cosign-go-mods.inc
@@ -0,0 +1,261 @@
+
+# This file has been generated by go-mod-update-modules.bbclass
+#
+# Do not modify it by hand, as the contents will be replaced when
+# running the update-modules task.
+
+SRC_URI += "\
+    gomod://cloud.google.com/go;version=v0.123.0;sha256sum=e9c9509cf75beb9516795eeb113d01a20e2a71496a66ed736b6ed2a516878d52 \
+    gomod://cloud.google.com/go/auth;version=v0.18.2;sha256sum=34b85ed8bd9a295eafb429ff3f9eeb7af7102edfe9dc1e3dc60455d7113fd5d3 \
+    gomod://cloud.google.com/go/auth/oauth2adapt;version=v0.2.8;sha256sum=4cd64264bafc4dd05f645452d6e1485adf92309130bd82b4c595db10cd534963 \
+    gomod://cloud.google.com/go/compute/metadata;version=v0.9.0;sha256sum=f97e35d1c96239b8574054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca \
+    gomod://cloud.google.com/go/iam;version=v1.5.3;sha256sum=f153dabeb45cbb3fed0f840da4394f21818451421cbfb2e28740d7efe87123d1 \
+    gomod://cloud.google.com/go/kms;version=v1.26.0;sha256sum=702a9069cd88a80f40f89b2f1df00ac491ffff1abd47bee36b3734dd280ebf2e \
+    gomod://cloud.google.com/go/longrunning;version=v0.8.0;sha256sum=3f7c0501f17f58d774611e588d007121c42707dd76b2ffd9577cd870daf44f71 \
+    gomod://cuelabs.dev/go/oci/ociregistry;version=v0.0.0-20251212221603-3adeb8663819;sha256sum=1cc9faec3e7e226dfbb13311ab366e166ad5c343994fb4de74aefc41007685a7 \
+    gomod://cuelang.org/go;version=v0.16.0;sha256sum=8d04731f2b164d0050140a0a649a271a0fd5db4377b764cb1bbd168ddadfd3cd \
+    gomod://github.com/AliyunContainerService/ack-ram-tool/pkg/credentials/provider;version=v0.14.0;sha256sum=90d9986ca69eb9dd2129d13ddc3b4265225dbcf2cf1de5ebcbc82ddf0dbc7d75 \
+    gomod://github.com/Azure/azure-sdk-for-go;version=v68.0.0+incompatible;sha256sum=c40d67ce49f8e2bbf4ca4091cbfc05bd3d50117f21d789e32cfa19bdb11ec50c \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/azcore;version=v1.21.0;sha256sum=763cf24cc12852b7bab952ac524a30bc7a6047ce6c446397a5b85234f72fccc2 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/azidentity;version=v1.13.1;sha256sum=98012cfee26379a030c430ee2218c396201a9f9a35f17867c6f5c8a7cb6839a5 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/internal;version=v1.11.2;sha256sum=88c28c7f95f1ab392d5bf5e98569b30b834721978e2d7d4dc2eed1bc08f6f4e8 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys;version=v1.4.0;sha256sum=44808d09830b847b6f969fdead1d87cb0b1f6ab5abf146d4dd762dc0561bc587 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal;version=v1.2.0;sha256sum=fea8b9a6517633da1b023698f9be20868fa21ef5886847bc9a939fbac89c7dee \
+    gomod://github.com/Azure/go-autorest;version=v14.2.0+incompatible;sha256sum=89ac786da5b108e594bb1fbbf8f39a822fc1d994be1ff7cc6e860e8b45f3d80c \
+    gomod://github.com/Azure/go-autorest/autorest;version=v0.11.29;sha256sum=f3e965c991c8205cd97a4616ade8dd0d179f4b849a56420e0dd2bcd8e0d74cec \
+    gomod://github.com/Azure/go-autorest/autorest/adal;version=v0.9.23;sha256sum=f65e30aa3f755d9c6ce990c9600ddf5094b45659eb57afc4d9750ddf00a553f0 \
+    gomod://github.com/Azure/go-autorest/autorest/azure/auth;version=v0.5.12;sha256sum=c626f2bd8952bbe98d79080441ec856a2440c7405465da6d7ae6b8ff7ccc2c12 \
+    gomod://github.com/Azure/go-autorest/autorest/azure/cli;version=v0.4.6;sha256sum=cdc19569bc0dd13c3e52dc9babb064a50d0cf15bf5806357b31ba27b6e52a6be \
+    gomod://github.com/Azure/go-autorest/autorest/date;version=v0.3.0;sha256sum=7b59c0421eaf8549f20d17aab7e3e4621e1798de1119dac65a04c110d110d64d \
+    gomod://github.com/Azure/go-autorest/logger;version=v0.2.1;sha256sum=90c84e126b503027f69d232f4ce5758ae01d08ea729c71539ebff851f2477b49 \
+    gomod://github.com/Azure/go-autorest/tracing;version=v0.6.0;sha256sum=b7296ba64ecae67c83ae1c89da47c6f65c2ff0807027e301daccab32673914b3 \
+    gomod://github.com/AzureAD/microsoft-authentication-library-for-go;version=v1.6.0;sha256sum=b5bd3c20f1152ee71546ed7d11466878f85cef9dee35b47ad6218e621d9cc4dc \
+    gomod://github.com/agnivade/levenshtein;version=v1.2.1;sha256sum=26bdb12f38a5ca1c45a666e8dea1c409189a383443fa14f4ff04f75af7022534 \
+    gomod://github.com/alibabacloud-go/alibabacloud-gateway-spi;version=v0.0.4;sha256sum=07fec6942fd2a40ecd197fba04920a7893b6313899950f9f06c2254f12c39268 \
+    gomod://github.com/alibabacloud-go/cr-20160607;version=v1.0.1;sha256sum=218d719db6ddf2d88c0258883c251f708cb8a4696d071a25061f6c646c6d8273 \
+    gomod://github.com/alibabacloud-go/cr-20181201;version=v1.0.10;sha256sum=e895c3c0877d704c37c6c5392d3e9986339850f1ee0373c6bc881e48b298f59d \
+    gomod://github.com/alibabacloud-go/darabonba-openapi;version=v0.2.1;sha256sum=d39d097d12a30c4a6e7bd4ed640d9c9f81e7722cbf487742c0204efa53506e9a \
+    gomod://github.com/alibabacloud-go/debug;version=v1.0.0;sha256sum=ca74856ab94c36c0c1631eeedfb5cf8f7d1f2fea44a6cee9e2a611c5955f0762 \
+    gomod://github.com/alibabacloud-go/endpoint-util;version=v1.1.1;sha256sum=0711665f45c66ad2051ee9c08eb0cc59a9c77baacafeea8b791b8eb782c7fa6f \
+    gomod://github.com/alibabacloud-go/openapi-util;version=v0.1.0;sha256sum=117c207e8e301207ab029cc33fc60e7724ed988ff959935510ee45b1ccf7ee62 \
+    gomod://github.com/alibabacloud-go/tea;version=v1.2.1;sha256sum=c3cfbe14863c74bc7ae0edce4de380f0db62d7432bfd4800eb328c135fa03f86 \
+    gomod://github.com/alibabacloud-go/tea-utils;version=v1.4.5;sha256sum=1390da07d391ce5e34ce7d01b32e44283cd82c52c30cc8e3a694b0e2f3d08ddb \
+    gomod://github.com/alibabacloud-go/tea-xml;version=v1.1.3;sha256sum=41202fed6a5acef24b413d86ff4977c18008876cfd82d7aa81ee4f4d1334c2ae \
+    gomod://github.com/aliyun/credentials-go;version=v1.3.2;sha256sum=4ffe97620cb492a48965599a0f6e2e7eebb70a97ae774ade3bede9fc1edff661 \
+    gomod://github.com/asaskevich/govalidator;version=v0.0.0-20230301143203-a9d515a09cc2;sha256sum=0f8ec67bbc585d29ec115c0885cef6f2431a422cc1cc10008e466ebe8be5dc37 \
+    gomod://github.com/aws/aws-sdk-go-v2;version=v1.41.2;sha256sum=02bc90aff4c5db96bf3b97c6b898be16ad19850fac6add54bfe8cf47c9456966 \
+    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.32.10;sha256sum=6bd6e853abde0a04193c72f3e76a6496aa6e8bb4a31c72936ee6a445bae86dc1 \
+    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.19.10;sha256sum=3db3769e1ece97e7426609583c0404985a07b6346e3b77266ac59c8963bbd7e7 \
+    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.18.18;sha256sum=49f9782b1957811bbcef0f5f23d24d05841b0695c67a012c6f1239e7c0b0e7f9 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.4.18;sha256sum=30853dfcc993ba7a7d0a9f8436f51dcf70b426abd7d44c817d45f72f1cd85cf3 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.7.18;sha256sum=6eb3aa8e1b8288f69fce5d15abd31909064c119bbbf0edcd94bb404018e1f998 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/ini;version=v1.8.4;sha256sum=f34dd5f3521bdb07f657b88348bbafbb68f41d134bcb615356122e56c1117600 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ecr;version=v1.55.3;sha256sum=1080996028df7bb2e17ce1c1511b5587e8e6522ec4ad73e1e431abe558009d25 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ecrpublic;version=v1.38.10;sha256sum=07284fd1309ae2351c22bbe7153ef7f24a128d6197d11b5d747d3ce9c441fd78 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.5;sha256sum=f4365491d985ec3e9c886427643361fcec012e5a8954bc4e36fc73ce093ddaf3 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.13.18;sha256sum=44a24021cd943a2a3410049272a4585cdd804e444a94499efc30c58356c05bab \
+    gomod://github.com/aws/aws-sdk-go-v2/service/kms;version=v1.50.1;sha256sum=29a88aad36078661fe4481009b80671dccff222aea241c231813ece4bddf5653 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/signin;version=v1.0.6;sha256sum=c5ef46f10cac219c82efae68542e3b11c79f745a83836df3be624f812874d3d4 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.30.11;sha256sum=1b4c55e13d47f1af36bdc17e9c8b7eb9b0741e658d65bd6a27b01529b92e578c \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.35.15;sha256sum=bff63145dbde5c3b40108f65e9165af03db979a37f2cc3235565c5f545abf216 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.41.7;sha256sum=8947d4971e55f7c3f0fe037630e509abd91bd0be913e627a10db6da7332cfc14 \
+    gomod://github.com/aws/smithy-go;version=v1.24.1;sha256sum=7bea6fb2be620fdc7e6fd4364478d9eca03e9b130cb2088e300ed2847e26a5ea \
+    gomod://github.com/awslabs/amazon-ecr-credential-helper/ecr-login;version=v0.12.0;sha256sum=4502354101353d12ef87a27db3afc568865eb10d43c4c5b36b5e172ffb75829a \
+    gomod://github.com/blang/semver;version=v3.5.1+incompatible;sha256sum=8d032399cf835b93f7cf641b5477a31a002059eed7888a775f97bd3e9677ad3c \
+    gomod://github.com/buildkite/agent/v3;version=v3.118.0;sha256sum=6ded12a893b9b0881f6061d1a0fdc7a3f9d7ef4691fb6490d82d381c80aaa97b \
+    gomod://github.com/buildkite/go-pipeline;version=v0.16.0;sha256sum=fcc049d51dc8778f57571df98af46fc3e30b31a39466ee95abd29aad7b9501a0 \
+    gomod://github.com/buildkite/interpolate;version=v0.1.5;sha256sum=f7f46fd8fa141675b86e663841f649242422e61f29c86ce8831bdf53ecbd3683 \
+    gomod://github.com/buildkite/roko;version=v1.4.0;sha256sum=e875911054813654014a84a90317927a5e6a248f3fd2b0d56a6c3b815c610e0a \
+    gomod://github.com/cenkalti/backoff/v4;version=v4.3.0;sha256sum=ef220b1ebf3bff4c46bbad5b2e123030e812b722b9e9dc88bc35956f9c622c2a \
+    gomod://github.com/cenkalti/backoff/v5;version=v5.0.3;sha256sum=58e4d9014277bc1c5c7ab64539137923964cc3920303a4f771d02a532939bedb \
+    gomod://github.com/cespare/xxhash/v2;version=v2.3.0;sha256sum=145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3 \
+    gomod://github.com/chrismellard/docker-credential-acr-env;version=v0.0.0-20230304212654-82a0ddb27589;sha256sum=50a1e7708257a9014d9463fb5ae1401da96859a84a3e91ed861b3cc5830d2329 \
+    gomod://github.com/clbanning/mxj/v2;version=v2.7.0;sha256sum=4451f64589cac692c9caa68be16551d6391949379a5bceae5455070198dd0918 \
+    gomod://github.com/cockroachdb/apd/v3;version=v3.2.1;sha256sum=6ad54bb71a36fba8ca6725a00d916e51815a4c68de54096313ca6fffda6c87c2 \
+    gomod://github.com/common-nighthawk/go-figure;version=v0.0.0-20210622060536-734e95fb86be;sha256sum=d0e1080f421d295735e6084ca0879bcf00b059d2af2246679be96a230b71c456 \
+    gomod://github.com/containerd/stargz-snapshotter/estargz;version=v0.18.2;sha256sum=3ba05758c81ad89701d66bb34a9025e688d3e6b58784c2cbb4c6adfbae574435 \
+    gomod://github.com/coreos/go-oidc/v3;version=v3.17.0;sha256sum=fba667f687448a228315d6f0cfd00a5fa9ab8ad9b511e38575a699afc0b30aeb \
+    gomod://github.com/cyberphone/json-canonicalization;version=v0.0.0-20241213102144-19d51d7fe467;sha256sum=9492fa89d9f2543890346672d239c494ccba4073be51f338b50e8f749792e25a \
+    gomod://github.com/davecgh/go-spew;version=v1.1.2-0.20180830191138-d8f796af33cc;sha256sum=b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128 \
+    gomod://github.com/digitorus/pkcs7;version=v0.0.0-20230818184609-3a137a874352;sha256sum=c4c8c4f4f331709c7c9dc40035fa0a9c23c98e8a7777cfaafe2013301e69bbfb \
+    gomod://github.com/digitorus/timestamp;version=v0.0.0-20231217203849-220c5c2851b7;sha256sum=0e79eb53bb9d500f26e33a58bb0cced31d72f91b3205c7685e6126cce267c683 \
+    gomod://github.com/dimchansky/utfbom;version=v1.1.1;sha256sum=0c1a11101602d5f57ac3e790c0b72e09ff87d8d535535f43fbee9e6a42327350 \
+    gomod://github.com/docker/cli;version=v29.3.0+incompatible;sha256sum=2612c3a3b39af2662e22ff8c55c6bea681191e6174e3ef3995de81135631424a \
+    gomod://github.com/docker/distribution;version=v2.8.3+incompatible;sha256sum=8f08722c5459cb4d9aa006e1fae094997da372098f4e14a59215b1ed3d48738a \
+    gomod://github.com/docker/docker-credential-helpers;version=v0.9.5;sha256sum=2a01551502cf37b523c7137d92ec8fbc99aaa5a4b83b2b8f27fb0b47a394b3c5 \
+    gomod://github.com/dustin/go-humanize;version=v1.0.1;sha256sum=319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46 \
+    gomod://github.com/emicklei/go-restful/v3;version=v3.13.0;sha256sum=06bd60484b324de0b8e4366d4ed326db2e1dc730459b46e19a5306a108439c77 \
+    gomod://github.com/emicklei/proto;version=v1.14.3;sha256sum=bb06405e5df4c1b41a7f962866e9d50866f9f9bd6b7e2282938b3b57bcaf556e \
+    gomod://github.com/felixge/httpsnoop;version=v1.0.4;sha256sum=75aa471311265e9860df0e523400b4650ed0c1a33262786a421f07226792e494 \
+    gomod://github.com/fsnotify/fsnotify;version=v1.9.0;sha256sum=94e64824b23591b7aa504e3321d5ec3f57de88f4d49882eaefbbf6820dab746e \
+    gomod://github.com/fxamacker/cbor/v2;version=v2.9.0;sha256sum=5b0ec6424bd522aeeeab30cbdcad6f40bf976a9a2ddf125ab27b97826140d97a \
+    gomod://github.com/go-chi/chi/v5;version=v5.2.5;sha256sum=f78c1525f8b3af815bcf3406c0aba1f272eff96413ff51874677bf8a314fcad8 \
+    gomod://github.com/go-jose/go-jose/v4;version=v4.1.4;sha256sum=06a37b6668012a2dd109a5f71f6ae15387dc808b35d3cf73f5e406e78a17b027 \
+    gomod://github.com/go-logr/logr;version=v1.4.3;sha256sum=523d7a3587fe73f61ef41c8bc627f7d7f38de8104d46278154b307e60770ad70 \
+    gomod://github.com/go-logr/stdr;version=v1.2.2;sha256sum=9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef \
+    gomod://github.com/go-openapi/analysis;version=v0.24.3;sha256sum=9d0a3b9a0fe14bb4b4880d93f98c459921d1ec4bcd160c1de23433c24285f7e5 \
+    gomod://github.com/go-openapi/errors;version=v0.22.7;sha256sum=815a7979d3e3c7048b8bcb82d59c9e3de4fc7882c7de3a9b9e94eea02fba2651 \
+    gomod://github.com/go-openapi/jsonpointer;version=v0.22.5;sha256sum=c77c1b57229c8d8cdd8d17a7137dbb44e10ec8aa1e24691bb380485b759a4e37 \
+    gomod://github.com/go-openapi/jsonreference;version=v0.21.5;sha256sum=e451bfc44c231ea285921a412f63b47518c3529cc29ba3a67d8293a9e57f0bb8 \
+    gomod://github.com/go-openapi/loads;version=v0.23.3;sha256sum=51a80f3cdfdc4b12ee2c7bac33395e031dbfcc7673d3087d91cd77506a729eb9 \
+    gomod://github.com/go-openapi/runtime;version=v0.29.3;sha256sum=238a196a270d224d4e558719e8ac0606d4d1729cb9f31957584fe14cac179e9f \
+    gomod://github.com/go-openapi/spec;version=v0.22.4;sha256sum=3a0ed5b0ee766e01758a08afb06ae7d0ca9b1a877528a4e3c94056634d5534d8 \
+    gomod://github.com/go-openapi/strfmt;version=v0.26.0;sha256sum=82d8e99220f9ab4fd7d53ccf5fe96638f8b18858d18e994434f358d10dc95d12 \
+    gomod://github.com/go-openapi/swag;version=v0.25.5;sha256sum=aa93ca1f6074ff1d4abb336a41db19e5c8e6be2391bc207b4bb9ee20c7bebd6d \
+    gomod://github.com/go-openapi/swag/cmdutils;version=v0.25.5;sha256sum=c9b01c6c9aad8e72c59a570c8acc140e8f0522ce57322b3bf81dfdf0f73e54e8 \
+    gomod://github.com/go-openapi/swag/conv;version=v0.25.5;sha256sum=c02fe7118d58720cbd83bc7c0c37edd5bdaff731f26f8ca8bc8998ee1e0f39b2 \
+    gomod://github.com/go-openapi/swag/fileutils;version=v0.25.5;sha256sum=f368511a4eda5e14680aaa358b0b6fd2ca23cfc61aa8bfec234acb51ec9c4561 \
+    gomod://github.com/go-openapi/swag/jsonname;version=v0.25.5;sha256sum=fff4d3d3875709813d6fcd5657133de4331eb136a0aedd51a099f7f76605ae08 \
+    gomod://github.com/go-openapi/swag/jsonutils;version=v0.25.5;sha256sum=9d6fad8614363682c676c5380433d6f376ddcbfe09af5d5b1e92db57eb3f89a6 \
+    gomod://github.com/go-openapi/swag/loading;version=v0.25.5;sha256sum=08db0dfa32b02d4575d202a43c2cbf547b55e1cc1700b83b50e2bd6963fe473b \
+    gomod://github.com/go-openapi/swag/mangling;version=v0.25.5;sha256sum=e18e5bf564ca56e0534593b39c694030a1700ccb75d4d9597633310d01c3032f \
+    gomod://github.com/go-openapi/swag/netutils;version=v0.25.5;sha256sum=7272f9e0ccb481ce99f5189ec73c91fcb5b716d3cea7265faa433f78220c09bb \
+    gomod://github.com/go-openapi/swag/stringutils;version=v0.25.5;sha256sum=84c67b1424ec75a3c98c4f8403215212dc8234a2ca49bfc4cd2948c4c0f474fc \
+    gomod://github.com/go-openapi/swag/typeutils;version=v0.25.5;sha256sum=e9561c699417276b878b22967f457f29acc80b9ce5f977dc520637dd419f0c4a \
+    gomod://github.com/go-openapi/swag/yamlutils;version=v0.25.5;sha256sum=af4b90aa0549f31d619676f1642fc70b5aeb62a7ae8895a5b0d8225e2d02d09a \
+    gomod://github.com/go-openapi/validate;version=v0.25.2;sha256sum=ce569ad32c22f253dde70de305edbfe595f7c9c19816636451623b94ac5d9f63 \
+    gomod://github.com/go-viper/mapstructure/v2;version=v2.5.0;sha256sum=326f8e00f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547 \
+    gomod://github.com/gobwas/glob;version=v0.2.3;sha256sum=0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf \
+    gomod://github.com/golang/snappy;version=v0.0.4;sha256sum=ea4545ca44ee990554094df6de440386a440a5bd99106e048939409d63beb423 \
+    gomod://github.com/golang-jwt/jwt/v4;version=v4.5.2;sha256sum=ec5ee69a31fd478fc197fddce7c06dad1abe7543095a55c4ee6546ae79d99a0f \
+    gomod://github.com/golang-jwt/jwt/v5;version=v5.3.0;sha256sum=7de1cf03d836b3fcb32e02011d148fe94533e52dd54d521cadc61bcdf068eb1c \
+    gomod://github.com/google/certificate-transparency-go;version=v1.3.3;sha256sum=2728bdcc12bd62dfa29cbc5211dd4e25ca471a806dd0ab2400177a9a45733641 \
+    gomod://github.com/google/gnostic-models;version=v0.7.0;sha256sum=797a05cd73a30624ece79633c4db4631676adc1f30f07a0a7051ab39beca96c8 \
+    gomod://github.com/google/go-cmp;version=v0.7.0;sha256sum=64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539 \
+    gomod://github.com/google/go-containerregistry;version=v0.21.3;sha256sum=860ac1d37ac6ace9401e28e7292cebfd9425ea171f1f02c298369665c46b6de9 \
+    gomod://github.com/google/go-github/v73;version=v73.0.0;sha256sum=82da258d807e9be4bc3993e3909577de3ec3b676e83ee6f28a9a1aef7a46137d \
+    gomod://github.com/google/go-querystring;version=v1.2.0;sha256sum=57b7ce2b82b33c68f59a224c6dd1305753e5ee3eecbefd09d43423a14f541e31 \
+    gomod://github.com/google/s2a-go;version=v0.1.9;sha256sum=bf8f4b159d3fc201477822ed2514e4f05f58c764b78ffed73ec0accce5fb7f07 \
+    gomod://github.com/google/uuid;version=v1.6.0;sha256sum=d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed \
+    gomod://github.com/googleapis/enterprise-certificate-proxy;version=v0.3.12;sha256sum=5e0f2acd75886d11b2cea9903e908af8fddd64cf9a53a9bf40a48e8ff30f4a96 \
+    gomod://github.com/googleapis/gax-go/v2;version=v2.17.0;sha256sum=7621672828461256b38091fefcf55056940c910188d51240874fd7e6f8432e93 \
+    gomod://github.com/grpc-ecosystem/grpc-gateway/v2;version=v2.27.7;sha256sum=cf582c8973dab45fed618da990044ac04893d038694fe4e6bddd3dc44641fef4 \
+    gomod://github.com/hashicorp/errwrap;version=v1.1.0;sha256sum=209ae99bc039443e28e4d6bb66517d1756d9468b7578d31f1b63a28103d8e18c \
+    gomod://github.com/hashicorp/go-cleanhttp;version=v0.5.2;sha256sum=e9f3dcfcb33172ba499b4f8e888169252d7f1e072082182124a6e2053523f7df \
+    gomod://github.com/hashicorp/go-multierror;version=v1.1.1;sha256sum=972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c \
+    gomod://github.com/hashicorp/go-retryablehttp;version=v0.7.8;sha256sum=9e2c175e4af37cdfeba28ed89250ad1fd691eda0fab167fafa9928222646b71e \
+    gomod://github.com/hashicorp/go-rootcerts;version=v1.0.2;sha256sum=864a48e642e87a273fb5ef60bb3575bd74a7090510f93143163fa6700be31948 \
+    gomod://github.com/hashicorp/go-secure-stdlib/parseutil;version=v0.2.0;sha256sum=715aecec5d925467704774d3ab4bd3c4eead5ddb525a4bceb06c6f1e697ddba8 \
+    gomod://github.com/hashicorp/go-secure-stdlib/strutil;version=v0.1.2;sha256sum=8070c67bc97e15488b99b172ddb6631412dca0fcb8cea90e37fe55d95e1af00a \
+    gomod://github.com/hashicorp/go-sockaddr;version=v1.0.7;sha256sum=53ea8d77b68056fe7f40a53338aa73ed6ddca9558fe1156804070a060f1a930f \
+    gomod://github.com/hashicorp/hcl;version=v1.0.1-vault-7;sha256sum=84fea514e70253c65e3caf90a8d9f366808bdfb4099914d1e6ab0d1fdba976b7 \
+    gomod://github.com/hashicorp/vault/api;version=v1.22.0;sha256sum=ca415b5364f49dadb17be1bc60f156c9f5cd6579a2e0711b069b3418c3a2265e \
+    gomod://github.com/in-toto/attestation;version=v1.1.2;sha256sum=0bb737ac0836f6a9ba6499139630a558bdda510c78dc51967e58355006a03d9a \
+    gomod://github.com/in-toto/in-toto-golang;version=v0.10.0;sha256sum=714134f015027dc9d65e55de7625d06ed3f91cc3888a84480a6110e14e952709 \
+    gomod://github.com/jedisct1/go-minisign;version=v0.0.0-20230811132847-661be99b8267;sha256sum=5c8c88dd60cd9c2214a38f5ce42d39c05aafb58a92909c2bc1f49e430d59b1d5 \
+    gomod://github.com/jellydator/ttlcache/v3;version=v3.4.0;sha256sum=b3f31d5c4ea68698f1de6f85dbaacb176b2fadeaa6d426a38f48f4f752f974fb \
+    gomod://github.com/json-iterator/go;version=v1.1.12;sha256sum=d001ea57081afd0e378467c8f4a9b6a51259996bb8bb763f78107eaf12f99501 \
+    gomod://github.com/klauspost/compress;version=v1.18.4;sha256sum=a295e4443ad6c88d8f5b8690807f413800fa171571d3a5970e2abefe6fe6e990 \
+    gomod://github.com/kylelemons/godebug;version=v1.1.0;sha256sum=dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13 \
+    gomod://github.com/lestrrat-go/blackmagic;version=v1.0.4;sha256sum=4775ca8eab443a882cc1772c25716810a889d478746c6a405f559750de42dce6 \
+    gomod://github.com/lestrrat-go/dsig;version=v1.0.0;sha256sum=d4f31e5380752d00740a447b7c129dfb2644367e4642e35ad60ff252edb470a0 \
+    gomod://github.com/lestrrat-go/httpcc;version=v1.0.1;sha256sum=d75132f805ea5cf6275d9af02a5ff3c116ad92ac7fc28e2a22b8fd2e029a3f4c \
+    gomod://github.com/lestrrat-go/httprc/v3;version=v3.0.2;sha256sum=188f9e9b9fdebde5fd6196a6cdc1b5a3a0f9b4c9a82cb146cfbb5b600a6a5094 \
+    gomod://github.com/lestrrat-go/jwx/v3;version=v3.0.13;sha256sum=f1ee98b4f90c79eecfce10e995ecd0a538224e853293814c41ffa13947ad407a \
+    gomod://github.com/lestrrat-go/option/v2;version=v2.0.0;sha256sum=3456bd01638c67da62570123f3d12f5996d0a01ed521959c2fc85aa83d3ee94a \
+    gomod://github.com/letsencrypt/boulder;version=v0.20260223.0;sha256sum=f9a88ba61b0c561c2570b9df5e6d788262fbf197d3d90cede64a321fae9a899d \
+    gomod://github.com/mitchellh/go-homedir;version=v1.1.0;sha256sum=fffec361fc7e776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade184 \
+    gomod://github.com/mitchellh/go-wordwrap;version=v1.0.1;sha256sum=5f96426c4b3b3e90a9b7471568cb1d61d6a306744f5d4765a30fa8a61e1c0b47 \
+    gomod://github.com/mitchellh/mapstructure;version=v1.5.1-0.20231216201459-8508981c8b6c;sha256sum=1cc37cf0bb7849d0fb29daabe5597450c565e334564ed28eabf3f0602259733b \
+    gomod://github.com/moby/term;version=v0.5.2;sha256sum=f8d6e5c53992c640512ee45a9b6147a765bebe3d8d50e3bfe1e4ec3e052cd688 \
+    gomod://github.com/modern-go/concurrent;version=v0.0.0-20180306012644-bacd9c7ef1dd;sha256sum=91ef49599bec459869d94ff3dec128871ab66bd2dfa61041f1e1169f9b4a8073 \
+    gomod://github.com/modern-go/reflect2;version=v1.0.3-0.20250322232337-35a7c28c31ee;sha256sum=49f3fb0f76b1b98b52b5e6e8eab2a48454eab33904b937625941c28138a7fea4 \
+    gomod://github.com/mozillazg/docker-credential-acr-helper;version=v0.4.0;sha256sum=e696b388bfc8b0a557722ccdcd3c002657daaaaf6aea07349145dc6e42dd463a \
+    gomod://github.com/munnerz/goautoneg;version=v0.0.0-20191010083416-a7dc8b61c822;sha256sum=3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636afd9 \
+    gomod://github.com/natefinch/atomic;version=v1.0.1;sha256sum=25df4a9727bd8750557a848d9066503c2e0b1788821be4db87377fd202254ed4 \
+    gomod://github.com/nozzle/throttler;version=v0.0.0-20180817012639-2ea982251481;sha256sum=660c8605727fc99ef3c71706592138b59cc6cd4d63be978b2371887626499b75 \
+    gomod://github.com/oklog/ulid/v2;version=v2.1.1;sha256sum=312b5fea3f68df920adaffc327440efbaba43ad6a8df2f7e0c9e365743f6ff89 \
+    gomod://github.com/oleiade/reflections;version=v1.1.0;sha256sum=f8e70604f64ac56c843f2b5f7d97546d23a94db198f031c0d23962c4d2b8bce5 \
+    gomod://github.com/open-policy-agent/opa;version=v1.14.1;sha256sum=6755ebebbd9106de9fc4159d3655986c4030e3397168f8cff23f7b3eee6975e1 \
+    gomod://github.com/opencontainers/go-digest;version=v1.0.0;sha256sum=615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86 \
+    gomod://github.com/opencontainers/image-spec;version=v1.1.1;sha256sum=3a32eeb459719172947c20be78b5b7293c6ea84f4039184e846f6b676bc19574 \
+    gomod://github.com/pborman/uuid;version=v1.2.1;sha256sum=3699aef3b9e0a97863a4a90bf26254d1a6ba03a2b1d4f4d2a5061c4d29d9dd7f \
+    gomod://github.com/pelletier/go-toml/v2;version=v2.2.4;sha256sum=82162be7b85077f3be49bfe0f1e01f308b9c9554c72a980a22a34432f94885f0 \
+    gomod://github.com/pkg/browser;version=v0.0.0-20240102092130-5ac0b6a4141c;sha256sum=8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1 \
+    gomod://github.com/pkg/errors;version=v0.9.1;sha256sum=d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07 \
+    gomod://github.com/protocolbuffers/txtpbfmt;version=v0.0.0-20260217160748-a481f6a22f94;sha256sum=e184542ac96a60f21efe61a5f71f1a14636e46449ea3a445108adb247ddbb019 \
+    gomod://github.com/rcrowley/go-metrics;version=v0.0.0-20250401214520-65e299d6c5c9;sha256sum=a8c9e9792ad16f31ef8c32232de6243cc02147175661c9f64bc7b292f1c4d0cc \
+    gomod://github.com/rogpeppe/go-internal;version=v1.14.1;sha256sum=ab3d18283cef2f46ddfd489b6b14b970eb7dbbb642786f025ee1ac5291dc4e70 \
+    gomod://github.com/ryanuber/go-glob;version=v1.0.0;sha256sum=2084f36ead38a505489fdb46329502fb627f568224dcc22ef11ec173b61fc2cf \
+    gomod://github.com/sagikazarmark/locafero;version=v0.11.0;sha256sum=6c2a9bdf9567f63caebf47694d94acd4350b1d4d69f13c3188f4e7e82939f6a5 \
+    gomod://github.com/sassoftware/relic;version=v7.2.1+incompatible;sha256sum=c28fccce743db96510662f1d45f8a4b2212f5f60fb4a4f31a99261118ed068f3 \
+    gomod://github.com/secure-systems-lab/go-securesystemslib;version=v0.10.0;sha256sum=399f400aa66b243ebd24215a78041cdb7dd0a47ac74e0068898dcf33428d8bc3 \
+    gomod://github.com/shibumi/go-pathspec;version=v1.3.0;sha256sum=1ac9091ebe9ff4154ddc39b2b3436c5b6b268d5cdc1e8462c9790485cd76a58f \
+    gomod://github.com/sigstore/fulcio;version=v1.8.5;sha256sum=d755a957ed769650216da2e3c2905c45434673b00c4510a563d6620b30a305df \
+    gomod://github.com/sigstore/protobuf-specs;version=v0.5.0;sha256sum=0eb8b14e1e4392ee93e6ab48fabea3f59d42cdf87e62111384c5d2cc02e1639f \
+    gomod://github.com/sigstore/rekor;version=v1.5.1;sha256sum=f3b55a07b7d6f2ce17c26d1840a6e0b28875bb5ca28b9fcd3ecd4f3f53be9051 \
+    gomod://github.com/sigstore/rekor-tiles/v2;version=v2.2.1;sha256sum=d14bbde50827e92ee018c5aa28da7ace0225f6e0f557de01d81241d49ebf9905 \
+    gomod://github.com/sigstore/sigstore;version=v1.10.5;sha256sum=335a90c44640d20cf6dcf078cc3e540300cbcf4dff634bea2703b2b74d25c1c4 \
+    gomod://github.com/sigstore/sigstore/pkg/signature/kms/aws;version=v1.10.5;sha256sum=62fb728a5bf10ba130912f43bff29f1ce2ddbe66833092aec4edb39dbf08ee99 \
+    gomod://github.com/sigstore/sigstore/pkg/signature/kms/azure;version=v1.10.5;sha256sum=7eb73ecc729016cecb9b76f32c0ff39c9a7b3f72c3060fa04e119d303c84c038 \
+    gomod://github.com/sigstore/sigstore/pkg/signature/kms/gcp;version=v1.10.5;sha256sum=da6b2511b40125d34d7bf46a94698ef9601a120bd569fca6a6ad4c2b328e0456 \
+    gomod://github.com/sigstore/sigstore/pkg/signature/kms/hashivault;version=v1.10.5;sha256sum=13172983962f0d3fd0d56bee830456cd2c2584b0742d1b8efef14b4641e51956 \
+    gomod://github.com/sigstore/sigstore-go;version=v1.1.4;sha256sum=809fa597f98fcec826efcfdb1ac1376e25903adcccdae356b43b13af10895698 \
+    gomod://github.com/sigstore/timestamp-authority/v2;version=v2.0.5;sha256sum=61cb8c7c183c7ae5d5bdf145021f5b090f0f43f92e8f69626d0bac1bb6a7155c \
+    gomod://github.com/sirupsen/logrus;version=v1.9.4;sha256sum=3847d00c5ee6948f1ff0d0120bc343c55ce852becb7720f8f08f53eecfe9e437 \
+    gomod://github.com/sourcegraph/conc;version=v0.3.1-0.20240121214520-5f936abd7ae8;sha256sum=6db56fe285f78ba994a77d676d790b1db85a47cc8948a42d4c2f6ca6200b9413 \
+    gomod://github.com/spf13/afero;version=v1.15.0;sha256sum=d03a0bbce87eeaa1c23f0c0276707bb2d59f46efee875d7d7f1d570201be6e1f \
+    gomod://github.com/spf13/cast;version=v1.10.0;sha256sum=7c7ba27f9979ada980c2a69f6b2fdf7b4ce1f2b766e245c0a4716f546ad7ddce \
+    gomod://github.com/spf13/cobra;version=v1.10.2;sha256sum=a00aae6fcd631e0fde52c98604452ff70e1b73c3b8a560d68db15aff5e26872d \
+    gomod://github.com/spf13/pflag;version=v1.0.10;sha256sum=a246b8c9d3daa87d6c634cdfee1bdf7fa53d5817eeef4fa0c6da43edd12de4ca \
+    gomod://github.com/spf13/viper;version=v1.21.0;sha256sum=4096e4ccdbb74027c49f0dfede6d67193053b0d1c1ecce57543cf3dacc7b249e \
+    gomod://github.com/spiffe/go-spiffe/v2;version=v2.6.0;sha256sum=b90f378c70e2c985f61893ca20bf3e8258bb4f66920af759276d330513d0d7d6 \
+    gomod://github.com/subosito/gotenv;version=v1.6.0;sha256sum=142db3dd2328e744c157e85cf3291d027013b79f92a45984f860fe38bc0f1f8d \
+    gomod://github.com/syndtr/goleveldb;version=v1.0.1-0.20220721030215-126854af5e6d;sha256sum=68a0e0b2969ac85b591fa083b202852bf0eb8a60b303581a4bd68bc0b69d77d8 \
+    gomod://github.com/tchap/go-patricia/v2;version=v2.3.3;sha256sum=37591393b0ea113849eacbc292886ea6978798a596164510c5834c2edc374067 \
+    gomod://github.com/theupdateframework/go-tuf;version=v0.7.0;sha256sum=5c2c631a720e3c4225cfff085bd080acabd4308d0e4e6244e4cc180e019b8eaa \
+    gomod://github.com/theupdateframework/go-tuf/v2;version=v2.4.1;sha256sum=1cb913a4229e1b64c95b08a7866821256833f70ee3e316f7cdf82cc4ddc9267a \
+    gomod://github.com/titanous/rocacheck;version=v0.0.0-20171023193734-afe73141d399;sha256sum=00e4f6d7d6a6a424539afb3968c2c9cfd9b42eca089015d67e90358b91e7f8da \
+    gomod://github.com/tjfoc/gmsm;version=v1.4.1;sha256sum=ba1f3ccf698a62bcb28c594d995f21587021ad759e777aa64367c8a7332cc10b \
+    gomod://github.com/transparency-dev/formats;version=v0.0.0-20251017110053-404c0d5b696c;sha256sum=ff992fe96b260806864ad3557958852990d2b3d0d7e796887db7a9e596613dcc \
+    gomod://github.com/transparency-dev/merkle;version=v0.0.2;sha256sum=bff8072eb052d166df4f8f3d144451ca83b98f1c0382995167008c44abc383fd \
+    gomod://github.com/valyala/fastjson;version=v1.6.7;sha256sum=4cbfe712a23a581db9b0eb5e1929fb8da82586e90f3d594dc60b508207047b63 \
+    gomod://github.com/vbatts/tar-split;version=v0.12.2;sha256sum=1f3bcd7cebbe3b67a4e7d5d4226f7127ea11bf652ed3b41cc1a0a24cf15e0dd7 \
+    gomod://github.com/vektah/gqlparser/v2;version=v2.5.32;sha256sum=9615eb15e094a259de740e284370a8cc4524c137491a4a728ab9c350aa5a94d3 \
+    gomod://github.com/withfig/autocomplete-tools/integrations/cobra;version=v1.2.1;sha256sum=b2a47ab2313e49e37073c93dec8d010dc9a44a846a08d87133e574cb9fad10f6 \
+    gomod://github.com/x448/float16;version=v0.8.4;sha256sum=73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500 \
+    gomod://github.com/xeipuuv/gojsonpointer;version=v0.0.0-20190905194746-02993c407bfb;sha256sum=11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c345c53eab6aaf228de \
+    gomod://github.com/xeipuuv/gojsonreference;version=v0.0.0-20180127040603-bd5ef7bd5415;sha256sum=7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7 \
+    gomod://github.com/yashtewari/glob-intersection;version=v0.2.0;sha256sum=bc999bc9a3bcce0ed7c06180320d2236a5c32aa61def5a7c79963faa6bcf2fd0 \
+    gomod://gitlab.com/gitlab-org/api/client-go;version=v1.46.0;sha256sum=42ad7a41d100fbcc5851b4df478f45856a7a6da5bc4706ec0e511e287d676049 \
+    gomod://go.opentelemetry.io/auto/sdk;version=v1.2.1;sha256sum=a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335 \
+    gomod://go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc;version=v0.63.0;sha256sum=a093449439c5be2ecaa0c25a4690281445954876a8d4f3396e6d27561d5479dc \
+    gomod://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp;version=v0.65.0;sha256sum=f68a6e3f8f93b5857390583f3e855801ce93244ea18bf56ab45c221a4ea32a4c \
+    gomod://go.opentelemetry.io/otel;version=v1.41.0;sha256sum=1a624187c6ed53704d278e4cf12c143e1046ba1e894b8ea470cb309d31adf742 \
+    gomod://go.opentelemetry.io/otel/metric;version=v1.41.0;sha256sum=ee6cd9515bff605dc265e36f60d7ca293ce920688906ef8baef5d016474f2c2f \
+    gomod://go.opentelemetry.io/otel/trace;version=v1.41.0;sha256sum=6376f38119647b709e49bd13585722a685578fb4e4cdaa46ed421a3832a2fa9e \
+    gomod://go.uber.org/multierr;version=v1.11.0;sha256sum=2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da77641bddce0c3 \
+    gomod://go.uber.org/zap;version=v1.27.1;sha256sum=38760227142d38369069374c005707bc6b3c270a75f34fa3f17c48c863143cdc \
+    gomod://go.yaml.in/yaml/v2;version=v2.4.3;sha256sum=bacc1ac9ed600be2df58f88b88d5c1b6f6473526fa4069f61549f64b81b09f41 \
+    gomod://go.yaml.in/yaml/v3;version=v3.0.4;sha256sum=0317dae56eaa9e9954467c8768fd6a89ba2005f1534e2c26fce5163ad8d2ef31 \
+    gomod://golang.org/x/crypto;version=v0.49.0;sha256sum=cbca45d1fcb0fa359cd232b884ba86cfa1a32644ff7efdeb79807db3eb0f005d \
+    gomod://golang.org/x/mod;version=v0.34.0;sha256sum=8e6b8d8a771dac070d44c8c701b1fba4c3565031f4f7170e6fed9d3022b4aa32 \
+    gomod://golang.org/x/net;version=v0.52.0;sha256sum=5b8bf13a81552cd4ffc06dae2b78fb1e72ece57e54446e396ff9c19251e917ed \
+    gomod://golang.org/x/oauth2;version=v0.36.0;sha256sum=15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504 \
+    gomod://golang.org/x/sync;version=v0.20.0;sha256sum=7179d4d68800f6fdcadb9d4bbf11cbb5df9b40360c89305c203fe20723cbd375 \
+    gomod://golang.org/x/sys;version=v0.42.0;sha256sum=99df0ad90183debc80aee0b7489648574c6baa0c1cf5da37aaf591cf2e2d426a \
+    gomod://golang.org/x/term;version=v0.41.0;sha256sum=91ca75a3f454d5ddede1f58c3e4fc8e169c6f3c037223ac0ac76e78234d22828 \
+    gomod://golang.org/x/text;version=v0.35.0;sha256sum=2df36ee135211552d1e729d2a2a4b5bbff2bd3a0cc53064151a6e6495e947b32 \
+    gomod://golang.org/x/time;version=v0.15.0;sha256sum=8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad9da27f84 \
+    gomod://google.golang.org/api;version=v0.269.0;sha256sum=226e867540ec7a664a1797f3db25674e3637796cd4b30784bbdcbe49a810367d \
+    gomod://google.golang.org/genproto;version=v0.0.0-20260128011058-8636f8732409;sha256sum=88202f77c2801a95607cfa545c68454acdd06a0ec4e5e3269a75baa67d1b82ad \
+    gomod://google.golang.org/genproto/googleapis/api;version=v0.0.0-20260203192932-546029d2fa20;sha256sum=6d03a2d9b364a1fc786170236268b402a8500e5c4442b3762989cf0d5729cfaa \
+    gomod://google.golang.org/genproto/googleapis/rpc;version=v0.0.0-20260217215200-42d3e9bedb6d;sha256sum=d86506b997ea20d69bc8287de38c76b6dea4664d2c543d2ecf545cd7e932fcd8 \
+    gomod://google.golang.org/grpc;version=v1.80.0;sha256sum=12b91cdce1bbcd837193ef71c42a09b454bff644e0ddab389a396328c2e41779 \
+    gomod://google.golang.org/protobuf;version=v1.36.11;sha256sum=14983d36c56a814ed91b6d652f2b8f895baba1b84eb43b28a0b132c8637cd274 \
+    gomod://gopkg.in/evanphx/json-patch.v4;version=v4.13.0;sha256sum=de94747c5023a2c83909845c76acc6b4bfe28b44994207394b5e057f3085625a \
+    gomod://gopkg.in/inf.v0;version=v0.9.1;sha256sum=08abac18c95cc43b725d4925f63309398d618beab68b4669659b61255e5374a0 \
+    gomod://gopkg.in/ini.v1;version=v1.67.1;sha256sum=9af5f66337e725f2ec19d23eff4f72e1b14c67b4b0c80b0677a3a2c0944cf09c \
+    gomod://gopkg.in/yaml.v3;version=v3.0.1;sha256sum=aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015 \
+    gomod://k8s.io/api;version=v0.35.3;sha256sum=acc83efef5e4469b0c89e01f62602aed4c285cae5cb4bc2ee0a3fe51baf9e16b \
+    gomod://k8s.io/apimachinery;version=v0.35.3;sha256sum=fba136ace873c2c91b81b7be38e11fa74c74dde9526d3f1e22c13c09e648da6d \
+    gomod://k8s.io/client-go;version=v0.35.3;sha256sum=eda662eefedead2394dc545b00d2be3e5c5d645cdd9a7c9331b4eeab94fe823b \
+    gomod://k8s.io/klog/v2;version=v2.130.1;sha256sum=262b961175bbe8cf6ecf227d06303df2eb47bfb890e19d516846422f7d406cb9 \
+    gomod://k8s.io/kube-openapi;version=v0.0.0-20250910181357-589584f1c912;sha256sum=c8f5db9fcfdcee9ae6057c0c0a2ea1232f0cf27a07d857517c7ad1e38d9950bc \
+    gomod://k8s.io/utils;version=v0.0.0-20251002143259-bc988d571ff4;sha256sum=3caff8384915ba747aad7708cf2a4aaa2501f952780e64049abe981a57d1cb49 \
+    gomod://sigs.k8s.io/json;version=v0.0.0-20250730193827-2d320260d730;sha256sum=7cec6eae3e4e4c9c1e0a009eef200740990fafbcb9cab081eb18ce32f6e7a7b9 \
+    gomod://sigs.k8s.io/randfill;version=v1.0.0;sha256sum=31dbbfc44ce12f78f1b68d6bbeed8526aa73c53243353d44d50b2532c828f5f1 \
+    gomod://sigs.k8s.io/release-utils;version=v0.12.4;sha256sum=1bf5824c8978e3b1d3ae83a01facae97c994c2eea6982e15050d9291a19558b1 \
+    gomod://sigs.k8s.io/structured-merge-diff/v6;version=v6.3.0;sha256sum=bcb0e662e31cfbd06b4cb52eb59eef6f0da101bce5aedca7dbce1f78c34d637a \
+    gomod://sigs.k8s.io/yaml;version=v1.6.0;sha256sum=cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052 \
+"
diff --git a/recipes-containers/cosign/cosign-licenses.inc b/recipes-containers/cosign/cosign-licenses.inc
new file mode 100644
index 00000000..4e39c6c9
--- /dev/null
+++ b/recipes-containers/cosign/cosign-licenses.inc
@@ -0,0 +1,274 @@
+
+# This file has been generated by go-mod-update-modules.bbclass
+#
+# Do not modify it by hand, as the contents will be replaced when
+# running the update-modules task.
+
+LICENSE += "& Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT & MPL-2.0"
+
+LIC_FILES_CHKSUM += "\
+    file://pkg/mod/cloud.google.com/go/auth/oauth2adapt@v0.2.8/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/auth@v0.18.2/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.9.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/iam@v1.5.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/kms@v1.26.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/longrunning@v0.8.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cuelabs.dev/go/oci/ociregistry@v0.0.0-20251212221603-3adeb8663819/LICENSE;md5=175792518e4ac015ab6696d16c4f607e;spdx=Apache-2.0 \
+    file://pkg/mod/cuelang.org/go@v0.16.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!aliyun!container!service/ack-ram-tool/pkg/credentials/provider@v0.14.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure!a!d/microsoft-authentication-library-for-go@v1.6.0/LICENSE;md5=e74f78882cab57fd1cc4c5482b9a214a;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/azcore@v1.21.0/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/azidentity@v1.13.1/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/internal@v1.11.2/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/security/keyvault/azkeys@v1.4.0/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/security/keyvault/internal@v1.2.0/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go@v68.0.0+incompatible/LICENSE.txt;md5=4f7454c9bcbb0acee6d9a971001befe2;spdx=MIT \
+    file://pkg/mod/github.com/!azure/go-autorest/autorest/adal@v0.9.23/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure/go-autorest/autorest/azure/auth@v0.5.12/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure/go-autorest/autorest/azure/cli@v0.4.6/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure/go-autorest/autorest/date@v0.3.0/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure/go-autorest/autorest@v0.11.29/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure/go-autorest/logger@v0.2.1/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure/go-autorest/tracing@v0.6.0/LICENSE;md5=a250e5ac3848f2acadb5adcb9555c18b;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/agnivade/levenshtein@v1.2.1/License.txt;md5=911630ea868cb9d6ca549532110fd8fd;spdx=MIT \
+    file://pkg/mod/github.com/alibabacloud-go/alibabacloud-gateway-spi@v0.0.4/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/cr-20181201@v1.0.10/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/darabonba-openapi@v0.2.1/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/debug@v1.0.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/endpoint-util@v1.1.1/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/openapi-util@v0.1.0/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/tea-utils@v1.4.5/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/tea-xml@v1.1.3/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/alibabacloud-go/tea@v1.2.1/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aliyun/credentials-go@v1.3.2/LICENSE;md5=815228b833e1826a08c7cef5b6f00363;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/asaskevich/govalidator@v0.0.0-20230301143203-a9d515a09cc2/LICENSE;md5=44f42f71b1145516f11eb20da85d7344;spdx=MIT \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.32.10/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.19.10/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.18.18/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.18/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.18/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/ini@v1.8.4/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ecr@v1.55.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ecrpublic@v1.38.10/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.5/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.18/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/kms@v1.50.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/signin@v1.0.6/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.30.11/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.35.15/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.41.7/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.41.2/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.41.2/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/aws/smithy-go@v1.24.1/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/smithy-go@v1.24.1/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/awslabs/amazon-ecr-credential-helper/ecr-login@v0.12.0/LICENSE;md5=e60493c23a6358c3e44f125a289c0692;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/blang/semver@v3.5.1+incompatible/LICENSE;md5=5a3ade42a900439691ebc22013660cae;spdx=MIT \
+    file://pkg/mod/github.com/buildkite/agent/v3@v3.118.0/LICENSE.txt;md5=56f76a415afa1476c8632f1944a0e0bd;spdx=MIT \
+    file://pkg/mod/github.com/buildkite/go-pipeline@v0.16.0/LICENSE;md5=e5997726ed2708dfa419572da9dbadaa;spdx=MIT \
+    file://pkg/mod/github.com/buildkite/interpolate@v0.1.5/LICENSE.txt;md5=5d73adf54d93c6c9f4a0a6f136cfec4f;spdx=MIT \
+    file://pkg/mod/github.com/buildkite/roko@v1.4.0/LICENSE.md;md5=6926b41f021e7ddd23997afe97615111;spdx=MIT \
+    file://pkg/mod/github.com/cenkalti/backoff/v4@v4.3.0/LICENSE;md5=1571d94433e3f3aa05267efd4dbea68b;spdx=MIT \
+    file://pkg/mod/github.com/cenkalti/backoff/v5@v5.0.3/LICENSE;md5=1571d94433e3f3aa05267efd4dbea68b;spdx=MIT \
+    file://pkg/mod/github.com/cespare/xxhash/v2@v2.3.0/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
+    file://pkg/mod/github.com/chrismellard/docker-credential-acr-env@v0.0.0-20230304212654-82a0ddb27589/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/clbanning/mxj/v2@v2.7.0/LICENSE;md5=b95d77640f09a1f26a37017288284f35;spdx=MIT \
+    file://pkg/mod/github.com/cockroachdb/apd/v3@v3.2.1/LICENSE;md5=91fa97a925e58262605528603a297ccd;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/common-nighthawk/go-figure@v0.0.0-20210622060536-734e95fb86be/LICENSE;md5=f37e5ec1bc71f8242927b328878a744d;spdx=MIT \
+    file://pkg/mod/github.com/containerd/stargz-snapshotter/estargz@v0.18.2/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/coreos/go-oidc/v3@v3.17.0/LICENSE;md5=d2794c0df5b907fdace235a619d80314;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/cyberphone/json-canonicalization@v0.0.0-20241213102144-19d51d7fe467/LICENSE;md5=84f589d883da07bef20c745c96b1019c;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/davecgh/go-spew@v1.1.2-0.20180830191138-d8f796af33cc/LICENSE;md5=c06795ed54b2a35ebeeb543cd3a73e56;spdx=ISC \
+    file://pkg/mod/github.com/digitorus/pkcs7@v0.0.0-20230818184609-3a137a874352/LICENSE;md5=a9b2952d51b44eae97b6090117f60792;spdx=MIT \
+    file://pkg/mod/github.com/digitorus/timestamp@v0.0.0-20231217203849-220c5c2851b7/LICENSE;md5=ee17b041b11533700fde49eee80a1553;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/dimchansky/utfbom@v1.1.1/LICENSE;md5=d5b81a403268b5ea485b4a2579630c17;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/docker/cli@v29.3.0+incompatible/LICENSE;md5=9740d093a080530b5c5c6573df9af45a;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/docker/distribution@v2.8.3+incompatible/LICENSE;md5=d2794c0df5b907fdace235a619d80314;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/docker/docker-credential-helpers@v0.9.5/LICENSE;md5=5f28a5a15a6bde800864f444aee95768;spdx=MIT \
+    file://pkg/mod/github.com/dustin/go-humanize@v1.0.1/LICENSE;md5=8c6127b79304a5e0a5756d03c7a58766;spdx=MIT \
+    file://pkg/mod/github.com/emicklei/go-restful/v3@v3.13.0/LICENSE;md5=2ebc1c12a0f4eae5394522e31961e1de;spdx=MIT \
+    file://pkg/mod/github.com/emicklei/proto@v1.14.3/LICENSE;md5=b1ce415d97e837c8677d332b274d4f0b;spdx=MIT \
+    file://pkg/mod/github.com/felixge/httpsnoop@v1.0.4/LICENSE.txt;md5=684da2bf3eed8fc8860e75ad84638225;spdx=MIT \
+    file://pkg/mod/github.com/fsnotify/fsnotify@v1.9.0/LICENSE;md5=8bae8b116e2cfd723492b02d9a212fe2;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/fxamacker/cbor/v2@v2.9.0/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86;spdx=MIT \
+    file://pkg/mod/github.com/go-chi/chi/v5@v5.2.5/LICENSE;md5=eef59fdf1c5117072cbf52b79c6ea691;spdx=MIT \
+    file://pkg/mod/github.com/go-jose/go-jose/v4@v4.1.4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-jose/go-jose/v4@v4.1.4/json/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/go-logr/logr@v1.4.3/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-logr/stdr@v1.2.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/analysis@v0.24.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/errors@v0.22.7/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/jsonpointer@v0.22.5/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/jsonreference@v0.21.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/loads@v0.23.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/runtime@v0.29.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/runtime@v0.29.3/middleware/denco/LICENSE;md5=9191b4cb03404322c952b5e2a69c0914;spdx=MIT \
+    file://pkg/mod/github.com/go-openapi/spec@v0.22.4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/strfmt@v0.26.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/cmdutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/conv@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/fileutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/jsonname@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/jsonutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/loading@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/mangling@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/netutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/stringutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/typeutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag/yamlutils@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/swag@v0.25.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/validate@v0.25.2/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-viper/mapstructure/v2@v2.5.0/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=MIT \
+    file://pkg/mod/github.com/gobwas/glob@v0.2.3/LICENSE;md5=0945febef83436030e30c73ea9980b42;spdx=MIT \
+    file://pkg/mod/github.com/golang/snappy@v0.0.4/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/golang-jwt/jwt/v4@v4.5.2/LICENSE;md5=a21b708d8b320c68979c44ac9dba9b0d;spdx=MIT \
+    file://pkg/mod/github.com/golang-jwt/jwt/v5@v5.3.0/LICENSE;md5=a21b708d8b320c68979c44ac9dba9b0d;spdx=MIT \
+    file://pkg/mod/github.com/google/certificate-transparency-go@v1.3.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/gnostic-models@v0.7.0/LICENSE;md5=b1e01b26bacfc2232046c90a330332b3;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/go-cmp@v0.7.0/LICENSE;md5=4ac66f7dea41d8d116cb7fb28aeff2ab;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/google/go-containerregistry@v0.21.3/LICENSE;md5=175792518e4ac015ab6696d16c4f607e;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/go-github/v73@v73.0.0/LICENSE;md5=44714fe40638e49453cfb438ddd301f1;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/google/go-querystring@v1.2.0/LICENSE;md5=29f156828ca5f2df0d1c12543a75f12a;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/google/s2a-go@v0.1.9/LICENSE.md;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/uuid@v1.6.0/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0.3.12/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.17.0/LICENSE;md5=0dd48ae8103725bd7b401261520cdfbb;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/grpc-ecosystem/grpc-gateway/v2@v2.27.7/LICENSE;md5=c510a2a01572b82d27f28fd4d02ca318;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/hashicorp/errwrap@v1.1.0/LICENSE;md5=b278a92d2c1509760384428817710378;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-cleanhttp@v0.5.2/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-multierror@v1.1.1/LICENSE;md5=d44fdeb607e2d2614db9464dbedd4094;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-retryablehttp@v0.7.8/LICENSE;md5=bffc21c92b5f3adcbbb06f8e0067e786;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-rootcerts@v1.0.2/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-secure-stdlib/parseutil@v0.2.0/LICENSE;md5=2925e7910462fe55fcd3a652c4cf2a2d;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-secure-stdlib/strutil@v0.1.2/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/go-sockaddr@v1.0.7/LICENSE;md5=384a9beb4b0f73244fce13683da4c7da;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/hcl@v1.0.1-vault-7/LICENSE;md5=b278a92d2c1509760384428817710378;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hashicorp/vault/api@v1.22.0/LICENSE;md5=bffc21c92b5f3adcbbb06f8e0067e786;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/in-toto/attestation@v1.1.2/LICENSE;md5=1a161be702d6505e540097b42efb3a26;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/in-toto/in-toto-golang@v0.10.0/LICENSE;md5=7f23e46c93f32afcb729ca6c74f2ecfd;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/jedisct1/go-minisign@v0.0.0-20230811132847-661be99b8267/LICENSE;md5=0acd1ff194e0fd026c420d1b1396bdfb;spdx=MIT \
+    file://pkg/mod/github.com/jellydator/ttlcache/v3@v3.4.0/LICENSE;md5=4cea77626c625d583c98a85a8658f9d2;spdx=MIT \
+    file://pkg/mod/github.com/json-iterator/go@v1.1.12/LICENSE;md5=0b69744b481d72d30dbf69f84a451cfd;spdx=MIT \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.4/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.4/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.4/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
+    file://pkg/mod/github.com/kylelemons/godebug@v1.1.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/lestrrat-go/blackmagic@v1.0.4/LICENSE;md5=8144a188cc06dee37074f74ffc17c90e;spdx=MIT \
+    file://pkg/mod/github.com/lestrrat-go/dsig@v1.0.0/LICENSE;md5=9badcf00edde83118bdbae8ede880e37;spdx=MIT \
+    file://pkg/mod/github.com/lestrrat-go/httpcc@v1.0.1/LICENSE;md5=c1d03a9175ab48d85c699b2eb51ae56e;spdx=MIT \
+    file://pkg/mod/github.com/lestrrat-go/httprc/v3@v3.0.2/LICENSE;md5=b32dcc545c67b6bd57b30b946ad44e0b;spdx=MIT \
+    file://pkg/mod/github.com/lestrrat-go/jwx/v3@v3.0.13/LICENSE;md5=c94689f9bcf3eb6a81ad8f45767d5be3;spdx=MIT \
+    file://pkg/mod/github.com/lestrrat-go/option/v2@v2.0.0/LICENSE;md5=8144a188cc06dee37074f74ffc17c90e;spdx=MIT \
+    file://pkg/mod/github.com/letsencrypt/boulder@v0.20260223.0/LICENSE.txt;md5=b4cdc468055cdcf98982fc01770a84ad;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/mitchellh/go-homedir@v1.1.0/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=MIT \
+    file://pkg/mod/github.com/mitchellh/go-wordwrap@v1.0.1/LICENSE.md;md5=56da355a12d4821cda57b8f23ec34bc4;spdx=MIT \
+    file://pkg/mod/github.com/mitchellh/mapstructure@v1.5.1-0.20231216201459-8508981c8b6c/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=MIT \
+    file://pkg/mod/github.com/moby/term@v0.5.2/LICENSE;md5=4859e97a9c7780e77972d989f0823f28;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/modern-go/concurrent@v0.0.0-20180306012644-bacd9c7ef1dd/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/modern-go/reflect2@v1.0.3-0.20250322232337-35a7c28c31ee/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/mozillazg/docker-credential-acr-helper@v0.4.0/LICENSE;md5=c0b137aa60bc4d0c1f728a404e4c69fe;spdx=MIT \
+    file://pkg/mod/github.com/munnerz/goautoneg@v0.0.0-20191010083416-a7dc8b61c822/LICENSE;md5=0c241922fc69330e2e5590de114f3bf5;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/natefinch/atomic@v1.0.1/LICENSE;md5=18434e48fe4af02ba5f6e67f4b56f5f7;spdx=MIT \
+    file://pkg/mod/github.com/nozzle/throttler@v0.0.0-20180817012639-2ea982251481/LICENSE;md5=d2794c0df5b907fdace235a619d80314;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/oklog/ulid/v2@v2.1.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/oleiade/reflections@v1.1.0/LICENSE;md5=545647f4ac07f51f9c46992f3bcf342a;spdx=MIT \
+    file://pkg/mod/github.com/open-policy-agent/opa@v1.14.1/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/open-policy-agent/opa@v1.14.1/internal/edittree/bitvector/license.txt;md5=328867a460a981563d295f343199aad5;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/open-policy-agent/opa@v1.14.1/internal/gojsonschema/LICENSE-APACHE-2.0.txt;md5=f7a6312e0b85b17786de3ae15ab42bed;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/open-policy-agent/opa@v1.14.1/internal/semver/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/opencontainers/go-digest@v1.0.0/LICENSE;md5=2d6fc0e85c3f118af64c85a78d56d3cf;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/opencontainers/image-spec@v1.1.1/LICENSE;md5=27ef03aa2da6e424307f102e8b42621d;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/pborman/uuid@v1.2.1/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/pelletier/go-toml/v2@v2.2.4/LICENSE;md5=390892c6562af0d807e527b06d635f94;spdx=MIT \
+    file://pkg/mod/github.com/pkg/browser@v0.0.0-20240102092130-5ac0b6a4141c/LICENSE;md5=2c6b03e6a9b13bd75b50a8dbeed074da;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/pkg/errors@v0.9.1/LICENSE;md5=6fe682a02df52c6653f33bd0f7126b5a;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/protocolbuffers/txtpbfmt@v0.0.0-20260217160748-a481f6a22f94/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/rcrowley/go-metrics@v0.0.0-20250401214520-65e299d6c5c9/LICENSE;md5=1bdf5d819f50f141366dabce3be1460f;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/rogpeppe/go-internal@v1.14.1/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/ryanuber/go-glob@v1.0.0/LICENSE;md5=d2c81b3028eb947731a58fb068c7dff4;spdx=MIT \
+    file://pkg/mod/github.com/sagikazarmark/locafero@v0.11.0/LICENSE;md5=6e63b3f726f4acaf0ce766e25bcdaf04;spdx=MIT \
+    file://pkg/mod/github.com/sassoftware/relic@v7.2.1+incompatible/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/secure-systems-lab/go-securesystemslib@v0.10.0/LICENSE;md5=e9db53a054cb216b86f5212531da6b23;spdx=MIT \
+    file://pkg/mod/github.com/shibumi/go-pathspec@v1.3.0/GO-LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/sigstore/fulcio@v1.8.5/COPYRIGHT.txt;md5=3830a9ca4f9dc30be01bfa2e4042dd46;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/protobuf-specs@v0.5.0/COPYRIGHT.txt;md5=79a0324a945372989ac53fa7813090a6;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/rekor-tiles/v2@v2.2.1/COPYRIGHT.txt;md5=b52278561f2843315ac5021b4be699f5;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/rekor@v1.5.1/COPYRIGHT.txt;md5=3830a9ca4f9dc30be01bfa2e4042dd46;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/sigstore/pkg/signature/kms/aws@v1.10.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/sigstore/pkg/signature/kms/azure@v1.10.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/sigstore/pkg/signature/kms/gcp@v1.10.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/sigstore/pkg/signature/kms/hashivault@v1.10.5/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/sigstore-go@v1.1.4/COPYRIGHT.txt;md5=14403c66e6b22bac895a90b237ba9da0;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/sigstore@v1.10.5/COPYRIGHT.txt;md5=3830a9ca4f9dc30be01bfa2e4042dd46;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sigstore/timestamp-authority/v2@v2.0.5/COPYRIGHT.txt;md5=b658629ef1355c5c14f859e623e33da3;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/sirupsen/logrus@v1.9.4/LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0;spdx=MIT \
+    file://pkg/mod/github.com/sourcegraph/conc@v0.3.1-0.20240121214520-5f936abd7ae8/LICENSE;md5=c001385e94f81477d77ffaf4321c647d;spdx=MIT \
+    file://pkg/mod/github.com/spf13/afero@v1.15.0/LICENSE.txt;md5=920d76114a32b0fb75b3f2718c5a91be;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/spf13/cast@v1.10.0/LICENSE;md5=67fac7567cbf6ba946e5576d590b1ed4;spdx=MIT \
+    file://pkg/mod/github.com/spf13/cobra@v1.10.2/LICENSE.txt;md5=920d76114a32b0fb75b3f2718c5a91be;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/spf13/pflag@v1.0.10/LICENSE;md5=1e8b7dc8b906737639131047a590f21d;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/spf13/viper@v1.21.0/LICENSE;md5=67fac7567cbf6ba946e5576d590b1ed4;spdx=MIT \
+    file://pkg/mod/github.com/spiffe/go-spiffe/v2@v2.6.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/subosito/gotenv@v1.6.0/LICENSE;md5=0873257f40b8747d351ccc4288d06a40;spdx=MIT \
+    file://pkg/mod/github.com/syndtr/goleveldb@v1.0.1-0.20220721030215-126854af5e6d/LICENSE;md5=6b6b03a3c410317c558abe499de9b5a7;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/tchap/go-patricia/v2@v2.3.3/LICENSE;md5=9949b99212edd6b1e24ce702376c3baf;spdx=MIT \
+    file://pkg/mod/github.com/theupdateframework/go-tuf/v2@v2.4.1/LICENSE;md5=7da0b6aed5e17caf37a82737f6ea8bae;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/theupdateframework/go-tuf@v0.7.0/LICENSE;md5=da2aa24617ab5e82d2256f542bd06903;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/titanous/rocacheck@v0.0.0-20171023193734-afe73141d399/LICENSE;md5=6466139830f9cc7a388f07b29b2c65ce;spdx=MIT \
+    file://pkg/mod/github.com/tjfoc/gmsm@v1.4.1/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/transparency-dev/formats@v0.0.0-20251017110053-404c0d5b696c/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/transparency-dev/merkle@v0.0.2/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/valyala/fastjson@v1.6.7/LICENSE;md5=7780bf961575e8d21fbfb56f09632be7;spdx=MIT \
+    file://pkg/mod/github.com/vbatts/tar-split@v0.12.2/LICENSE;md5=19cd0ecd0a6c26052aec628b72e72881;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/vektah/gqlparser/v2@v2.5.32/LICENSE;md5=e2f8bb50fb8654dc33b36e08a6c85219;spdx=MIT \
+    file://pkg/mod/github.com/withfig/autocomplete-tools/integrations/cobra@v1.2.1/LICENSE;md5=6f8b2298f7dd18005cae2ec735eba325;spdx=MIT \
+    file://pkg/mod/github.com/x448/float16@v0.8.4/LICENSE;md5=de8f8e025d57fe7ee0b67f30d571323b;spdx=MIT \
+    file://pkg/mod/github.com/xeipuuv/gojsonpointer@v0.0.0-20190905194746-02993c407bfb/LICENSE-APACHE-2.0.txt;md5=f7a6312e0b85b17786de3ae15ab42bed;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/xeipuuv/gojsonreference@v0.0.0-20180127040603-bd5ef7bd5415/LICENSE-APACHE-2.0.txt;md5=f7a6312e0b85b17786de3ae15ab42bed;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/yashtewari/glob-intersection@v0.2.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/gitlab.com/gitlab-org/api/client-go@v1.46.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/auto/sdk@v1.2.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc@v0.63.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp@v0.65.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.41.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.41.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel@v1.41.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.uber.org/multierr@v1.11.0/LICENSE.txt;md5=721ac51ede11efb667ff53a866be23c4;spdx=MIT \
+    file://pkg/mod/go.uber.org/zap@v1.27.1/LICENSE;md5=a48e22dd4170c1eb095a423a50302852;spdx=MIT \
+    file://pkg/mod/go.yaml.in/yaml/v2@v2.4.3/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/go.yaml.in/yaml/v3@v3.0.4/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c;spdx=Apache-2.0 \
+    file://pkg/mod/golang.org/x/crypto@v0.49.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/mod@v0.34.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.52.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.20.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.42.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.41.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.35.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.15.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.269.0/LICENSE;md5=a651bb3d8b1c412632e28823bb432b40;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.269.0/internal/third_party/uritemplates/LICENSE;md5=4ee4feb2b545c2231749e5c54ace343e;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-20260203192932-546029d2fa20/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-20260217215200-42d3e9bedb6d/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/google.golang.org/genproto@v0.0.0-20260128011058-8636f8732409/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/google.golang.org/grpc@v1.80.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/google.golang.org/protobuf@v1.36.11/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
+    file://pkg/mod/gopkg.in/evanphx/json-patch.v4@v4.13.0/LICENSE;md5=96ae735ca1b4dcdb6b26f4ca4b8ba645;spdx=BSD-3-Clause \
+    file://pkg/mod/gopkg.in/inf.v0@v0.9.1/LICENSE;md5=13cea479df204c85485b5db6eb1bc9d5;spdx=BSD-3-Clause \
+    file://pkg/mod/gopkg.in/ini.v1@v1.67.1/LICENSE;md5=4e2a8d8f9935d6a766a5879a77ddc24d;spdx=Apache-2.0 \
+    file://pkg/mod/gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/api@v0.35.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/apimachinery@v0.35.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/apimachinery@v0.35.3/third_party/forked/golang/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
+    file://pkg/mod/k8s.io/client-go@v0.35.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/klog/v2@v2.130.1/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/pkg/internal/third_party/go-json-experiment/json/LICENSE;md5=9d210c7471ce08e3db5261f33bf8fce6;spdx=BSD-3-Clause \
+    file://pkg/mod/k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/pkg/validation/spec/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/utils@v0.0.0-20251002143259-bc988d571ff4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/k8s.io/utils@v0.0.0-20251002143259-bc988d571ff4/internal/third_party/forked/golang/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
+    file://pkg/mod/sigs.k8s.io/json@v0.0.0-20250730193827-2d320260d730/LICENSE;md5=545d3f23616dee7495323aeb0b098df3;spdx=Apache-2.0 \
+    file://pkg/mod/sigs.k8s.io/randfill@v1.0.0/LICENSE;md5=8f245a894b7d4f5880176fafd88faad8;spdx=Apache-2.0 \
+    file://pkg/mod/sigs.k8s.io/release-utils@v0.12.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/sigs.k8s.io/structured-merge-diff/v6@v6.3.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=b5d30dd5bc47d1b56b678ac06dead1c7;spdx=MIT \
+"
diff --git a/recipes-containers/cosign/cosign_git.bb b/recipes-containers/cosign/cosign_git.bb
new file mode 100644
index 00000000..09c28317
--- /dev/null
+++ b/recipes-containers/cosign/cosign_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Container signing, verification and storage in an OCI registry"
+HOMEPAGE = "https://github.com/sigstore/cosign"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/COPYRIGHT.txt;md5=3830a9ca4f9dc30be01bfa2e4042dd46 \
+                    file://src/${GO_IMPORT}/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    "
+
+GO_IMPORT = "github.com/sigstore/cosign"
+GO_INSTALL = "${GO_IMPORT}/v3/cmd/cosign"
+SRC_URI = "git://${GO_IMPORT};protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}"
+PV = "3.0.6+git"
+SRCREV = "f1ad3ee952313be5d74a49d67ba0aa8d0d5e351f"
+
+require ${BPN}-licenses.inc
+require ${BPN}-go-mods.inc
+
+inherit go-mod go-mod-update-modules
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.50.1 (Apple Git-155)


