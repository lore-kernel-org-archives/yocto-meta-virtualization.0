Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABFDC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:13:54 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.6312.1692864833821239441
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 01:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id CBF685E135;
	Thu, 24 Aug 2023 10:13:50 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.33.18]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ5TQ-35eGKu0; Thu, 24 Aug 2023 10:13:48 +0200
Date: Thu, 24 Aug 2023 10:13:43 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: update from fuse2 to
 fuse3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	meta-virtualization@lists.yoctoproject.org
Message-Id: <VUYVZR.QDF6U5KVLHEQ2@t-online.de>
In-Reply-To: <CADkTA4PbL2QQDJDS6Jwhc0cvUq-thQ1Bt3onDP5tXa7QAZk7_Q@mail.gmail.com>
References: <20230822215534.475219-1-f_l_k@t-online.de>
	<20230822215534.475219-2-f_l_k@t-online.de>
	<CADkTA4PbL2QQDJDS6Jwhc0cvUq-thQ1Bt3onDP5tXa7QAZk7_Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uX1k1HxPi15eQavM/cFg"
X-TOI-EXPURGATEID: 150726::1692864828-BE7F7EAB-3AF8088D/0/0 CLEAN NORMAL
X-TOI-MSGID: fdd18f55-98a3-487d-bff2-a54c1452afca
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 08:13:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8227

--=-uX1k1HxPi15eQavM/cFg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I wrote a few lines about why I would like to do this.

On Wed, Aug 23 2023 at 10:28:02 PM -04:00:00, Bruce Ashfield=20
<bruce.ashfield@gmail.com> wrote:
> I'm ok with the change, but we need to document why we are making
> the switch in the commit log.
>=20
> Bruce
>=20
> On Tue, Aug 22, 2023 at 5:55=E2=80=AFPM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>>  diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb=20
>> b/recipes-extended/libvirt/libvirt_9.2.0.bb
>>  index 5e70470..9b5b2de 100644
>>  --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
>>  +++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
>>  @@ -156,7 +156,7 @@ PACKAGECONFIG[selinux] =3D=20
>> "-Dselinux=3Denabled,-Dselinux=3Ddisabled,libselinux,"
>>   PACKAGECONFIG[python] =3D ",,python3,"
>>   PACKAGECONFIG[sasl] =3D=20
>> "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl,cyrus-sasl"
>>   PACKAGECONFIG[numactl] =3D=20
>> "-Dnumactl=3Denabled,-Dnumactl=3Ddisabled,numactl,"
>>  -PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse,"
>>  +PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse3,"
>>   PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
>>   PACKAGECONFIG[libcap-ng] =3D=20
>> "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libcap-ng,"
>>   PACKAGECONFIG[wireshark] =3D=20
>> "-Dwireshark_dissector=3Denabled,-Dwireshark_dissector=3Ddisabled,wiresh=
ark=20
>> libwsutil,"
>>  --
>>  2.41.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#8220):=20
>> <https://lists.yoctoproject.org/g/meta-virtualization/message/8220>
>>  Mute This Topic:=20
>> <https://lists.yoctoproject.org/mt/100903758/1050810>
>>  Group Owner: meta-virtualization+owner@lists.yoctoproject.org=20
>> <mailto:meta-virtualization+owner@lists.yoctoproject.org>
>>  Unsubscribe:=20
>> <https://lists.yoctoproject.org/g/meta-virtualization/unsub>=20
>> [bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


--=-uX1k1HxPi15eQavM/cFg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I wrote a few lines about why I wo=
uld like to do this.</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On=
 Wed, Aug 23 2023 at 10:28:02 PM -04:00:00, Bruce Ashfield &lt;bruce.ashfie=
ld@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintex=
t" style=3D"white-space: break-spaces;">I'm ok with the change, but we need=
 to document why we are making
the switch in the commit log.

Bruce

On Tue, Aug 22, 2023 at 5:55=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f=
_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/=
libvirt/libvirt_9.2.0.bb
 index 5e70470..9b5b2de 100644
 --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
 +++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
 @@ -156,7 +156,7 @@ PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dseli=
nux=3Ddisabled,libselinux,"
  PACKAGECONFIG[python] =3D ",,python3,"
  PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl,cy=
rus-sasl"
  PACKAGECONFIG[numactl] =3D "-Dnumactl=3Denabled,-Dnumactl=3Ddisabled,numa=
ctl,"
 -PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse,"
 +PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse3,"
  PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
  PACKAGECONFIG[libcap-ng] =3D "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libcap=
-ng,"
  PACKAGECONFIG[wireshark] =3D "-Dwireshark_dissector=3Denabled,-Dwireshark=
_dissector=3Ddisabled,wireshark libwsutil,"
 --
 2.41.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#8220): <a href=3D"https://lists.yoctoproject.org/g/met=
a-virtualization/message/8220">https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8220</a>
 Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100903758/10=
50810">https://lists.yoctoproject.org/mt/100903758/1050810</a>
 Group Owner: <a href=3D"mailto:meta-virtualization+owner@lists.yoctoprojec=
t.org">meta-virtualization+owner@lists.yoctoproject.org</a>
 Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizati=
on/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<=
a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote>

<div>--=20
</div>- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
</div></blockquote></div>
--=-uX1k1HxPi15eQavM/cFg--


