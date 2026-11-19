Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.346.1795102533699436576
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 07:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=k64mOc+3;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 588803D815F7;
	Thu, 19 Nov 2026 10:35:32 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id T5pD1aOAeRbZ; Thu, 19 Nov 2026 10:35:31 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 714D63D81611;
	Thu, 19 Nov 2026 10:35:31 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 714D63D81611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1795102531; bh=dsOtRQf+510eiIKhuVOG+B7DnHOY8lqaJJ2dmiEw/MA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=k64mOc+3983WDbx+wuyiHA9ae4VQB3mbFNHBbmkgpp/NwoJ0CDRsaaM+q7PtoYV/G
	 Cx00pFS86Umas2tjzMymSw4770cO6Ib7Tvt6v7cqbLfZDSFoj+K2qXLxMvylfU1Ppa
	 FVow6RNDJnsIXUcEy9n1Fqn3SjzVIMWZZRxBY9ZCTvReGbmFihCEzAtU/PcHLulx+o
	 8dQMEmuIhF4C0ab5uyU+bmv1fUjtIyPTvoDOG8u5c/zutvOYUrVzVlJw8mm9YkiLxx
	 v1NtsI4lH/1WFfKcNF5PpR3FbmYozSBD5gPXgonKUZBokebXB5IKiOEIyJ20k4dQAU
	 ce0o8wM9Imjdw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id v3vUGTplyQsH; Thu, 19 Nov 2026 10:35:31 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 39E7E3D815F7;
	Thu, 19 Nov 2026 10:35:31 -0500 (EST)
Date: Thu, 19 Nov 2026 10:35:31 -0500 (EST)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Message-ID: <1294544681.753540.1795102531174.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <6afa820c.01036f89.11cd8a.6ff7@mx.google.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com> <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com> <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com> <6ada5b42.4bcc4235.70a25.8048@mx.google.com> <1074218742.1918618.1793711762503.JavaMail.zimbra@savoirfairelinux.com> <6afa820c.01036f89.11cd8a.6ff7@mx.google.com>
Subject: Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime
 bundle output
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_26ef4c72-32cb-41c0-bf68-4038f89abb76"
X-Mailer: Zimbra 10.1.21_GA_0426 (ZimbraWebClient - FF160 (Linux)/10.1.21_GA_0426)
X-Zimbra-Message-Verification: hash=SHA256;guid=MmI1OGQyMjRkMmIwNDU4ZmVkYmMyNjhjYWYxM2Q2Zjk0ZTIyZDQ2MjRjNTUzOTYyNmQ4YzNlZGNlZjZiODlhYw==
Thread-Topic: image-oci: add OCI runtime bundle output
Thread-Index: ca9aWgH+Vj05/l3xuqrvPTD0k7zY0Q==
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Nov 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10174

--=_26ef4c72-32cb-41c0-bf68-4038f89abb76
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Bruce, 

> The series is now on master-next. Testing it against your containers
> and reviewing it would be great.
I've tested the OCI runtime bundle support on master-next with our ISMS 
container. This is really nice! I was able to reproduce our existing 
runtime configuration easily using the new variables. 

The only issue I've found so far concerns rootfs ownership when using 
UID/GID mappings. For example, with: 

``` 
OCI_RUNTIME_UID_MAPPINGS = "0:231072:65536" 
OCI_RUNTIME_GID_MAPPINGS = "0:231072:65536" 
``` 

The generated config.json contains the correct mappings, but files such 
as rootfs/etc/passwd are archived with ownership 0:0, whereas I would 
expect 231072:231072 to match the configured mappings. 

Apart from this ownership issue, the bundle generation, runtime 
configuration, and installation worked well in this setup. 

Thanks for this implementation ! 

Tanguy 

--=_26ef4c72-32cb-41c0-bf68-4038f89abb76
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial,helvetica,sans-serif; font-siz=
e: 12pt; color: #000000"><div data-marker=3D"__QUOTED_TEXT__"><div>Hi Bruce=
,</div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;p=
adding-left:5px;color:#000;font-weight:normal;font-style:normal;text-decora=
tion:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">The serie=
s is now on master-next. Testing it against your containers<br>and reviewin=
g it would be great.</blockquote>I've tested the OCI runtime bundle support=
 on master-next with our ISMS<br>container. This is really nice! I was able=
 to reproduce our existing<br>runtime configuration easily using the new va=
riables.<br><br>The only issue I've found so far concerns rootfs ownership =
when using<br>UID/GID mappings. For example, with:</div><div data-marker=3D=
"__QUOTED_TEXT__"><div><br data-mce-bogus=3D"1"></div><div>```</div><div>OC=
I_RUNTIME_UID_MAPPINGS =3D "0:231072:65536"<br>OCI_RUNTIME_GID_MAPPINGS =3D=
 "0:231072:65536"</div><div>```</div><div><br data-mce-bogus=3D"1"></div>Th=
e generated config.json contains the correct mappings, but files such<br>as=
 rootfs/etc/passwd are archived with ownership 0:0, whereas I would<br>expe=
ct 231072:231072 to match the configured mappings.<br><br>Apart from this o=
wnership issue, the bundle generation, runtime<br>configuration, and instal=
lation worked well in this setup.</div><div data-marker=3D"__QUOTED_TEXT__"=
><br data-mce-bogus=3D"1"></div><div data-marker=3D"__QUOTED_TEXT__">Thanks=
 for this implementation !</div><div data-marker=3D"__QUOTED_TEXT__"><br da=
ta-mce-bogus=3D"1"></div><div data-marker=3D"__QUOTED_TEXT__">Tanguy</div><=
/div></body></html>
--=_26ef4c72-32cb-41c0-bf68-4038f89abb76--
