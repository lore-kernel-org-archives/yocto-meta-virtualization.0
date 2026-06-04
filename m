Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65FACD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 12:52:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10662.1780577556422226705
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 05:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NXGbuWvY;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36ab8816a35so356638a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 05:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780577556; cv=none;
        d=google.com; s=arc-20240605;
        b=Zz8dMAek5cSA8pQdAa4Bo1j2T9ul1tFvZKSh/IRncmnFiz8MQ19TeipwhWrf19Rz8a
         zP0sSjzcvGDQd/kFgGJQTnqvENBol6t1nqOXf13FTdjZAZ51uxlADwMXnoUAvahPBdYL
         ngPgJrn+3VlaMdaRKkaI8TgJp/BmkWx0fqswRSIIt+pDz9xoNtk98NRbVVqEuxsx0MGw
         LaiETulCXYKjuw/xHj86kBAKVsW8y2J0ZEVifvddElXECO5BdaNQlAeX86tDCH7mQsDd
         JYJRpigAlY0Dy/yg2jeUoQDOkYRIOhbaFbMXfEwFaVCmHMSERgtvQEjNPY3xGoGxgA3m
         ToIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bbNM2v58P3ntrkdKTNgRTmOk8Hj3HS6IX27TlmaaYuY=;
        fh=DxRdbYpvaHIITytrWPyIPF9HTf5IcxABawiusvqypfM=;
        b=asYGmgAAfGp0gdMpjWFd9S8F9DV9askEzPVgRN3BE68uK0TMFywidV5uvxpsX7XoGj
         +exeDnWf7ojfXweo3+tVAcWK0VmR4CinRnAyzai7J+xajVb3Omfb/uE0OtoY4/mjl6Z6
         cTzeMMvQ5gHTWI2/V1lli9JQmnUMstczZy3IFL9hzT88SaptiF/Icr+TiTHZ7qI79+Gx
         BXX8j+xTF/DlzdNo//zS8c0FYiLEVB4bhCsS6+lTbYXdoGZcMS7XoU8RrQxZJc1b5b+3
         GQ70Aha5zLxbj/1FtzGJl7jnE8rvUfmsEjE0rkLhPwYI6ZfvRIFGhUL64Usys2tqKCAn
         v/VQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780577556; x=1781182356; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bbNM2v58P3ntrkdKTNgRTmOk8Hj3HS6IX27TlmaaYuY=;
        b=NXGbuWvYpziurNSQrtNyTmrRMmchhtaPcRg2JnbqGTFHuN/m2k1ciIeiLh/VVWMtTr
         IA/pj0j2qe0NEKoAA3CSAq9FnwHZISJ3Zg+ex8fnDAR9FgheBmuAfyZ6E5QO6FpGFRzf
         XAnbgiCCaxkOQRNSFqQw70JDOWZy1FbrrE2ildRWSKXjpqSBoOa0XNrUSkDxZoEAhVRt
         b25GBka++YQR7rbhIF2LQiuKjlD8Gb/xLuLARobEdGmG+cvEP2NHEe5EtcJqJuhfdvGJ
         OIzGkhNyQJcM6+NCi2EhASclsL4HTLBNduQuTXB5jRMyzt7KkmnbCYlxHmK810RJqIaV
         FOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577556; x=1781182356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbNM2v58P3ntrkdKTNgRTmOk8Hj3HS6IX27TlmaaYuY=;
        b=hfBKsjOkiT+UXXmtURkTVvJnUFybeFTno2Kq6VvKw4JHL0B4hJhkGv9xvcj4B7dJ3C
         xGlQzAMW2gRg/Up0JyBXxZZKF4JfiG1YDRAIrTTXXoJs0RSi8dQwq2c6e+tPp2c/True
         oTuTA96zT7os8i7gwtlEDWxe/h4352N79BFietDkDUy5TvQubaxEt70FK4YP2zrnFVfd
         Ku/NAhZijrEhev/WIfpwFjwX3AwiNAb+eYqM4MrNnw1eTvDkNv1TplNVnwQ/UGKPi7sx
         6E8PirNLb7/XQrP3huNgltMHoHGnF0p0SOogOP1waAbk00knBrBANCnmwmJ8nuiZo9Yp
         t6jA==
X-Gm-Message-State: AOJu0YyzhsNfhhbzW8pOhYJ2B8V+7VzfK2Q10tDoKjCwN2fKmZK1/UUv
	gp1cwG9wXb4r8jwdKOynHKCfSQ+mCVVWN6JqMu6e0fEDUvLH8KWHXpfpY5aT2iRYH8+vjbpXKZK
	mg2u7+NPWW6NpiTQgqPRo1TbL54zM0F8=
