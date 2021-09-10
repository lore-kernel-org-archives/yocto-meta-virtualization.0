Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.5761.1631256568000460518
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 23:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Tn26bdVg;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631256568;
  x=1662792568;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Um1LD4/VmwKDffXk4NdROb6gzRtI9vnAYB0jhyNWXNM=;
  b=Tn26bdVg9tZQL2+DmdroWY//Waf9Pbw+3tD9STQMtEhZpT1v05fu83Wo
   n2Bq45UiFNF+eSBY/NgOeNXM6jOR+WI4IMLGO0Pl2B9qIRUTeVtohA9/6
   i63om9gDnnrjvNAfWtCqQ1Ny2tgidIGe6P5JUIvZRd3r4ks0Pe2GE4Ie5
   /USLoADoQ6+M+BwSMu/Hw8y5ll850L/4QY5DAacmX5nxJ0BcG9MpjPCPN
   cFlhqCGqEJxhwbMcEhID3AWwL+JEpnLHy/KW/s7i0Z3d2x05wWYtvg9gV
   UvEfRKW3BjlD9YoQJfePHAVTpHScR3T9LXjlflOgSRgx6ylRij3+FLVzI
   g==;
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: thoughts on k3s and supporting builds of more than one k8s version
Thread-Topic: thoughts on k3s and supporting builds of more than one k8s
 version
Thread-Index: AdemD/1H2LGwMJe9QbyuPP/WRlumVg==
Date: Fri, 10 Sep 2021 06:49:24 +0000
Message-ID: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi!

I was thinking about k3s, and now that the latest stable k3s is a Kubernete=
s 1.21 version:
Do we want to have recipes for multiple k3s versions? I'm thinking someone =
perhaps wants, say, 1.20 to go with a system with 1.21, while someone else =
perhaps wants 1.21 to go with 1.21 components.
And then have a common .inc-file with everything that is not individual for=
 the versions, and small recipes with the source revision and such for each=
 version.
What are your thoughts on this?

BR,

/Joakim
