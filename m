Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681DAEDEC07
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 04:46:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37439.1772685995148071807
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 20:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Spb2bmsJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3597fea200dso3333178a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Mar 2026 20:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772685994; cv=none;
        d=google.com; s=arc-20240605;
        b=hkQX28Qk32Ax7m8Vi9pMNKK3HJ0Pb+90Czv/gx3O1vjBRWTcvVFvd5lEXZgwb8C4tr
         UX4c9eOvjM2oqfJkG1dD/C1IIw/44v3DYKvHj7TX6dwuXNPYgt6xkqr6Ow1T7bYQOw/p
         ylyKEuUE0tgt5qZkJF37a/xgLUXsjoqq/+9j0+lRDSdaFrA9yUZXoQUhIjbYZj3UGy7I
         M7fWhfoqhsk6Lv5B4Q3zhYHp1trZiVKodecqXliU0DTaX/6v+n5r9i4C8KSq/aqmu5aD
         aG8i2ZNa15CehWVdOrUBftEO24hF9+BqTjiQpHswJgQoEQ+HKv9TFbw8TJluRrMtpCaN
         hVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XIu+z+gcPSIs5VBAtH/UBiTpcxjTXSTFW36LQ+y6Vks=;
        fh=7rUXyIN8yPrkPFs8eWTCazGJB3tnaNHYOq9MfP6n69o=;
        b=QWZ8cAx/1fIzkBEwn2Q5QW5EIZKbREZpOUk50tpsLUmwaHswletguoIPIo8Dh7aKZ1
         8/ivv4NhnGb2EakWqUigMGGQHgPJH8ofyn/j19DII6JNFjF3IF2RCDEfyYBHe2zkwsT6
         aA9R2uTj/Ezkzr+P04meKR3pox/7DYJ+PoFvURHhPuKZ6SseArTPRgV5zFwuaPsnRFks
         C3thFdn6bn+wK4krIz248V7v/5LMOWPtaFRgkknT7IG/axjcca2HL40BGvCTsF4uNnFn
         4RDorH72REVYf0t0IbJ4QswURHY9Rb5Y4K/nkvHqYazpIhp8CJi/HQ0Zg8rwi4FKEiVu
         jwKQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772685994; x=1773290794; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIu+z+gcPSIs5VBAtH/UBiTpcxjTXSTFW36LQ+y6Vks=;
        b=Spb2bmsJtxQwTFnsIKPFM2yHJOcucDWPNnVAVynVKjFYA/ggqZNlpkQgICDtZI7TkK
         yuyKMwfzxhnSD0L8B44eVvZdWXLRMgezu+gTWXigENRQCZwseKeKyBZXUnhL9nq7ruYU
         KhD7+8CvajBn7O9OP5ePqDJto/JxTtJ7pjKBfhf24n6LnUrMxlRXghOrhCYpA+OY42QQ
         EYyUNmJKRySXO2dNOk75eWBUa0HHDEoUqvZVeROhweHTYrNR/CQcqvxPPPC2xO6q525a
         3ll48HoBmi7YqkTiOB5LSKMVOieQ1SZpmNObw+/17YJ5WEXckF5Ebj5oM6FZius6k+Pe
         YTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772685994; x=1773290794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIu+z+gcPSIs5VBAtH/UBiTpcxjTXSTFW36LQ+y6Vks=;
        b=ADX56WMaAIzzItrCB2ZWNIJL2VkjKTYL6odbrcSVJNh6fBhoG8QuhTd9LWgHD9Iw9h
         ACVH0kdB+1ZzS/F/AIJeTbU0YFL6hD64QUo9jnXITnmqpYeoyTFr5d7qN7WIl7qpwQUb
         2ckwgtvUZWNZFc2cOquQ3P/TTmNIXc1T60/ymS706zMiio+Mr7+sravK+Qv2GY8g2caO
         s2FIOYR5cyqyrQHxqDs/BTtjnnfHBBZSPNureuTWLEXiZZsja9s41MJZuAmjeG+pEljh
         Z4hfza72yxZ12KLZEdNNBkKjxlavLtJrYlLX+etdzkutZ+8EYYW6BtB4dcnHOF4/eFS+
         zh+A==
X-Gm-Message-State: AOJu0YwUfuQUtnvypQua9ZxK0yqW0GmBWlRkFlARMQQV5sxTXnDV3kjS
	q3Yi8g9D/CFW0wvEZvY/taFT7BkWDiN9xaAwaAKr/1N0tKzxKdeTFXdl4YD5VVuwpXJ1gEM+DuT
	xa5u+F46+JX1yjzGRwNtWqrfOS9TzOSU=
