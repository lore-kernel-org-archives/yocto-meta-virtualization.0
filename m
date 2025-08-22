Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFDCA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 03:07:21 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.375.1755832037312103212
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 20:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XIFNAios;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b47174beb13so1147494a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Aug 2025 20:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755832037; x=1756436837; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sMwzX3S6oLwlxR8qBThQnRqpmDUEb89W7Wyfh2bR/wM=;
        b=XIFNAiosIiLfoxdJBQ35jY58hQVPxGXnolrjprRpjetSjhF7VBl6wWFX2ufcarPFRu
         8bMhRYXyHkW2Le/igMfwlP5lTsnqORjqvkErtUg+LmHEL10/3WgMC7m/ZLNB6Zh9tema
         YLlajhjdV3akukBiX+ffyugslzwK43TPdVoXx8y+B5yveaMXWN8tB1f+/9qIYENOuhxp
         aCqwF2/Qo3oeo51o45qI70t/1jIg3f1CcP19t6JF1ZRLRXmALSMQDHgbrOrbL6O/umwx
         9uuYc5kQQzYN4DQsaEhb5epz5NE7yqq8PPKvBPjXx2akMXxobwEbEI5+iXQ0s2KTJGXg
         HvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832037; x=1756436837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMwzX3S6oLwlxR8qBThQnRqpmDUEb89W7Wyfh2bR/wM=;
        b=Vc7XtXNqQ0rP811dwO+fLZRIhJ3OklTP3dKq/1pmAyWM4sc9mUxoWaATHuDTS6AyuC
         VQwXkqy2JDBRLMArhJvPNa3nbp7rK9G8BK2re5oSF2qbRDafhve1Al5cGghjxWUpCwDL
         HZMwRIY4n5rSwJAZqKRsKzdRj/fEG3Dz6jd6sdTEjigM6qZcuzkJy2LyvttMvVqYrnIu
         ZUh3Lg9TqbAosbNHKlNJUL15AhuyC4iTknO5e/gfklxQ8xYehqzmVZ/UuJ9zfoJYzDoc
         XDSMKfUgdTaQ8MwD+bfuEXrXNjoZGMNoDbHxbD/xFdf6EbMZnDUb/cmVUjrkQjoWlVCo
         Ysdg==
X-Gm-Message-State: AOJu0YxJL9QY4pa7yECHGIe+jQQUitclhCci5xF676PmZRYpOKE5fcTx
	ij5KlSCirz5SHXuise13y2Il8vEAod3CegPqfIHiDxIptBw4njugGgvji/XHdFIEwXsnWJv57tx
	Dlhjh4AfWqVsTm2Ox5Caj3VicMPWKKWY=
X-Gm-Gg: ASbGnct7eArgMJjHndLOLyfdgsYcLhFXy3yK5Q1V2alf7rMUClmHZTAVmlcNDZcr+E4
	HOTlhOpZD2wtCMB+Q60zGOd96+xlD/uDf9Ewn/c3SP9aTYULXfPk2DHyn7MemWz54Zjar3fW1cE
	/Xw5JTAYEvQq4wtjpYWWHJRYkPHMEHHYVFH5wA1VdZXF8DxnoBsoxhJAc7YhlJQ7XtdtLB0i3do
	HbSQuwiC1DXR8nm3f/3Azgm+9k11mt5wX8rzlI=
X-Google-Smtp-Source: AGHT+IHl6/rGpMPbutlPwBaN0JiZkosrG8D2cBDdDXnIVGIQT/zwxtXe07AUTNZvvq0/ZTosQn8L6EL1CwOPOsHjRQ0=
X-Received: by 2002:a17:90a:e703:b0:31f:12d:ee4f with SMTP id
 98e67ed59e1d1-32517749423mr2177288a91.23.1755832036409; Thu, 21 Aug 2025
 20:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANFVK79QdSO79V83OZW2ZoFC-Ey76Ypb+9BAFvg4Ko7v5rg89w@mail.gmail.com>
