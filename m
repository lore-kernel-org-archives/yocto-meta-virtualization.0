Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web09.11073.1638536678469872894
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 05:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=f/21H3ml;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: s.mueller-klieser@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1638536676; x=1641128676;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ArC1fqECQBTssTVNaenf6t83NyEbqOvGXpAPbr2acug=;
	b=f/21H3mlseg5FPE3yUcoqeyQ5Imn5fq8bZY8V1GA4/MqkLscTZoMBxtLPOmV/w8j
	EaN4Z4VnPJ5hwBziYe+be/DgoUXiiCp8PS8uoc6AXVZMVIcCsR2bVffQ9Uoo1CeP
	By3anNriS6jV8f0+cKgAWcau4ZSJO7BdLCoJX8HTrmE=;
X-AuditID: c39127d2-4ef327000000426a-bc-61aa15e45851
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id F9.8A.17002.4E51AA16; Fri,  3 Dec 2021 14:04:36 +0100 (CET)
Received: from lws-mklieser.phytec.de (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 3 Dec
 2021 14:04:36 +0100
From: "Stefan Mueller-Klieser" <S.Mueller-Klieser@phytec.de>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][hardknott][PATCH] oci-runtime-spec: fix url
Date: Fri, 3 Dec 2021 14:04:27 +0100
Message-ID: <20211203130427.8027-1-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: s.mueller-klieser@phytec.de
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Berlix.phytec.de (172.16.0.117) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42JZI8BQqvtEdFWiwftnmhaLvjxjdWD0mHnq
	EXMAYxSXTUpqTmZZapG+XQJXxrb3e9kL/rJX/F4s2cA4jb2LkZNDQsBEon3tM7YuRi4OIYFl
	TBI3j9xhh3CeM0pMvjwdyOHgYBPwkVg60xKkQUTAQOLcufnMILawgJdE7+VjjCA2i4CKxLT1
	e5hAbF4Be4nDf7dALZCXON+7jh0iLihxcuYTFhCbWUBTonX7b3YIW16ieetsZpBVQgIaEseX
	l0C0KkjM/T2RGcIOl3h76jfzBEb+WUgmzUIyaRaSSQsYmVcxCuVmJmenFmVm6xVkVJakJuul
	pG5iBAbY4Ynql3Yw9s3xOMTIxMF4iFGCg1lJhFd+5rJEId6UxMqq1KL8+KLSnNTiQ4zSHCxK
	4rz3e5gShQTSE0tSs1NTC1KLYLJMHJxSDYx9ip0Cyr8Xd66VeCsYOcM2Vkv86hyt/Z/sLqUv
	ky08EKldrSIkLttbIuG5YMnfEjfO9C+mSbMnbBL08lq5OSL+/jX2nBOfrvd77f7P4hkaszju
	59E9T9nZjVyWy5pvj5P5K/iTdfGUWef2pySt+/Fh8e89FROP6wZzMG+Z/osrmY3pWMOB2TeV
	WIozEg21mIuKEwE60/f7HgIAAA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Upstream renamed master to main and github will remove the git protocol.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
index c4083c09d818..99f309772310 100644
--- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
+++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3Db355a61a394a504dacde901c9
 SRCNAME =3D "runtime-spec"
 
 PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
-SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME}"
+SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps;destsuffix=3Dgit/src/${PKG_NAME}"
 
 SRCREV =3D "78ab98c0761136f84e6e21b24b4dcd0be68ab782"
 PV =3D "v1.0.1+git${SRCPV}"
-- 
2.20.1

