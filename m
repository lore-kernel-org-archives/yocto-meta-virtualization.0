Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E5CD98C7
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 03:56:17 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102808.1781409371670513204
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 13 Jun 2026 20:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TXowXc4r;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66077e888b2so2031549d50.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 20:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781409371; cv=none;
        d=google.com; s=arc-20240605;
        b=lOJVwUVALwUvbByYpGbTKEZYTqfOiBACsP3amjHDrk7UpI0h6IMz2wUL6/PeAJLmln
         Hg9hjUz/DLGcAhvSld3w06pwzptgiWFlv6q/yoEDS4rNsFsLd88RGKlk1WF72KaSr7ub
         5hPgyrCwPf/zurBuC9PMYwBqxkr5c+kGoeOE9rybGvOSCIBoCq+dugwuNmfVOZH22VWL
         zTaBrV1OYAJ4EuOmX3TUXE0MhzkR7ucwFi685Okmd46iKZTS76f7JnRU6VVFTxPBN27f
         2j0RY4GjRH5eW2+T/iJE0xOoqtosQ3IbEK3eDk/mz6oLptsSXwnOusycvHyfQVUE/mVR
         wfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PreQ4d6VM5OHrJlwKG/4jNNu/PTWPLX84jmeSWMjLHU=;
        fh=Ti9E3UEbsPmawEmnjYgqZildcTQW4Ldn+Ux8FKiWujk=;
        b=Qa9389iRLNzaG0A6i/ZFDm87mHiu2IZeYzARy1PIKVoVg0IFG3IbhBMYoxWMPgeeVR
         T2s/of0G29eFUMvB7ami5vOdUOP29azMc8wihMiTyQ4EhDNlveC4AfYi5m/r2IMAxdXy
         C9n19q2bWsxE/hL80XOeJ56J+EuIc6Tny6PDDtH1bYuqyxKijszmwKOUigpDg9gn8aEi
         3K7Yk2xrfHk4R+WzDqHf94lmOw99RoLvc66SEeufKhcrYauWDCID20JYCukZhXoLe5mW
         9XIyLSI/s8IBoMWPGaRTuV439emFSbIYJcxLlZzBHLN9FVcy/+v4owKEJqfE9GISkvCY
         lCvg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409371; x=1782014171; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PreQ4d6VM5OHrJlwKG/4jNNu/PTWPLX84jmeSWMjLHU=;
        b=TXowXc4rBWMFrtLyGmBVELDnGJv4rlbfTDMl9K8s01uy2+EKUF/XypdHAMTRwdB9Ok
         Rm4c6SyWJmT0B7JT57a1La5/0d2mvkaHAccaynktPGCMAygZVkNxq7H3NEdCzgzs89so
         bpGfKbD0gyOPuvQ85mUxpT+cBWY59ZLvDktMrwf3KEoC9QTK7wDsb4RF49D+qXbQWl1G
         MkLxb+GhsTRTPGozoAqAsNfwfWc6A5U9LNeMWFK0YP74dusk1e9ihwntp7jN7Zseookv
         vFzKTTKEkagINwJ8EzEGpLYpA2qYbS1TqkSkZR76tMftEBIy3uFwccLF9KJk/a1IPH9K
         ZbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409371; x=1782014171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PreQ4d6VM5OHrJlwKG/4jNNu/PTWPLX84jmeSWMjLHU=;
        b=C+fNc/THYnLOWVKP59W17VKDo57x1dG6eCa0RNgnbNbTUF+aKUCZraihuCWfI+XBJA
         kQrq4/MgoYK6nod4m5TP+ROf2Obr5TGp5BlY5Be35ByYfziSGCrswh0ZwovQTcHIFtDE
         cGqeSlEQHns7G3Wt42g46fBBwHakW1ayi1GG9qKOarZhjn26E032w+YSys+QDGUGD+lE
         F4yPHJ5iOeefoGUVelwH6vDnTNfjaUut2AWMdTc7/a3W+DUH6uP4nB5028/UDydB3g45
         UBMFTYEmxT0o3HX368G9+SCf2BpTU5O5aTKhbrIZol56bPGc3kUf2eDzEn7p20pSdLmW
         S+Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+tVVgQk/3Ry0iswl77iWXrO/J0vT3R0f1HZeANxd4CgiSwLJGNBUfONmwduAY2dY+jAu8nl7pJ6/ZO6bwfrMvMc8/L@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwiYCCO03jH3EahcozJZiIo5dv7Jz78LA7D+BiAxlC29rE+mxHp
	2sMch8WnPMqbklWLf4b/7JCJgzt/TeX+TMb4lXSWHeOSoDIqMcjUJLA8FzJoxa/ePGn8xz8Sv1T
	73AtkFXyr0Pu13bgN2Ry4bQeSNavWjA4=
X-Gm-Gg: Acq92OEfDsroE9VH04X8z49l2eRqj9DO3UINhFXwl5zB9nFZ1G4ewJVZyrx42XxdFmG
	SfkzG3n0+rrojJiz2okoOhOGNKSmN6WEj9KkVvJtYjAYHglNW+5l4mZxl3+gbzj5Xy6a6CB0+mf
	NvKwVXF9UjXl9t4k9E35hvRY+EF6le2YisMhILR0JFNZlU3gTedGLQv7JlI8C0Swlnd9THCK7NM
	al23XgKuvOQRspttOYWkDEqG+cvPI14X9oHnMOL285vKqbfZHn/eqwri6rRK/kPoJJ9A2KGpghH
	ERUkaHJWA0ussfrNVWAb/Cef4WMUBzcPKgN/MrSrCmZmrnXehlHzR1Ev4Z8aVMqP/KePbWY9GyS
	QBOobs28SV80Hf0SBsU05HclGNg==