X-Gm-Gg: Acq92OF8VaGj+ckIEnjqigD7wFFx+MAEE2oUPTPPovthmtJtdFc3GqKSG3oJJ1sO12D
	fDOs+5VT/eliUXIvuemX2Eh2IaM73Z+F5mysjwGmVff9sQVVoqnceeAfsdt4Zqn6M28CP8WSVC4
	MdNfsRwcp3jtOz18vaO2DCCHyJ93192BttCgPsTs/B0JAreHhYn/sn12pNvaACTwHQMRP77jSrQ
	MRqvSwkAWm237WxuhwNDPbYh8EZjtwSJ21TI7JPaEjimVfC+CyTI+vQy7X+tT4iuNsLq/LkXoab
	Ws95+GOqKuPTwzaCkVMOj/QOeP4QnTXvHuoWMhFk5H3RbL6C2OWJGgHHOVlgn1h/qT9kAmKubr5
	TWcbjeq+Bw6KQDsxnlVNGcFbZdXzLj/pD5XOS
X-Received: by 2002:a17:902:b585:b0:2c0:a711:53d with SMTP id
 d9443c01a7336-2c163fa4df9mr56973175ad.23.1780577555391; Thu, 04 Jun 2026
 05:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <UeWl.1780549185744414138.ZP1e@lists.yoctoproject.org>
In-Reply-To: <UeWl.1780549185744414138.ZP1e@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jun 2026 08:52:23 -0400
X-Gm-Features: AVHnY4JFu9g6oaU0e2UyVY0zGd5xv_bWptik2yAP9sYIf8rXcdTkwwS11EpN0oA
Message-ID: <CADkTA4Nco-jJGC3TQOF+a=5MN7EioGAbDe=BTGaQZykDZsxgLA@mail.gmail.com>
Subject: Re: [meta-virtualization] [Question] container-bundle:
 CONTAINER_SERVICE_FILE silently dropped (do_unpack noexec)
To: mark.yang@lge.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000af2c6206536d04e7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 12:52:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9850

--000000000000af2c6206536d04e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 12:59=E2=80=AFAM mark.yang via lists.yoctoproject.or=
g
<mark.yang=3Dlge.com@lists.yoctoproject.org> wrote:

> Hello!
>
> On master there seems to be a contradiction between the
> CONTAINER_SERVICE_FILE docs and do_unpack in container-bundle.bbclass.
>
> The custom-service docs (bbclass header and docs/container-bundling.md)
> say to
> ship the unit like this:
>
>     SRC_URI =3D "file://myapp.service"
>     CONTAINER_SERVICE_FILE[myapp-container] =3D "${UNPACKDIR}/myapp.servi=
ce"
>
> But container-bundle.bbclass sets do_unpack[noexec] =3D "1", so the
> file:// is never unpacked into ${UNPACKDIR}. The do_install loop that
> copies
> custom services then fails its "[ ! -f $service_file ]" check, skips
> silently,
> and the bundle ends up with an empty container-bundles/<runtime>/services=
/.
>
> ..Or have I misunderstood how this is meant to be used?
>

I was placing the file through other means during development (explicitly
in a
task) that didn't make it into the final classes / recipes.

I'm just finishing up some system testing on upgrades in master-next, I
have a
fix and a new test for this that I'll push along with those changes.

Bruce



>
> Thanks!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9849):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9849
> Mute This Topic: https://lists.yoctoproject.org/mt/119641349/1050810
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

--000000000000af2c6206536d04e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 4, 2026 at 12:59=
=E2=80=AFAM mark.yang via <a href=3D"http://lists.yoctoproject.org">lists.y=
octoproject.org</a> &lt;mark.yang=3D<a href=3D"mailto:lge.com@lists.yoctopr=
oject.org">lge.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>Hello!<br><br>On master there=
 seems to be a contradiction between the<br>CONTAINER_SERVICE_FILE docs and=
 do_unpack in container-bundle.bbclass.<br><br>The custom-service docs (bbc=
lass header and docs/container-bundling.md) say to<br>ship the unit like th=
is:<br><br>=C2=A0 =C2=A0 SRC_URI =3D &quot;file://myapp.service&quot;<br>=
=C2=A0 =C2=A0 CONTAINER_SERVICE_FILE[myapp-container] =3D &quot;${UNPACKDIR=
}/myapp.service&quot;<br><br>But container-bundle.bbclass sets do_unpack[no=
exec] =3D &quot;1&quot;, so the<br>file:// is never unpacked into ${UNPACKD=
IR}. The do_install loop that copies<br>custom services then fails its &quo=
t;[ ! -f $service_file ]&quot; check, skips silently,<br>and the bundle end=
s up with an empty container-bundles/&lt;runtime&gt;/services/.<br><br>..Or=
 have I misunderstood how this is meant to be used?<br></div></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
 was placing the file through other means during development (explicitly in=
 a</div><div class=3D"gmail_default" style=3D"font-size:small">task) that d=
idn&#39;t make it into the final classes / recipes.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">I&#39;m just finishing up some system testing on=
 upgrades in master-next, I have a</div><div class=3D"gmail_default" style=
=3D"font-size:small">fix and a new test for this that I&#39;ll push along w=
ith those changes.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><br>Thanks!</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9849): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9849" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9849</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119641349/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119641349/1050810</a><br>
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

--000000000000af2c6206536d04e7--

