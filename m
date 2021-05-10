Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.28495.1620632041820281787
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 May 2021 00:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=IGWJW+qE;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 20A6F38C084A
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1620632040;
  x=1652168040;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=/mOwG0pWGjklcRwHcEV1Ply8PTqV9xF15d2yn0NB6KI=;
  b=IGWJW+qECekW7ZkB+bQnKOTE9UBZzK+qChzxrEqkO6liZcCXhhhgrY7p
   WnMwlj754Lk8nCzH5HWkwpkZ7S2p3Zxzr/h74GvmV3aFRUqWxtU9CxgaZ
   aqHcTx53F6txKM12AvlMKQVrigOh/MZcAUgY4xpRzKn+fHjf0FV3Lx6Yq
   lo2lPzsNo4/DZHmXqMoWPvqYDpnaBMSAhKgt+El7sWzmadV28zmu2nLST
   5ug4KUKCfJmD+XG0g7Tm/4mub/Ud+7j54RqtAZ57vYI2lwculpC13oZsn
   AQEo61FKDbrPrVlOYWamz9Q9ZGoLcVK10A8hIGVGXXY4Qqg9CgVDMloTO
   w==;
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: nerdctl
Thread-Topic: nerdctl
Thread-Index: AddFbn50x170p45uSayvU8tiTOynxQ==
Date: Mon, 10 May 2021 07:33:57 +0000
Message-ID: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi!

On KubeCon Europe, there was a lot of talk about nerdctl (https://github.co=
m/containerd/nerdctl) in various places, and it indeed seems like a nice to=
ol when working in containerd-only environments (yes, I am one of those who=
 find crictl a bit cumbersome to cooperate with). Is nerdctl something that=
 would be interesting to get into meta-virtualization? Perhaps somebody is =
already working on this?

BR,

/Joakim