X-Received: by 2002:a05:690e:b8a:b0:660:7497:b786 with SMTP id
 956f58d0204a3-662782d49b6mr7914494d50.31.1781409370603; Sat, 13 Jun 2026
 20:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <e5d18f05-f00f-45df-a4c1-c2d21ca17de7@gmail.com> <18B8C5CCA74FA3D2.312216@lists.yoctoproject.org>
In-Reply-To: <18B8C5CCA74FA3D2.312216@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 13 Jun 2026 23:55:57 -0400
X-Gm-Features: AVVi8CcnFokyiEnnH97TB5PYRrTPFRipEHihZcOW5ztMV22dtxkfXsmi2112qRo
Message-ID: <CADkTA4N=2x5+PdfYdK5a3yS0-jd0c_k1FAV_0Z26FCx4wha2_A@mail.gmail.com>
Subject: Re: [meta-virtualization] lxc: starting a container errors out
To: bruce.ashfield@gmail.com
Cc: fntoth@gmail.com, 
	meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000bc031006542eb02b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 14 Jun 2026 03:56:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9892

--000000000000bc031006542eb02b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 6:52=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> On Sat, Jun 13, 2026, 3:34=E2=80=AFp.m. Ferry Toth via lists.yoctoproject=
.org
> <fntoth=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> root@yuna:~# lxc-create --name mycontainer --template download -- --dist
>> ubuntu --release resolute --arch amd64
>>
>> mktemp: failed to create file via template '-d/tmp.XXXXXXXXXX': No such
>> file or directory
>>
>>
>> This can be traced back to
>>
>> - DOWNLOAD_TEMP=3D"${DOWNLOAD_TEMP}$(mktemp -d)"
>>
>> + DOWNLOAD_TEMP=3D"$(mktemp -p ${DOWNLOAD_TEMP} -d)"
>>
>>
>> in patch "templates-actually-create-DOWNLOAD_TEMP-directory.patch."
>>
>> At this point in the code it is guaranteed that DOWNLOAD_TEMP is unset.
>> And `mktemp -p -d` results to the above error (on linux).
>>
>> The patch needs to be dropped.
>>
>
>
> So send a patch.
>
> lxc is functional for other use cases master-next is passing sanity for
> incus/lxc and I'll need to confirm those paths against any changes.
>
>
I've created some better unit tests for lxc, rather than relying on incus.

I've also dropped the patch, as both types of testing are passing.
master-next has the changes. They should be in master early next week.

Bruce



> Bruce
>
>
>> Ferry
>>
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9891):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9891
> Mute This Topic: https://lists.yoctoproject.org/mt/119792692/1050810
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

--000000000000bc031006542eb02b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 13, 2026 at 6:52=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><d=
iv><div><br></div><div><br></div><div>- Thou shalt not follow the NULL poin=
ter, for chaos and madness await thee at its end<br>- &quot;Use the force H=
arry&quot; - Gandalf, Star Trek II<br><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 13, 2026, 3:34=E2=80=
=AFp.m. Ferry Toth via <a href=3D"http://lists.yoctoproject.org" target=3D"=
_blank">lists.yoctoproject.org</a> &lt;fntoth=3D<a href=3D"mailto:gmail.com=
@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
root@yuna:~# lxc-create --name mycontainer --template download -- --dist <b=
r>
ubuntu --release resolute --arch amd64<br>
<br>
mktemp: failed to create file via template &#39;-d/tmp.XXXXXXXXXX&#39;: No =
such <br>
file or directory<br>
<br>
<br>
This can be traced back to<br>
<br>
- DOWNLOAD_TEMP=3D&quot;${DOWNLOAD_TEMP}$(mktemp -d)&quot;<br>
<br>
+ DOWNLOAD_TEMP=3D&quot;$(mktemp -p ${DOWNLOAD_TEMP} -d)&quot;<br>
<br>
<br>
in patch=C2=A0&quot;templates-actually-create-DOWNLOAD_TEMP-directory.patch=
.&quot;<br>
<br>
At this point in the code it is guaranteed that DOWNLOAD_TEMP is unset. <br=
>
And `mktemp -p -d` results to the above error (on linux).<br>
<br>
The patch needs to be dropped.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">So send a patch.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">lxc is functional for ot=
her use cases master-next is passing sanity for incus/lxc and I&#39;ll need=
 to confirm those paths against any changes.</div><div dir=3D"auto"><br></d=
iv></div></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I&#39;ve created some better unit tests for lxc, rath=
er than relying on incus.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>I&#39;ve also dropped the patch, as both types of testing are passing. mas=
ter-next has the changes. They should be in master early next week.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto=
"><div dir=3D"auto"></div><div dir=3D"auto">Bruce=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Ferry<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9891): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9891" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9891</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119792692/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119792692/1050810</a><br>
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

--000000000000bc031006542eb02b--