In-Reply-To: <CANFVK79QdSO79V83OZW2ZoFC-Ey76Ypb+9BAFvg4Ko7v5rg89w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Aug 2025 23:07:04 -0400
X-Gm-Features: Ac12FXxDTE5_VUBjpQXncrUsbmpCVASHNBj-dcD4n0hTZnNCqwUGV_2LVzZIBb4
Message-ID: <CADkTA4PJ4O5HbwL9LmfvNxWwXgXAp5sCZkQW=c7QPeOC+vWTJw@mail.gmail.com>
Subject: Re: [meta-virtualization] About rabbitmq (from meta-erlang) for meta-openstack
To: joaohf@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d0c970063ceb8041"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Aug 2025 03:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9355

--000000000000d0c970063ceb8041
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 8:45=E2=80=AFPM Jo=C3=A3o Henrique Ferreira de Frei=
tas via
lists.yoctoproject.org <joaohf=3Dgmail.com@lists.yoctoproject.org> wrote:

>
> Hi,
>
> I don't know if this list is the right place to discuss about meta-cloud-=
services/meta-openstack.
> The README from meta-openstack says here is the place.
>
>
You've got the right place.



> So, I'm the maintainer of meta-erlang layer and as meta-openstack uses
> rabbitmq-server from meta-erlang, I should say some words here.
>
> I'm planning the following changes on master branch:
>
> - rabbitmq-server: update from 3.11.28 to 4.1.3, trying to minimize the
> number of erlang-modules installed. Because I suspect the rabbitmq-server
> recipe is installing too much.
>
> - implement some imagetests to test basic rabbitmq features.
>
> I want to know if it's ok to meta-openstack users with the plan above. An=
d
> if 4.1.3 is compatible with the current meta-openstack version.
>

That's a good plan with me, I haven't done my refreshes on
meta-cloud-services yet, so I'll have a closer look then. But I don't
expect any issues.

It was an explicit decision when I removed the erlang bits from the layer,
so I have no concerns following your lead on the version.

Bruce



>
> Thanks
>
> --
> Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
> Campinas-SP-Brasil
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9354):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9354
> Mute This Topic: https://lists.yoctoproject.org/mt/114828224/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d0c970063ceb8041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 21, 2025 at 8:45=
=E2=80=AFPM Jo=C3=A3o Henrique Ferreira de Freitas via <a href=3D"http://li=
sts.yoctoproject.org">lists.yoctoproject.org</a> &lt;joaohf=3D<a href=3D"ma=
ilto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div><span><span><br></span></span></div><div><span><span>Hi,<=
/span></span></div><div><span><span><br></span></span></div><div><span><spa=
n>I don&#39;t know if this list is the right place to discuss about=C2=A0</=
span></span>meta-cloud-services/meta-openstack. The README from meta-openst=
ack says here is the place.</div><div><br></div></div></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">You&#39;=
ve got the right place.</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div><span><sp=
an>So, I&#39;m the maintainer of meta-erlang layer and as meta-openstack us=
es rabbitmq-server from meta-erlang, I should say some words here.</span></=
span></div><div><span><span><br></span></span></div><div><span><span>I&#39;=
m planning the following changes on master branch:</span></span></div><div>=
<span><span>=C2=A0</span></span></div><div><span><span>- rabbitmq-server: u=
pdate from=C2=A0</span></span>3.11.28 to=C2=A04.1.3, trying to minimize the=
 number of erlang-modules installed. Because I suspect the rabbitmq-server =
recipe is installing too much.</div><div><br></div><div>- implement some im=
agetests=C2=A0to test basic rabbitmq features.</div><div><br></div><div>I w=
ant to know if it&#39;s ok to meta-openstack users with the plan above. And=
 if 4.1.3 is compatible with the current meta-openstack version.</div></div=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">That&#39;s a good plan with me, I haven&#39;t done my refresh=
es on meta-cloud-services yet, so I&#39;ll have a closer look then. But I d=
on&#39;t expect any issues.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">It was an explicit decision when I removed the erlang bits from the laye=
r, so I have no concerns following your lead on the version.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br>=
</div><div>Thanks</div><br><span class=3D"gmail_signature_prefix">-- </span=
><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Jo=C3=A3o =
Henrique Ferreira de Freitas - <a href=3D"http://joaohf_at_gmail.com" targe=
t=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-SP-Brasil</div></div></div=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9354): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9354" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9354</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114828224/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114828224/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d0c970063ceb8041--

