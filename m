Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6682.1792695908043305677
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ETAqUTxj;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b056d58f2aso1684927b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792695907; cv=none;
        d=google.com; s=arc-20260327;
        b=UNuFGzW6CbPs1EJ4ow8V97/DIRrotq14whFAD49/L73+tFhqO0qvWEpQSdsDraNCQn
         AjZry3T5OLkK85xGqcWhcAzD+GuP+UJ/QchOp6XCojE6Uv7VWVIWIHnA0yvzBYyD0tGE
         4lEK3FujsZlR9DJ8rFQdB3W56KNcg8Nx4SkPvxx13QDKK20GUr7PcOTLtMJ+CJGHnnWP
         ocwdBu63TLpHoblKmFULWNqn7OAYukG/dOGuIbqFXLeh3GpIzwKS79Jlnvi8Odcqvreq
         Gr83dVPWP/IW/2ULEmVS/m3fBW3DX3r7WebHQRm1v4IRe3MAmVyb0JENYjts58+PYzYd
         Hocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vPbncfLeoV6HP8FApmtCETr61qGDXvWZvTqOgnlSesU=;
        fh=MocljtB3LfnSQwJLzCfRCgD0QziF/AEVBQ+6klcWCiQ=;
        b=aVahJZUhkFNzOJvKKW349j3fFxsdbntcXEsRmHB9qlnBB6uyYdFWOshrC7KJ/maqHV
         QYW2CgRHQugErnMVoeg9s/ewrypA/AVzpbCsoiFSZsL6MOBY1qK376XxRvgKXRW+3538
         ICClsMupgCr0H9s9WfMn2UMyIsV+M22P8COKMc7PSHI1Pw8gYNuxjf/BG/WnbAaX0xxH
         G+oLQcySoL+r1U6E+p3N24nx4sxSrlQ7pdMXuIvFeYQK4NrjzIhn+rlrFGr9pgBUZWWk
         rq6qTivxXG/tslOWFl7GSRbzKSVXGGZ8CFnRgXMoBXyIwLPYhn+VYLCdUBdsXxMFe1p2
         vJMw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695907; x=1793300707; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPbncfLeoV6HP8FApmtCETr61qGDXvWZvTqOgnlSesU=;
        b=ETAqUTxjkX55TSV7Fw75mkuLsdS9fgjAOgIjKdkuqpZdjBBcUceG8uNQoIhIah6A7n
         Kd/AFtewISTw/kxnA88Zv9lZJivpCIXyIbk3cMcNzvRjXtmLPLfK12kk7Rqh5e86lBky
         q1FCXoEelPhGmeolTnky+DSKd54ONY0hRLaPKU7S9ya/4yiQieGpa4EakKNzMk19GrOS
         EMAzwaEk2ppe4raPLtlVNPxXpXo3cvMFojlofygdLHM7ODAnMT9koGUuO6Cmo5cKy1+g
         XowHL/5MgdjNwf1ypKgoN6PuYwde5W1D5OzIruL3EIvIEksSdWBQwFuLS0p1MBzAQaI7
         ZInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695907; x=1793300707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vPbncfLeoV6HP8FApmtCETr61qGDXvWZvTqOgnlSesU=;
        b=Hp4U1Lna6HIYWn1HjhNweVbitYl7TJ+d5QnsnwqIQV4TnBvy7br8fIt5zd1THyHQlI
         EGPPYCKcoBlASLPpcVElqOuRiLclYqQ844piZ9OhZv9fpz5Fy3jUOrRpi7cbVTtHRlDy
         Z7f2K5LOCvEcNMgmoJaX0F9/jFiA0iBqT1IRwucqiTiYJSJnDSf47Zoe2kLRREN9yaMe
         mZkpC2ZrHdNB9oMkstcDnsC52akVor2/XnSDZG+jxPwsHT47bAN8AfS4mYOGCDkcBS2t
         NWyyRyoFClyL2/yhjVdGL0wY0rr/TLTsW4Y1kSzLzzaen7rgfR4vkFTlYSXSdGHCcRmE
         13Og==
X-Gm-Message-State: AFq9FYIDMj0oj6SDPjiWwMNgtQVPzsGl7yAP7wXczkz7mTWUh+Tzfqv4
	Bbi78uINeLo8BpCN1UgdrRXHPrUn4drhJq0QP/WM/b+TOpmnDonKuosiTI/Hz6YD1a7qoL9LJhU
	xo989mpc6dfR4Lic4ycR/+GsQLX0MFVw=
X-Gm-Gg: AYBFou2Ackvlf7oHErRwDhNcXovSs/12x0+PTBy/KfK484RhA5rEoDQeNAdwosP19Hz
	qt1zyQrOse3C8meisQYTopgLxnkMY7QkssKkiwHcuHLG40Zp3IGiA8Y8Ak5k70Dcwfw0r6ERCP3
	7xIFeEU5OUQ6YPLz3eB3l7FFiIOFQ/A+Xu6vA6rrMbUYxfcXDPxoHSm+gv2GKM4M2F9wWs2T4YD
	qqgjC1YwBBUKibrOKNO+c01DFdxrm8owOvsUAW/JAGNvP18Am7RqeqtXe4YHIeDqXnu0yEcuags
	1pp/+1SwR2I5vF8PNRJtaEsP37f2fR+T5hsKGbqWYJRk0quadrI+APeJh6efjKj6UjKp372V0ZB
	98VML35WV/QsIYnNPlv+lOLrspLnLHqy5mREV6ATcva75RbhMX6eAb73XovZLlevypL3zBaGyr+
	If9m31quYoe7PgnTTeO0MwmlDRqzge7i2TEJNa9VvCtq//G26rKKp5xgaJO3Hyv7FR7H0TRD8/W
	AHwGw==