X-Gm-Gg: ATEYQzxzB3LsG9SE2W7Wt5p/Kyui8f2w6sbe3fi0cJJ8Mr931mcrzUuaxLn1JScK4Pk
	j9qEdquGlOlcQ/SrdP/xVcEtnW+JZanJ1QZH9R53SYeXFOMdoakjZ8SoCqSpDszm9chNV/HWPlp
	HmOAgFnmOG9alCFhh5SvB3al44t4lWiTFU5TQXvNX+wSRRE5gvRuJ7OuixdFytxw8u0Xq4Y0pg5
	GJC/gTK3jmTGKXRLg3uxUi/+QVxQ23445SX6z/uGiA4QhtF59K4/bLDIo7unUeGzrg3kpER2pdM
	Hn0ECg+Nl3HbCs9f0z1+HxwpozFxrpGXPlLYRbOs
X-Received: by 2002:a17:90b:4c49:b0:354:a546:5edd with SMTP id
 98e67ed59e1d1-359a69c1d30mr3871265a91.11.1772685994284; Wed, 04 Mar 2026
 20:46:34 -0800 (PST)
MIME-Version: 1.0
References: <20260305043012.1186651-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260305043012.1186651-1-dmitry.baryshkov@oss.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Mar 2026 23:46:22 -0500
X-Gm-Features: AaiRm51wTpvMhrs-CtmiZm5xE4wRIlwbJpQKXtLfnf31FTEQvRAH5026o5kuhZU
Message-ID: <CADkTA4PUr4idtuhR784CP_GEtUjsaz12rk69JZHCC8zhqSgR_g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-guest-bundle: require "xen" DISTRO_FEATURE
To: dmitry.baryshkov@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fcdc19064c3f9e70"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 04:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9619

--000000000000fcdc19064c3f9e70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 11:30=E2=80=AFPM Dmitry Baryshkov via lists.yoctopro=
ject.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:

> Building guest bundles makes sense only if "xen" feature is enabled in
> DISTRO_FEATURES. Skip all Xen guest bundle recipes if it is not a part
> of the DISTRO_FEATURES.


Sure, but you are just describing what is in the patch.

What problem was this actually causing ?

Bruce



>
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  classes/xen-guest-bundle.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/classes/xen-guest-bundle.bbclass
> b/classes/xen-guest-bundle.bbclass
> index 3fe7754e61bb..da131c373de4 100644
> --- a/classes/xen-guest-bundle.bbclass
> +++ b/classes/xen-guest-bundle.bbclass
> @@ -269,6 +269,9 @@ python __anonymous() {
>          d.appendVarFlag('do_compile', 'depends', '
> virtual/kernel:do_deploy')
>  }
>
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES =3D "xen"
> +
>  S =3D "${UNPACKDIR}/sources"
>  B =3D "${WORKDIR}/build"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9618):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9618
> Mute This Topic: https://lists.yoctoproject.org/mt/118147344/1050810
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

--000000000000fcdc19064c3f9e70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 4, 2026 at 11:30=
=E2=80=AFPM Dmitry Baryshkov via <a href=3D"http://lists.yoctoproject.org">=
lists.yoctoproject.org</a> &lt;dmitry.baryshkov=3D<a href=3D"mailto:oss.qua=
lcomm.com@lists.yoctoproject.org">oss.qualcomm.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bu=
ilding guest bundles makes sense only if &quot;xen&quot; feature is enabled=
 in<br>
DISTRO_FEATURES. Skip all Xen guest bundle recipes if it is not a part<br>
of the DISTRO_FEATURES.<span class=3D"gmail_default" style=3D"font-size:sma=
ll"></span></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Sure, but you are just describing what is in the pa=
tch.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">What problem was thi=
s actually causing ?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0classes/xen-guest-bundle.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/classes/xen-guest-bundle.bbclass b/classes/xen-guest-bundle.bb=
class<br>
index 3fe7754e61bb..da131c373de4 100644<br>
--- a/classes/xen-guest-bundle.bbclass<br>
+++ b/classes/xen-guest-bundle.bbclass<br>
@@ -269,6 +269,9 @@ python __anonymous() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_compile&#39;, &#3=
9;depends&#39;, &#39; virtual/kernel:do_deploy&#39;)<br>
=C2=A0}<br>
<br>
+inherit features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;xen&quot;<br>
+<br>
=C2=A0S =3D &quot;${UNPACKDIR}/sources&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9618): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9618" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9618</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118147344/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118147344/1050810</a><br>
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

--000000000000fcdc19064c3f9e70--