X-Received: by 2002:a05:690c:6b12:b0:8ac:dbb9:21fd with SMTP id
 00721157ae682-8b1340e1d03mr33425667b3.104.1792695906734; Thu, 22 Oct 2026
 12:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260508055141.351-1-wangmy@fujitsu.com> <2546327.1792669432289997348@lists.yoctoproject.org>
In-Reply-To: <2546327.1792669432289997348@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Oct 2026 15:04:54 -0400
X-Gm-Features: AclHuK8UqM8skrmPi8-Iww1tkTahRHH-0WUH6nXj_zjFKYsGP22LcIoT47P3cAE
Message-ID: <CADkTA4OYHikE6HJNoCtGwoFw3ZcDYcTz=w-o5E=vFogWukDHVw@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH] iproute2:
 upgrade bbappend to 7.%
To: jonas.gorski@bisdn.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b61b00065e728a9e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10124

--000000000000b61b00065e728a9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:43=E2=80=AFAM Jonas Gorski via lists.yoctoproject=
.org
<jonas.gorski=3Dbisdn.de@lists.yoctoproject.org> wrote:

> Hi,
>
> On Fri, May  8, 2026 at 07:52 AM, wangmy wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Compatibility with OE-core nanbield.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../iproute2/{iproute2_6.%.bbappend =3D> iproute2_7.%.bbappend}     | =
0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-openstack/recipes-support/iproute2/{iproute2_6.%.bbappend =
=3D>
> > iproute2_7.%.bbappend} (100%)
> >
> > diff --git
> a/meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend
> > b/meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
> > similarity index 100%
> > rename from meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappe=
nd
> > rename to meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
> > --
> > 2.43.0
> >
> >
>
> This (and the qemu bbappend bump) prevent building from the wrynose branc=
h
> for me:
>
> ERROR: No recipes in default available for:
>
> .../meta-cloud-services/meta-openstack/recipes-devtools/qemu/qemu_11.%.bb=
append
>
> .../meta-cloud-services/meta-openstack/recipes-support/iproute2/iproute2_=
7.%.bbappend
>
> and indeed, wrynose is still at qemu 10(.2.0) and iproute2 6(.19).
>
> (Simple reverts should fix this).
>

Clearly I was on the wrong branch when I grabbed those.

I've reverted and pushed.

Bruce



>
> Best regards,
> Jonas
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10122):
> https://lists.yoctoproject.org/g/meta-virtualization/message/10122
> Mute This Topic: https://lists.yoctoproject.org/mt/119210120/1050810
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

--000000000000b61b00065e728a9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 22, 2026 at 7:43=
=E2=80=AFAM Jonas Gorski via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;jonas.gorski=3D<a href=3D"mailto:bisdn.de@lists.=
yoctoproject.org">bisdn.de@lists.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Fri, May=C2=A0 8, 2026 at 07:52 AM, wangmy wrote:<br>
&gt;<br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; <br>
&gt; Compatibility with OE-core nanbield.<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../iproute2/{iproute2_6.%.bbappend =3D&gt; iproute2_7.%.bbappen=
d}=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 rename meta-openstack/recipes-support/iproute2/{iproute2_6.%.bba=
ppend =3D&gt;<br>
&gt; iproute2_7.%.bbappend} (100%)<br>
&gt; <br>
&gt; diff --git a/meta-openstack/recipes-support/iproute2/iproute2_6.%.bbap=
pend<br>
&gt; b/meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend<br>
&gt; similarity index 100%<br>
&gt; rename from meta-openstack/recipes-support/iproute2/iproute2_6.%.bbapp=
end<br>
&gt; rename to meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappen=
d<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
&gt;<br>
<br>
This (and the qemu bbappend bump) prevent building from the wrynose branch =
for me:<br>
<br>
ERROR: No recipes in default available for:<br>
=C2=A0 .../meta-cloud-services/meta-openstack/recipes-devtools/qemu/qemu_11=
.%.bbappend<br>
=C2=A0 .../meta-cloud-services/meta-openstack/recipes-support/iproute2/ipro=
ute2_7.%.bbappend<br>
<br>
and indeed, wrynose is still at qemu 10(.2.0) and iproute2 6(.19).<br>
<br>
(Simple reverts should fix this).<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Clearly I was on the wron=
g branch when I grabbed those.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I&#39;ve reverted and pushed.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Best regards,<br>
Jonas<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#10122): <a href=3D"https://lists.yoctoproject.org/g/met=
a-virtualization/message/10122" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.yoctoproject.org/g/meta-virtualization/message/10122</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119210120/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119210120/1050810</a><br>
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

--000000000000b61b00065e728a9e--
